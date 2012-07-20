=begin
  Adds the ability to call events by name (as they are defined in the editor)
  This is done by inlining the call, making it possible to jump from one context
  to another, and then back. Something that oterwise only is possible through
  the use of common events.
  
  Names are case insensitive My_Event will match my_event and MY_EVENT.
  Names can be shared by multiple events, all will be executed when called.
  
=end
class Game_Event < Game_Character
  def name
    return event.name
  end
end
class Interpreter
  def call_common_events_by_name(event_name)
    # a common event is a page
    return call_page(*get_common_events_by_name(event_name))
  end
  def get_common_events_by_name(event_name)
    @@__common_events__ ||= {}
    if @@__common_events__.empty?
      index_common_events
    end
    return @@__common_events__[event_name.downcase.strip]
  end
  def index_common_events
    @@__common_events__ = {}
    for common_event in $data_common_events do
      common_event_name = common_event.name if common_event != nil
      if common_event_name != nil and not common_event_name.empty?
        (@@__common_events__[common_event_name.downcase.strip] ||= []) << common_event
      end
    end
  end
  def call_events_by_name(event_name)
    return call_event(*get_events_by_name(event_name))
  end
  # Get events sharing a name
  def get_events_by_name(event_name)
    @@__map_events__ ||= {} # the maps events indexed by name
    if @@__map_events__[:map_id] != $game_map.map_id # create a new index in non exsist for the map
      index_events
    end
    return @@__map_events__[event_name.downcase.strip]
  end
  # Get an event at the given index
  def get_event_by_index(index)
    return game_map.events[index]
  end
  def index_events
    @@__map_events__.clear
    @@__map_events__[:map_id] = $game_map.map_id
    # Index map events based on name (note that names doesn't have to be unique for an event)
    $game_map.events.each do |index, map_event|
      (@@__map_events__[map_event.name.downcase.strip] ||= []) << map_event
    end
  end
  # execute event passed
  def call_event(*events)
    pages = []
    for event in events
      pages << event.page if event != nil
    end
    return call_page(*pages)
  end
  # execute page passed
  def call_page(*pages)
    list = []
    for page in pages
      list += page.list if page != nil
    end
    return call_command(*list)
  end
  # execute list passed
  def call_command(*commands)
    # Return false if the list of commands is empty, or starts with an empty command
    return false if commands.empty? or commands[0].code == 0
    # Make child interpreter (i.e. make it running under the current interpreter)
    @child_interpreter = Interpreter.new(@depth + 1)
    @child_interpreter.setup(commands, @event_id, 0)
    return true
  end
end
class Game_Event
  attr_reader :page
  # check if the condtions for the page are met
  def condition_met?(page)
    c = page.condition
    # Switch 1 condition confirmation
    if c.switch1_valid
      if $game_switches[c.switch1_id] == false
        return false
      end
    end
    # Switch 2 condition confirmation
    if c.switch2_valid
      if $game_switches[c.switch2_id] == false
        return false
      end
    end
    # Variable condition confirmation
    if c.variable_valid
      if $game_variables[c.variable_id] < c.variable_value
        return false
      end
    end
    # Self switch condition confirmation
    if c.self_switch_valid
      key = [@map_id, @event.id, c.self_switch_ch]
      if $game_self_switches[key] != true
        return false
      end
    end
    return true
  end
  # get the page at the given index
  def get_page_by_index(index, meet_conditions)
    return @page if index < 1
    return @event.pages[index] if @event.pages[index] != nil &&
      (not meet_conditions or (meet_conditions && condition_met?(@event.pages[index])))
  end
  # Get an array of pages having the name provided  
  def get_pages_by_name(page_name, meet_conditions)
    if @page_names == nil
      index_page_names
    end
    pages = @page_names[page_name.downcase.strip]
    if meet_conditions
      pages.keep_if {  |v|
        condition_met?(v)
      }
    end
    return pages
  end
  INDEX_DEPTH_MAX = 6 # How many commands are checked on each list for a name
  # Index pages that has the comment command with name:
  def index_page_names
    @page_names = {}
    for page in pages.reverse
      depth = 0
      for event_command in page.list
        if event_command.code == 108 || event_command.code == 408 # Comment command
          parameters = event_command.parameters
          parameter_matches = []
          for parameter in parameters
            parameter_matches += parameter.scan(/^name:([^$#]+)/im)
          end
          for command_matches in parameter_matches
            for name in command_matches
              name.strip! # Remove starting and trailing white space
              name.downcase! # Make name lowercase
              if not name.empty?
                (@page_names[name] ||= []) << page
              end
            end
          end
        end
        depth += 1
        if depth > INDEX_DEPTH_MAX
          break
        end
      end
    end
  end
end