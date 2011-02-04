class Game_Actor
  #--------------------------------------------------------------------------
  # * Calculate Parameter List
  # 0 : MaxHP
  # 1 : MaxSP
  # 2 : Str
  # 3 : Dex
  # 4 : Agi
  # 5 : Int
  #--------------------------------------------------------------------------
  def make_parameter_list(parameter=0, base=0, inflation=0)
    actor = $data_actors[@actor_id]
    $data_actors[@actor_id].parameters[parameter, 1] = 0
    pow_i = 2.4 + inflation / 100.0
    for i in 2..100
      if i > actor.final_level
        $data_actors[@actor_id].parameters[parameter, i] = 0
      else
        n = base * ((i + 3) ** pow_i) / (5 ** pow_i)
        $data_actors[@actor_id].parameters[parameter, i] = 
          $data_actors[@actor_id].parameters[parameter, i-1] + Integer(n)
      end
    end
  end
end