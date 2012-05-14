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
      attr_reader :host
      include HookExtension
      register_hook :target do |callee, target|
        if @previous_target != target
          if @previous_target != nil
            if @previous_target == $game_player
              $game_player.remove_watcher(callee.host)
            end
          end
          if target == $game_player
            $game_player.add_watcher(callee.host)
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
    if @watchers != nil
      @watchers << watcher if @watchers != nil
      @watchers.compact! if @watchers != nil
    else
      @watchers = [watcher]
    end
  end
  def remove_watcher(watcher)
    if @watchers != nil
      @watchers.delete(watcher)
      @watchers.compact! 
    end
  end
  def clear_watchers
    @watchers.clear if @watchers != nil
  end
  def is_watched?
    return !@watchers.empty? if @watchers != nil
  end
end

# Clear enemies watching the player 
class Scene_Map
  alias pre_watch_clear_transfer transfer_player
  def transfer_player
    pre_watch_clear_transfer
    clear_player_watchers
  end
  def clear_player_watchers
    $game_player.clear_watchers if $game_player != nil
  end
end
module BlizzABS
  class Processor
    alias post_watcher_remove_enemy remove_enemy
    def remove_enemy(enemy)
      #p enemy
      $game_player.remove_watcher(enemy)
      post_watcher_remove_enemy(enemy)
    end
  end
end