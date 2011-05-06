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
  def make_parameter_list(parameter=0, min=1, max=99)
    actor = $data_actors[@actor_id]
    $data_actors[@actor_id].parameters[parameter, 1] = min
    step = (max - min) / 100
    for i in 2..100
      $data_actors[@actor_id].parameters[parameter, i] = 
        min + Integer(step*i)
    end
  end
end