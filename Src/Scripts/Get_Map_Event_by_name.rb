=begin
  Adds the ability to call events by name (as they are defined in the editor)
  This is done by inlining the call, making it possible to jump from one context
  to another, and then back. Something that oterwise only is possible through
  the use of common events.
  
  Names are case insensitive My_Event will match my_event and MY_EVENT.
  Names can be shared by multiple events, all will be executed when called.
  
=end
# .name : returns the event name set in the editor
class Game_Event < Game_Character
  def name
    return event.name
  end
end
class Interpreter
  def call_event_by_name(event_name)
    return call_event(*get_event_by_name(event_name))
  end
  # Get events sharing a name
  def get_event_by_name(event_name)
    @@__map_events__ ||= {} # the maps events indexed by name
    if @@__map_events__[:map_id] != $game_map.map_id # create a new index in non exsist for the map
      index_events
    end
    return @@__map_events__[event_name.downcase]
  end
  def index_events
    @@__map_events__.clear
    @@__map_events__[:map_id] = $game_map.map_id
    # Index map events based on name (note that names doesn't have to be unique for an event)
    $game_map.events.each do |index, map_event|
      (@@__map_events__[map_event.name.downcase] ||= []) << map_event
    end
  end
  # execute event passed
  def call_event(*events)
    list = []
    for event in events
      list += event.list if event.is_a?(Game_Event)
    end
    if list.length != 0
      # Make child interpreter (i.e. make it running under the current interpreter)
      @child_interpreter = Interpreter.new(@depth + 1)
      @child_interpreter.setup(list, @event_id)
      return true
    end
    return false
  end
end