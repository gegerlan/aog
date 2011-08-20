class Game_Actor < Game_Battler
  def parameters=(param)
    @parameters = param
  end
end
class Scene_Load < Scene_File
  alias old_param_save_data read_save_data
  def read_save_data(file)
    old_param_save_data(file)
    for actor in $game_party.actors
      if actor.parameters == nil
        actor.parameters = $data_actors[actor.id].parameters
      end
    end
  end
end
