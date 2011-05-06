module Perversion
  VARIABLE = 49
end
class Game_Battler
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
end