# Solves the issue with some save games not being able to be loaded if they 
# were created before the introduction of the new event handling for switches
# and variables.
class Game_Map
  alias game_map_events_to_refresh_init setup
  def setup(id)
    if @events_to_refresh == nil
      @events_to_refresh = []
      $game_variables.instance_variable_set(:@triggers, [])
      $game_switches.instance_variable_set(:@triggers, [])
    end
    #alias setup game_map_events_to_refresh_init
    #setup(id)
    game_map_events_to_refresh_init(id)
  end
end