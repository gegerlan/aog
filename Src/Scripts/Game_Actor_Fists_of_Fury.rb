class Game_Actor < Game_Battler
  FIST_HIT_ANIMATION_ID = 4
  alias no_fists_base_atk base_atk
  def base_atk
    return @weapon_id == 0 ? base_str * 2 : no_fists_base_atk
  end
  alias no_fists_animation2_id animation2_id
  def animation2_id
    return @weapon_id == 0 ? FIST_HIT_ANIMATION_ID : no_fists_animation2_id
  end
end