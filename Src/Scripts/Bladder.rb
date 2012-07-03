module Bladder
  # Does the player have a bladder?
  #
  # Turns bladder ON/OFF
  ON_SWITCH       = 173
  # Which variable tracks the player's bladder?
  #
  # Stores how filled the bladder is
  TRACK_VARIABLE  = 21
  # What switch is checked for a full bladder
  #
  # At update, when the bladder is filled, the switch will be turned ON.
  # If the bladder isn't filled at the update, the switch fill be turned OFF.
  MAX_SWITCH      = 174
  
  # How many frames should pass before an update of the value. (game is 40fps)
  FRAME_UPDATE    = 720 # 40fps * 60spm * 30m, i.e. value is 100 after 30 minutes.
  # Modifier for the update. 0.5 = half the change, 2.0 = double the change
  MODIFIER        = 1.0
  # The maximum value possible for the bladder
  MAX             = 100
  # The minimum value possible for the bladder
  MIN             = 0
  
  # Is the bladder value only allowed to be an integer? (for easy presentation)
  #
  # Change this value to false, if you're using a MODIFIER
  # that contains a decimal number (e.g 1.5 or 2.25).
  FORCE_INTEGER  = true
end


# Add the bladder update to the Game_Player update method. This makes sure that
# the bladder only updates (and keeps getting updated) when the player is on the 
# map.

#class Game_Player < Game_Character # Without (or before) Blizz-ABS
class Game_Player < Map_Actor # With (or after) Blizz-ABS
  alias pre_bladder_update update
  def update
    pre_bladder_update
    if $game_switches[ Bladder::ON_SWITCH ] && (Graphics.frame_count % Bladder::FRAME_UPDATE) == 0
      # Set the time different we base our update on
      delta = 1.0 #(Graphics.frame_count - @frame_count_at_last_value_update) / Bladder::FRAME_UPDATE
      update_bladder(delta)
    end
  end
  def update_bladder(time_delta = 1.0)
    bladder   = $game_variables[ Bladder::TRACK_VARIABLE ]
    change    = time_delta * Bladder::MODIFIER
    new_value = [[bladder += change, Bladder::MAX].min, Bladder::MIN].max
    new_value = new_value.to_i if Bladder::FORCE_INTEGER
    $game_variables[ Bladder::TRACK_VARIABLE ] = new_value
  end
end

# Add the bladder as a bar in the HUD
class Hud
  alias pre_bladder_initialize initialize
  def initialize
    pre_bladder_initialize
    # Track the bladder in the HUD
    add_bar_item("bladder") do |callee|
        {
          :current => $game_variables[ Bladder::TRACK_VARIABLE ],
          :max     => Bladder::MAX,
          :visible => $game_switches[ Bladder::ON_SWITCH ]
        }
    end
  end
end

class Switch_Event
  def initialize(switch_id, trigger_value)
    @switch_id = switch_id # switch to trigger
    @trigger_value = trigger_value # at what value (or above) should be switch be ON
  end
  def call(context, value)
    $game_switches[@switch_id] = value >= @trigger_value
  end
end

class Game_Map
  alias pre_bladder_switch_tracker_setup setup
  def setup(id)
    pre_bladder_switch_tracker_setup(id)
    $game_variables.add_trigger(Bladder::TRACK_VARIABLE, Switch_Event.new(Bladder::MAX_SWITCH, Bladder::MAX))
  end
end