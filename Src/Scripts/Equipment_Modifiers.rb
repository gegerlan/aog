# Adds modifiers to equipment.
class Condition_Item
  attr_reader :modifiers
  alias equip_mod_initialize initialize
  def initialize(id)
    equip_mod_initialize(id)
    @modifiers = Hash.new(1)
  end
  alias equip_mod_price price
  def price
    return equip_mod_price * @modifiers[:price]
  end
  alias equip_mod_atk atk 
  def atk 
    return equip_mod_atk * @modifiers[:atk]
  end
  alias equip_mod_pdef pdef 
  def pdef 
    return equip_mod_pdef * @modifiers[:pdef]
  end
  alias equip_mod_mdef mdef 
  def mdef 
    return equip_mod_mdef * @modifiers[:mdef]
  end
  alias equip_mod_str_plus str_plus
  def str_plus 
    return equip_mod_str_plus * @modifiers[:str_plus]
  end
  alias equip_mod_dex_plus dex_plus
  def dex_plus
    return equip_mod_dex_plus * @modifiers[:dex_plux]
  end
  alias equip_mod_agi_plus agi_plus 
  def agi_plus 
    return equip_mod_agi_plus * @modifiers[:agi_plus]
  end
  alias equip_mod_int_plus int_plus
  def int_plus
    return equip_mod_int_plus * @modifiers[:int_plus]
  end
  alias equip_mod_repair_cost repair_cost
  def repair_cost
    return equip_mod_repair_cost * @modifiers[:repair_cost]
  end
end
class Armor_Condition < Condition_Item
  alias equip_mod_eva eva
  def eva
    return equip_mod_eva * @modifiers[:eva]
  end
end