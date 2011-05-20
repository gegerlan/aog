=begin
Makes sure the sprite designated actually exists before using it
=end
class Map_Battler < Game_Character
  alias file_check_sprite_movement_animation_setup sprite_movement_animation_setup
  def sprite_movement_animation_setup
    file_check_sprite_movement_animation_setup
    if !file_exists?(@character_name, "Graphics/Characters", "png")
      @character_name = @character_name_org
    end
  end
end