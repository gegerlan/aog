module Bladder
  # Does the player have a bladder?
  ON_SWITCH       = 173
  # Which variable tracks the player's bladder?
  TRACK_VARIABLE  = 21
  # What switch is checked for a full bladder
  MAX_SWITCH      = 174
  
  # How many frames should pass before an update (game is 40fps)
  FRAME_UPDATE    = 720 # 40fps * 60spm * 30m, i.e. value is 100 after 30 minutes.
  # Modifier for the update. 0.5 = half the change, 2.0 = double the change
  MODIFIER        = 1.0
  # The max value possible for the bladder
  MAX             = 100
  # The min value possible for the bladder
  MIN             = 0
  
  # Are the bladder value only allowed to be an integer?
  FORCE_INTEGER  = TRUE
end

#class Game_Player < Game_Character # Without (or before) Blizz-ABS
class Game_Player < Map_Actor # With (or after) Blizz-ABS
  alias pre_bladder_update update
  def update
    pre_bladder_update
    if $game_switches[ Bladder::ON_SWITCH ] && (Graphics.frame_count % Bladder::FRAME_UPDATE) == 0
      # Set the time different we base our update on
      delta = 1.0 #(Graphics.frame_count - @arousal_ticker) / Bladder::FRAME_UPDATE
      update_bladder(delta)
    end
  end
  def update_bladder(time_delta = 1.0)
    bladder   = $game_variables[ Bladder::TRACK_VARIABLE ]
    change    = time_delta * Bladder::MODIFIER
    new_value = [[bladder += change, Bladder::MAX].min, Bladder::MIN].max
    new_value = new_value.to_i if Bladder::FORCE_INTEGER
    $game_variables[ Bladder::TRACK_VARIABLE ] = new_value
    $game_switches[ Bladder::MAX_SWITCH ] = new_value == Bladder::MAX
  end
end

class Hud
  alias pre_bladder_initialize initialize
  def initialize
    pre_bladder_initialize
    # Track the bladder in the HUD
    add_bar_item("bladder") do |callee|
        {
          :current => $game_variables[ Bladder::TRACK_VARIABLE ],
          :max     => Bladder::MAX
        }
    end
  end
end