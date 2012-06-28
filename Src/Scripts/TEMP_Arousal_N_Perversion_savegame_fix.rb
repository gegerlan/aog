class Game_Player < Map_Actor
  alias update_original_arousal_init update
  def update
    if @arousal_ticker == nil
      @arousal_ticker = 0
    end
    update_original_arousal_init
    #alias update update_original_arousal_init
  end
end

class Game_Actor < Game_Battler  
  alias add_perversion_original_init add_perversion
  def add_perversion(value, unique_id, event_id, map_id)
    if @perversion == nil
      @perversion = {}
      @perversion[[0,0,0]] = $game_variables[49]
      $game_variables[49]  = sum_perversion
    else
      add_perversion_original_init(value, unique_id, event_id, map_id = $game_map.map_id)
    end
    alias add_perversion add_perversion_original_init
  end
end
