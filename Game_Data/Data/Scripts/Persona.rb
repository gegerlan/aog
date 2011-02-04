class Persona
  def self.visibility=(visibility)
    $game_switches[128] = !!visibility
  end
  def self.is_visible?
    return !!$game_switches[128]
  end
end

module BlizzABS
  class Controller
    alias persona_check_event_trigger_here check_event_trigger_here
    def check_event_trigger_here(triggers)
      persona_check_event_trigger_here(triggers)
      $game_variables[27] == $game_player.screen_y
      $game_variables[28] == $game_player.screen_x
      if Persona.is_visible? && $game_player.screen_x > 450
        $game_screen.pictures[2].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          50.0,
          0
        )
        $game_screen.pictures[3].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          50.0,
          0
        )
        $game_screen.pictures[4].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          50.0,
          0
        )
        $game_screen.pictures[5].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          50.0,
          0
        )
        $game_screen.pictures[6].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          50.0,
          0
        )
        Persona.visibility = false
      elsif !Persona.is_visible? && $game_player.screen_x <= 450
        $game_screen.pictures[2].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          255.0,
          0
        )
        $game_screen.pictures[3].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          255.0,
          0
        )
        $game_screen.pictures[4].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          255.0,
          0
        )
        $game_screen.pictures[5].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          255.0,
          0
        )
        $game_screen.pictures[6].move(
          10,
          0,
          0,
          0,
          100.0,
          100.0,
          255.0,
          0
        )
        Persona.visibility = true          
      end
    end
  end
end