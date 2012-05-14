# Easy solution for changing Game Over image
# Call by using:
#   Scene_Gameover.set_picture(picture_name)
class Scene_Gameover
  def self.set_picture(filename)
    $data_system.gameover_name = filename
  end
end
