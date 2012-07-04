class Game_Variables
  alias game_variables_event_trigger_initialize initialize
  def initialize
    game_variables_event_trigger_initialize
    @triggers = []
  end
  alias game_variables_event_trigger_set []=
  def []=(variable, value)
    new_value = game_variables_event_trigger_set(variable, value)
    for event in @triggers[variable] || [] do 
      event.call(self, new_value)
    end
    new_value
  end
  def add_trigger(variable, event_handler)
    (@triggers[variable] ||= []) << event_handler
  end
  def clear_triggers
    for trigger in @triggers || []
      for event_handler in trigger || []
        trigger.delete(event_handler)
      end
    end
    @triggers.clear unless @triggers == nil
  end
end

class Game_Switches
  alias game_switches_event_trigger_initialize initialize
  def initialize
    game_switches_event_trigger_initialize
    @triggers = []
  end
  alias game_switches_event_trigger_set []=
  def []=(switch_id, value)
    new_value = game_switches_event_trigger_set(switch_id, value)
    for event in @triggers[switch_id] || [] do 
      event.call(self, new_value)
    end
    new_value
  end
  def add_trigger(switch, event_handler)
    (@triggers[switch] ||= []) << event_handler
  end
  def clear_triggers
    for trigger in @triggers || []
      for event_handler in trigger || []
        trigger.delete(event_handler)
      end
    end
    @triggers.clear unless @triggers == nil
  end
end
class Game_Map
  attr_accessor :events_to_refresh
  alias game_map_event_switch_tracker_init initialize
  def initialize
    @events_to_refresh = []
    game_map_event_switch_tracker_init
  end
  alias game_map_event_switch_tracker_setup setup
  def setup(map_id)
    game_map_event_switch_tracker_setup(map_id)
    # Remove previous event handlers
    $game_switches.clear_triggers
    $game_variables.clear_triggers
    # Add event handlers for map events and common events
    for event in @events.values
      switch_triggers = event.get_switches
      variable_triggers = event.get_variables
      event_handler = Event_Condition_Update.new(event)
      for switch in switch_triggers
        $game_switches.add_trigger(switch, event_handler)
      end
      for variable in variable_triggers
        $game_variables.add_trigger(variable, event_handler)
      end
    end
    for common_event in @common_events.values
      if common_event.switch_id > 0
        event_handler = Event_Condition_Update.new(common_event)
        $game_switches.add_trigger(common_event.switch_id, event_handler)
      end
    end
  end
  alias game_map_event_switch_tracker_update update
  def update
    full_refresh = @need_refresh
    game_map_event_switch_tracker_update
    if @map_id > 0 and (not @full_refresh) and (not @events_to_refresh.empty?)
      events_done = []
      for event in @events_to_refresh
        event.refresh unless events_done === event
        events_done << event
      end
      @events_to_refresh.clear
      events_done.clear
    else
      @events_to_refresh = []
    end
  end
end

class Event_Condition_Update
  def initialize(event)
    @event = event
  end
  def call(context, *values)
    $game_map.events_to_refresh << @event
  end
end