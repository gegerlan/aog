class Persona
  def self.switch 
    return 128
  end
  def self.picture_index
    return 2..6
  end
  def self.duration
    return 10
  end
  def self.visible_opacity
    return 255
  end
  def self.transparent_opacity
    return 50
  end
  def self.visibility=(visibility)
    $game_switches[self.switch] = !!visibility
    self.update_persona
  end
  def self.is_visible?
    return !!$game_switches[self.switch]
  end
  def self.update_persona
    opacity = self.is_visible? ? self.visible_opacity : self.transparent_opacity
    self.picture_index.each { |x|
      p = $game_screen.pictures[x]
      $game_screen.pictures[x].move(
        self.duration,
        p.origin,
        p.x,
        p.y,
        p.zoom_x,
        p.zoom_y,
        opacity,
        p.blend_type
      );
    }
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
        Persona.visibility = false
      elsif !Persona.is_visible? && $game_player.screen_x <= 450
        Persona.visibility = true          
      end
    end
  end
end

class Scene_Map
  alias persona_transfer_player transfer_player
  def transfer_player
    persona_transfer_player
    Persona.visibility = $game_player.screen_x <= 450
  end
end