class Game_Actor < Game_Battler
  alias armor1_id_normal armor1_id
  def armor1_id
    (@armors ||= [])
    armor1_id_normal
  end
  alias armor2_id_normal armor2_id
  def armor2_id
    (@armors ||= [])
    return armor2_id_normal
  end
  alias armor3_id_normal armor3_id
  def armor3_id
    (@armors ||= [])
    return armor3_id_normal
  end
  alias armor4_id_normal armor4_id
  def armor4_id
    (@armors ||= [])
    return armor4_id_normal
  end
  def convert_id_to_object
    if @armors == nil
      (@armors ||= [])
      @weapon = nil
      weapon = $game_party.gain_weapon(@weapon_id, 1)
      armor1 = $game_party.gain_armor(@armor1_id, 1)
      armor2 = $game_party.gain_armor(@armor2_id, 1)
      armor3 = $game_party.gain_armor(@armor3_id, 1)
      armor4 = $game_party.gain_armor(@armor4_id, 1)
      equip(0, weapon)
      equip(1, armor1)
      equip(2, armor2)
      equip(3, armor3)
      equip(4, armor4)
    end
  end
end
class Game_Party
  def covert_id_to_object
    if @weapons.is_a?(Hash)
      w = @weapons
      @weapons = []
      w.each do |weapon_id, number|
        gain_weapon(weapon_id, number) if $data_weapons[weapon_id] != nil
      end
    end
    if @armors.is_a?(Hash)
      a = @armors
      @armors = []
      a.each do |armor_id, number|
        gain_weapon(armor_id, number) if $data_armors[armor_id] != nil
      end
    end
  end
end
class Scene_Load
  alias peq_read_save_data read_save_data
  def read_save_data(file)
    peq_read_save_data(file)
    $game_party.covert_id_to_object
    for i in 0..999 do
      $game_actors[i].convert_id_to_object if $game_actors[i] != nil
    end
  end
end