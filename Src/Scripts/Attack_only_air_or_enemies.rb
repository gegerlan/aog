#
# Fixes the issue with routing of the player when triggered by activating a map
# event.
#
# When the player presses the action button, BlizzABS makes the player enter the
# attack animation (if turned on), which breaks any routes that has been planned
# through event commands.
#
# This fix modifies the check if the player is attacking in the first place. If
# the player presses the action button, the script will check if this was done
# in the direction of an enemy (Map_Enemy) or if it's done in mid-air (no event).
# The last check is used for projectile weapons when the enemy isn't right 
# infront of you
#
# It would obviously have been better if we could make sure that the animation 
# or sprite change doesn't break forced movement, but I wasn't able to track 
# that part down when I wrote this.
#
module BlizzABS
  class Controls
    def check_attack_condition?
      # attack button enabled and attack button is pressed
      if ($game_system.attack_button && Input.trigger?(Input::Attack))
        # Get the target tile based on the player's current location and direction
        case $game_player.direction
        when 2
          facing_y, facing_x = [$game_player.y + 1, $game_player.x]
        when 4
          facing_y, facing_x = [$game_player.y, $game_player.x - 1]
        when 6
          facing_y, facing_x = [$game_player.y, $game_player.x + 1]
        when 8
          facing_y, facing_x = [$game_player.y - 1, $game_player.x]
        end
        # Get all events at the target location
        target_events = $game_map.events.select { |index, event|
          [event.x, event.y] == [facing_x, facing_y]
        }

        # Return true if there's no events at the location, or if the event is an enemy
        return target_events.empty? || target_events.any? { |event| event.is_a?(Map_Enemy) }
      end
      return false
    end
  end
end
#
# Possible changes would be to use  $game_map.battlers (and the BlizzABS 
# alternative). This would only select those events that are enemies (Map_Events)
# It's not used in this case because it's important to allow attacks without an
# enemy facing you (for ranged, or area attacks).
#
# It could be used for checking if the events targeted is an enemy, but I'm not
# sure it would be quicker than the current alternative.
#