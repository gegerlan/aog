=begin
  Track the states of the party leader as they change.
  To add a state add them as constants to the StateTracker
  module. 
  Used to trigger special events on the map or common events
  (page condtions).
  
  The state name must be in all uppercase (required by Ruby)
    
  Example
    STUN = 241
    VENOM = 242
    
    Whenever the player is stunned, switch 241 will be set to
    ON. If stun is removed, switch 241 will be set to OFF.
    
=end
module StateTracker
  # State name (upper_case) = Switch ID
  KNOCKOUT = 240
  HYPNOSIS_OFF = 241
end
class Game_Battler
  include HookExtension
  register_hook :add_state do |callee, return_value, state_id, force|
    if callee == $game_party.actors[0] # If the state was changed to the party leader
      # state_name needs to be uppercase since constants may only be uppercase
      state = $data_states[state_id]
      if state != nil
        # makes state name uppercase, and spaces -> _ to have valid constant names.
        state_name = state.name.upcase.gsub(/[\s\t]/,"_")
        # verify that the state_name is a valid const (starts with capital 
        # letter or underscore by itself, or followed by one or more letters 
        # (up/down case) digits or underscores.
        if state_name =~ /[A-Z_][A-Za-z_0-9]*/
          if StateTracker.const_defined?(state_name)
            $game_switches[StateTracker.const_get(state_name)] = callee.state?(state_id)
          end
          if StateTracker.const_defined?("#{state_name}_ON")
            $game_switches[StateTracker.const_get("#{state_name}_ON")] = callee.state?(state_id)
          end
        end
      end
    end
  end
  register_hook :remove_state do |callee, return_value, state_id, force|
    if callee == $game_party.actors[0] # If the state was changed to the party leader
      # state_name needs to be uppercase since constants may only be uppercase
      state = $data_states[state_id]
      if state != nil
        # makes spaces _ to have valid constant names.
        state_name = state.name.upcase.gsub(/[\s\t]/, '_')
        if StateTracker.const_defined?(state_name)
          $game_switches[StateTracker.const_get(state_name)] = callee.state?(state_id)
        end
        if StateTracker.const_defined?("#{state_name}_OFF")
          $game_switches[StateTracker.const_get("#{state_name}_OFF")] = !callee.state?(state_id)
        end
      end
    end
  end
end