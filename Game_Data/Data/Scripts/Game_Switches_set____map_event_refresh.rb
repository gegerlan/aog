class Game_Switches
  alias game_switches_event_trigger_initialize initialize
  def initialize
    game_switches_event_trigger_initialize
    @triggers = []
  end
  def []=(switch_id, value)
    if switch_id <= 5000
      @data[switch_id] = value
    end
    if @triggers[switch_id]
      for event in @triggers[switch_id]
        event.refresh
      end
    end
  end
  def set_switch_events(triggers)
    @triggers = triggers
  end
end
class Game_Map
  alias game_map_event_switch_tracker_setup setup
  def setup(map_id)
    game_map_event_switch_tracker_setup(map_id)
    switches = []
    for event in @events.values
      triggers = event.get_switches
      for n in triggers
        switches[n] = [] if switches[n] == nil
        switches[n].push(event)
      end
    end
    $game_switches.set_switch_events(switches)
  end
end