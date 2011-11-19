=begin
  Whenever a battler on the map aquires a target
  the switch defined in Map::State::Battle is set
  to true.
  
  This is used to timeout battles where a common
  event running in parallel keeps checking if the
  battle is still raging.
=end
module Map
  module State
    BATTLE = 210
  end
end
module BlizzABS
  class AI
    class Data
      include HookExtension
      register_hook :target do |callee, target|
        if target != nil
          $game_switches[210] = true
        end
      end
    end
  end
end