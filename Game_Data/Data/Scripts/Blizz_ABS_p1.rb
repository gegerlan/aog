module BlizzABS
  class Controller
    alias old_check_event_trigger_here check_event_trigger_here
    def check_event_trigger_here(triggers)
      old_check_event_trigger_here(triggers)
      o = $game_switches[135]
      $game_switches[135] = $game_map.terrain_tag(player.x, player.y) == 1 ? true : false
      if o != $game_switches[135]
        $game_switches[100] = true
      end
    end
  end
end
