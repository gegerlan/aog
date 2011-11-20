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
        if @previous_target != target
          if @previous_target != nil
            if @previous_target == $game_player
              $game_player.remove_watcher(callee)
            end
          end
          if target == $game_player
            $game_player.add_watcher(callee)
            $game_switches[Map::State::BATTLE] = true
          end
          @previous_target = target
        end
      end
    end
  end
end

class Game_Player < Map_Actor
  alias watcher_pre_initialize initialize
  def initialize
    watcher_pre_initialize 
    @watchers = []
  end
  def add_watcher(watcher)
    @watchers << watcher if @watchers != nil
  end
  def remove_watcher(watcher)
    @watchers.delete(watcher) if @watchers != nil
  end
  def is_watched?
    return !@watchers.empty? if @watchers != nil
  end
end