module Perversion
  VARIABLE = 49
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
  def add_perversion(value, unique_id = 0, event_id = 0, map_id = $game_map.map_id)
    e_perversion = (@perversion[[event_id, map_id, unique_id]] ||= [])
    if event_id != 0 && unique_id != 0
      mod_value = value / (e_perversion.length + 1)
    else
      mod_value = value
    end
    e_perversion << mod_value
    if $game_player.battler = self
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
class Game_Battler
=begin
  alias perv_sp sp=
  def sp=(sp)
    perv_sp(sp)
    
    if self == $game_party.actors[0] #If the actor is the leader of the party
      $game_variables[Perversion::VARIABLE] = (@sp * 10) / maxsp unless 
                                                !@sp || !maxsp || maxsp == 0
    end
#    if self == $game_actors[5] 
#      $game_variables[Perversion::VARIABLE] = (@sp * 10) / maxsp 
#    end
#    if self == $game_actors[6] 
#      $game_variables[Perversion::VARIABLE] = (@sp * 10) / maxsp 
#    end
  end
=end
end