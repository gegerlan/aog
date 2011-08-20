class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor   :weapon_fix                     # weapon fix
  attr_accessor   :armor1_fix                     #  fix
  attr_accessor   :armor2_fix                     #  fix
  attr_accessor   :armor3_fix                     #  fix
  attr_accessor   :armor4_fix                     #  fix
  alias actor_fix_original_setup setup
  def setup(actor_id)
    actor_fix_original_setup(actor_id)
    @weapon_fix = $data_actors[@actor_id].weapon_fix
    @armor1_fix = $data_actors[@actor_id].armor1_fix
    @armor2_fix = $data_actors[@actor_id].armor2_fix
    @armor3_fix = $data_actors[@actor_id].armor3_fix
    @armor4_fix = $data_actors[@actor_id].armor4_fix
  end
  #--------------------------------------------------------------------------
  # * Determine Fixed Equipment
  #     equip_type : type of equipment
  #--------------------------------------------------------------------------
  def equip_fix?(equip_type)
    case equip_type
    when 0  # Weapon
      return @weapon_fix
    when 1  # Shield
      return @armor1_fix
    when 2  # Head
      return @armor2_fix
    when 3  # Body
      return @armor3_fix
    when 4  # Accessory
      return @armor4_fix
    end
    return false
  end
end
