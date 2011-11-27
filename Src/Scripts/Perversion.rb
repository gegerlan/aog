module Perversion
  VARIABLE = 49
end
module Arousal
  VARIABLE = 48
end

class Game_Actor < Game_Battler  
  # Accessor
  attr_reader :perversion
  
  alias pre_attribute_initialize initialize
  def initialize(actor_id)
    pre_attribute_initialize(actor_id)
    @perversion = {}
  end
=begin
  Adds to the perversion variable of the actor.
  
    value = integer, the addition or removal from the perversion
    unique_id = identifies the specific act, must be > 0. Used to limit impact of grinding. Default 0 (not indentified)
    event_id = the event that modified the perversion, default 0 (noone)
    map_id = location, default the map the player is on.
=end
  def add_perversion(value, unique_id, event_id, map_id)
    e_perversion = (@perversion[[unique_id, event_id, map_id]] ||= [])
    if event_id != 0 && unique_id != 0
      mod_value = value.abs / (e_perversion.length + 1)
    else
      mod_value = value.abs
    end
    mod_value = [1, mod_value].max
    if value < 0
      mod_value = -mod_value
    end
    e_perversion << mod_value
    if $game_player.battler == self
      $game_variables[Perversion::VARIABLE] += mod_value
    end
  end
  def sum_perversion
    sum = 0
    @perversion.each do |v|
      sum += v.sum
    end
    return sum
  end
end
class Interpreter
  alias perversion_command_122 command_122
  def command_122
    if (@parameters[0] .. @parameters[1]) === Perversion::VARIABLE 
      old_value = $game_variables[Perversion::VARIABLE]
    end
    perversion_command_122
    if old_value != nil
      new_value = $game_variables[Perversion::VARIABLE]
      $game_variables[Perversion::VARIABLE] = old_value
      delta = new_value - old_value
      if delta != 0
        $game_player.battler.add_perversion(delta, @page_id, @event_id, @map_id)
      end
    end
    return true
  end
end
# Arousal
class Game_Battler
  alias pre_arousal_sp sp=
  def sp=(sp)
    pre_arousal_sp(sp)
    
    if self == $game_player.battler #If the actor is the leader of the party
      $game_variables[Arousal::VARIABLE] = (@sp * 10) / maxsp unless 
                                                !@sp || !maxsp || maxsp == 0
    end
  end
end
class Game_Player < Map_Actor
  attr_reader  :arousal_ticker
  alias pre_arousal_initialize initialize
  def initialize
    pre_arousal_initialize
    @arousal_ticker = 0
    #@delta =  ([600, [25 + $game_variables[Perversion::VARIABLE], 25].max].min)
  end
  alias pre_arousal_update update
  def update
    pre_arousal_update
    if @battler.sp > 0
      time_diff = Graphics.frame_count - @arousal_ticker
      rate = Math::PI * (1 - ( @battler.sp.to_f /  @battler.maxsp.to_f  ))
      @battler.sp -= 0.01 + Math.sin(rate) * time_diff * 0.005
    end
    @arousal_ticker = Graphics.frame_count
  end
end