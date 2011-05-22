class Game_Actor < Game_Battler
  def base_atk
    weapon = $data_weapons[@weapon_id]
    atk = weapon != nil ? weapon.atk : base_str * 2
    return atk
  end
end