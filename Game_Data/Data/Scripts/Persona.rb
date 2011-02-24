module BlizzABS
  class Controller
    alias persona_blizzabs_controller_update_moving update_moving
    def update_moving(data) #updates to often
      persona_blizzabs_controller_update_moving(data)
      unless player.moving?
        if $game_player.screen_x > 450
          # Hide persona
        end
      end
    end
  end
end