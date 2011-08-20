class Game_Actor < Game_Battler
  def parameters=(param)
    @parameters = param
  end
end
class Scene_Load < Scene_File
  alias picture_remove_from_save_data read_save_data
  def read_save_data(file)
    picture_remove_from_save_data(file)
    for picture in $game_screen.pictures
      picture.erase if picture != nil
    end
  end
end
