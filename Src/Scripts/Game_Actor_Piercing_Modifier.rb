class Game_Actor < Game_Battler
  def state_guard?(state_id)
    for i in [@armor1_id, @armor2_id, @armor3_id, @armor4_id, @pierce1_id, @pierce2_id, @pierce3_id, @pierce4_id, @pierce5_id, @pierce6_id, @pierce7_id]
      armor = $data_armors[i]
      if armor != nil
        if armor.guard_state_set.include?(state_id)
          return true
        end
      end
    end
    return false
  end
  # Get the product of all piercing modifiers passed as a sym
  def get_piercing_modifiers(sym)
    [pierce1_id, pierce2_id, pierce3_id, pierce4_id, 
      pierce5_id, pierce6_id, pierce7_id].inject(0) { |prod, item_id|
        item = $data_armors[item_id]
        prod += item.send(sym) if item != nil
        prod
    }
  end
  
  #--------------------------------------------------------------------------
  # * Get Basic Strength
  #--------------------------------------------------------------------------
  alias pre_piercing_base_str base_str
  def base_str
    str = pre_piercing_base_str
    str += get_piercing_modifiers(:str_plus)
    return [[str, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Dexterity
  #--------------------------------------------------------------------------
  alias pre_piercing_base_dex base_dex
  def base_dex
    dex = pre_piercing_base_dex 
    dex += get_piercing_modifiers(:dex_plus)
    return [[dex, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Agility
  #--------------------------------------------------------------------------
  alias pre_piercing_base_agi base_agi
  def base_agi
    agi = pre_piercing_base_agi
    agi += get_piercing_modifiers(:agi_plus)
    return [[agi, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Intelligence
  #--------------------------------------------------------------------------
  alias pre_piercing_base_int base_int
  def base_int
    int = pre_piercing_base_int
    int += get_piercing_modifiers(:int_plus)
    return [[int, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Physical Defense
  #--------------------------------------------------------------------------
  alias pre_piercing_base_pdef base_pdef
  def base_pdef
    pdef = pre_piercing_base_pdef
    pdef += get_piercing_modifiers(:pdef)
    return pdef
  end
  #--------------------------------------------------------------------------
  # * Get Basic Magic Defense
  #--------------------------------------------------------------------------
  alias pre_piercing_base_mdef base_mdef
  def base_mdef
    mdef = pre_piercing_base_mdef
    mdef += get_piercing_modifiers(:mdef)
    return mdef
  end
  #--------------------------------------------------------------------------
  # * Get Basic Evasion Correction
  #--------------------------------------------------------------------------
  alias pre_piercing_base_eva base_eva
  def base_eva
    eva = pre_piercing_base_eva
    eva += get_piercing_modifiers(:eva)
    return eva
  end
end