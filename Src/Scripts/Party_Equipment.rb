# Uniquely identify items in party inventory and used by actors
class Condition_Item
  attr_reader :id
  attr_reader :hp
  def initialize(id)
    @id = id
    @hp = max_hp
  end
  def quality
    return (@hp * 100) / max_hp
  end
  def method_missing(sym, *argz)
    return data.__send__ sym, *argz
  end
  def max_hp
    return 1
  end
  def data
    return self
  end
end
class Weapon_Condition < Condition_Item
  def initialize(weapon_id)
    super(weapon_id)
  end
  def hp=(hp)
    @hp = [[hp, 0].max, max_hp].min
  end
  def max_hp
    return [data.pdef, 1].max * [price, 1].max
  end
  def data
    return $data_weapons[@id]
  end
end
class Armor_Condition < Condition_Item
  def initialize(armor_id)
    super(armor_id)
  end
  def hp=(hp)
    @hp = [[hp, 0].max, max_hp].min
  end
  def max_hp
    return [data.pdef, 1].max * [price, 1].max
  end
  def data
    return $data_armors[@id]
  end
end

class Game_Party
  alias pre_inventory_objects_initialize initialize
  def initialize
    pre_inventory_objects_initialize
    @weapons = []
    @armors = []
  end
  #--------------------------------------------------------------------------
  # * Get Number of Weapons Possessed
  #     weapon_id : weapon ID
  #--------------------------------------------------------------------------
  def weapon_number(weapon_id)
    # If quantity data is in the hash, use it. If not, return 0
    weapons = @weapons.select { |weapon|
      weapon.id == weapon_id
    }
    return weapons.length
  end
  #--------------------------------------------------------------------------
  # * Get Amount of Armor Possessed
  #     armor_id : armor ID
  #--------------------------------------------------------------------------
  def armor_number(armor_id)
    # If quantity data is in the hash, use it. If not, return 0
    armors = @armors.select { |armor|
      armor.id == armor_id 
    }
    return armors.length
  end
  #--------------------------------------------------------------------------
  # * Gain Weapons (or lose)
  #     weapon_id : weapon ID
  #     n         : quantity
  #--------------------------------------------------------------------------
  def gain_weapon(weapon_id, n)
    if weapon_id.is_a?(Numeric)
      return if weapon_id == 0
      weapon_hp_max = 100
      weapon_hp = weapon_hp_max
      weapon = Weapon_Condition.new(weapon_id)
    elsif weapon_id.is_a?(Condition_Item)
      weapon = weapon_id
    else
      return # Invalid
    end
    @weapons << weapon
    for i in 1..(n-1)
      @weapons << weapon.clone
    end
    @weapons.uniq!
    weapon
  end
  #--------------------------------------------------------------------------
  # * Gain Armor
  #     armor_id : armor ID
  #     n        : quantity
  #--------------------------------------------------------------------------
  def gain_armor(armor_id, n)
    if armor_id.is_a?(Numeric)
      return if armor_id == 0
      armor = Armor_Condition.new(armor_id)
    elsif armor_id.is_a?(Condition_Item)
      armor = armor_id
    else
      return # Invalid
    end
    @armors << armor
    for i in 1..(n-1)
      @armors << armor.clone
    end
    @armors.uniq!
    armor
  end

  #--------------------------------------------------------------------------
  # * Lose Weapons
  #     weapon_id : weapon ID
  #     n         : quantity
  #--------------------------------------------------------------------------
  def lose_weapon(weapon_id, n)
    if weapon_id.is_a?(Condition_Item)
      @weapons.delete(weapon_id)
    end
    @weapons.uniq!
  end
  #--------------------------------------------------------------------------
  # * Lose Armor
  #     armor_id : armor ID
  #     n        : quantity
  #--------------------------------------------------------------------------
  def lose_armor(armor_id, n)
    if armor_id.is_a?(Condition_Item)
      @armors.delete(armor_id)
    end
    @armors.uniq!
  end
  
  def get_equippable_armors(class_id)
    armor_set = $data_classes[class_id].armor_set
    return @armors.select { |armor| 
      armor_set.include?(armor.id)
    }
  end
  def get_equippable_weapons(class_id)
    weapon_set = $data_classes[class_id].weapon_set
    @weapons.select { |weapon| 
      weapon_set.include?(weapon.id)
    }
  end
end

class Scene_Equip
  #--------------------------------------------------------------------------
  # * Frame Update (when item window is active)
  #--------------------------------------------------------------------------
  def update_item
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Activate right window
      @right_window.active = true
      @item_window.active = false
      @item_window.index = -1
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play equip SE
      $game_system.se_play($data_system.equip_se)
      # Get currently selected data on the item window
      item = @item_window.item
      # Change equipment
      @actor.equip(@right_window.index, item == nil ? 0 : item)
      #@actor.equip(@right_window.index, item)
      # Activate right window
      @right_window.active = true
      @item_window.active = false
      @item_window.index = -1
      # Remake right window and item window contents
      @right_window.refresh
      @item_window.refresh
      return
    end
  end
end
#==============================================================================
# ** Window_EquipItem
#------------------------------------------------------------------------------
#  This window displays choices when opting to change equipment on the
#  equipment screen.
#==============================================================================
class Window_EquipItem < Window_Selectable
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    # Add equippable weapons
    if @equip_type == 0
      @data = $game_party.get_equippable_weapons(@actor.class_id) || []
    end
    # Add equippable armor
    if @equip_type != 0
      armors = $game_party.get_equippable_armors(@actor.class_id) || []
      @data = armors.select { |armor|
        armor.kind == @equip_type - 1
      }
    end
    @data.compact!
    # Add blank page
    @data.push(nil)
    # Make a bit map and draw all items
    @item_max = @data.size
    self.contents = Bitmap.new(width - 32, row_max * 32)
    for i in 0...@item_max-1
      draw_item(i)
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #     index : item number
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    x = 4 + index % 2 * (288 + 32)
    y = index / 2 * 32
    
    number = item.is_a?(Condition_Item) ? "#{item.quality}%" : ""
    
    bitmap = RPG::Cache.icon(item.icon_name)
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24))
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    self.contents.draw_text(x + 240, y, 16, 32, ":", 1)
    self.contents.draw_text(x + 256, y, 24, 32, number, 2)
  end
end


class Game_Actor < Game_Battler
  alias pre_object_inventory_initialize initialize
  def initialize(actor_id)
    pre_object_inventory_initialize(actor_id)
    @weapon = nil
    @armors = Array.new(4)
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
  def weapon_id
    return @weapon != nil ? @weapon.id : 0
  end
  def armor1_id
    return @armors[0] != nil ? @armors[0].id : 0
  end
  def armor2_id
    return @armors[1] != nil ? @armors[1].id : 0
  end
  def armor3_id
    return @armors[2] != nil ? @armors[2].id : 0
  end
  def armor4_id
    return @armors[3] != nil ? @armors[3].id : 0
  end

  def weapon_id=(id)
    equip(0, id)
  end
  def armor1_id=(id)
    equip(1, id)
  end
  def armor2_id=(id)
    equip(2, id)
  end
  def armor3_id=(id)
    equip(3, id)
  end
  def armor4_id=(id)
    equip(4, id)
  end

  def unequip_weapon
    $game_party.gain_weapon(@weapon, 1) if @weapon != nil
    @weapon = nil
  end
  
  def unequip_armor(armor_slot)
    $game_party.gain_armor(@armors[armor_slot], 1) if @armors[armor_slot] != nil
    @armors[armor_slot] = nil
  end
  
  def equip_weapon(id)
    return if id == 0
    $game_party.lose_weapon(id, 1)
    id = Weapon_Condition.new(id) if id.is_a?(Numeric)
    @weapon = id if id.is_a?(Condition_Item) #? id : Condition_Item.new(id, "weapon")
  end
  
  def equip_armor(id, armor_slot)
    return if id == 0
    $game_party.lose_armor(id, 1)
    id = Armor_Condition.new(id) if id.is_a?(Numeric)
    if id.is_a?(Condition_Item) #? id : Condition_Item.new(id, "armor")
      @armors[armor_slot] = id 
    end
  end

  #--------------------------------------------------------------------------
  # * Change Equipment
  #     equip_type : type of equipment
  #     id    : weapon or armor ID (If 0, remove equipment)
  #--------------------------------------------------------------------------
  def equip(equip_type, id)
    id = 0 if id == nil
    if equip_type == 0   # Weapon
      unequip_weapon
      equip_weapon(id) if id != 0
      @weapon_id = weapon_id()
    elsif equip_type < 5 # Armor
      armor_slot = equip_type - 1
      unequip_armor(armor_slot)
      equip_armor(id, armor_slot) if id != 0
      case armor_slot
      when 0
        @armor1_id = armor1_id()
      when 1
        @armor2_id = armor2_id()
      when 2
        @armor3_id = armor3_id()
      when 3
        @armor4_id = armor4_id()
      end
    else
      # "Piercing not implemented"
    end
    $game_switches[100] = true
  end
end
class Scene_Equip
   def refresh
    # Set item window to visible
    @item_window1.visible = (@right_window.index == 0)
    @item_window2.visible = (@right_window.index == 1)
    @item_window3.visible = (@right_window.index == 2)
    @item_window4.visible = (@right_window.index == 3)
    @item_window5.visible = (@right_window.index == 4)
    # Get currently equipped item
    item1 = @right_window.item
    # Set current item window to @item_window
    case @right_window.index
    when 0
      @item_window = @item_window1
    when 1
      @item_window = @item_window2
    when 2
      @item_window = @item_window3
    when 3
      @item_window = @item_window4
    when 4
      @item_window = @item_window5
    end
    # If right window is active
    if @right_window.active
      # Erase parameters for after equipment change
      @left_window.set_new_parameters(nil, nil, nil)
    end
    # If item window is active
    if @item_window.active
      # Get currently selected item
      item2 = @item_window.item
      # Change equipment
      last_hp = @actor.hp
      last_sp = @actor.sp
      @actor.equip(@right_window.index, item2 == nil ? 0 : item2)
      # Get parameters for after equipment change
      new_atk = @actor.atk
      new_pdef = @actor.pdef
      new_mdef = @actor.mdef
      # Return equipment
      @actor.equip(@right_window.index, item1 == nil ? 0 : item1)
      @actor.hp = last_hp
      @actor.sp = last_sp
      # Draw in left window
      @left_window.set_new_parameters(new_atk, new_pdef, new_mdef)
    end
  end
end

=begin
Modifiers for actor wearing the items
=end
class Game_Actor < Game_Battler
  def get_quality_modifiers(sym)
    n = 0
    n -= get_weapon_quality_modifier(sym)
    n -= get_armor1_quality_modifier(sym)
    n -= get_armor2_quality_modifier(sym)
    n -= get_armor3_quality_modifier(sym)
    n -= get_armor4_quality_modifier(sym)
    return n
  end
  def get_weapon_quality_modifier(sym)
    return @weapon != nil ? (1 - @weapon.quality.to_f/100) * @weapon.send(sym) : 0
  end
  def get_armor_quality_modifiers(sym)
    n = 0
    n -= get_armor1_quality_modifier(sym)
    n -= get_armor2_quality_modifier(sym)
    n -= get_armor3_quality_modifier(sym)
    n -= get_armor4_quality_modifier(sym)
    return n
  end
  def get_armor1_quality_modifier(sym)
    return @armors[0] != nil ? (1 - @armors[0].quality.to_f/100) * @armors[0].send(sym) : 0
  end
  def get_armor2_quality_modifier(sym)
    return @armors[1] != nil ? (1 - @armors[1].quality.to_f/100) * @armors[1].send(sym) : 0
  end
  def get_armor3_quality_modifier(sym)
    return @armors[2] != nil ? (1 - @armors[2].quality.to_f/100) * @armors[2].send(sym) : 0
  end
  def get_armor4_quality_modifier(sym)
    return @armors[3] != nil ? (1 - @armors[3].quality.to_f/100) * @armors[3].send(sym) : 0
  end
  
  alias quality_modifier_base_str_pre base_str
  def base_str
    n = quality_modifier_base_str_pre
    n += get_quality_modifiers(:str_plus)
    return [[n, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Dexterity
  #--------------------------------------------------------------------------
  alias quality_modifier_base_dex_pre base_dex
  def base_dex
    n = quality_modifier_base_dex_pre
    n += get_quality_modifiers(:dex_plus)
    return [[n, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Agility
  #--------------------------------------------------------------------------
  alias quality_modifier_base_agi_pre base_agi
  def base_agi
    n = quality_modifier_base_agi_pre
    n += get_quality_modifiers(:agi_plus)
    return [[n, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Intelligence
  #--------------------------------------------------------------------------
  alias quality_modifier_base_int_pre base_int
  def base_int
    n = quality_modifier_base_int_pre
    n += get_quality_modifiers(:int_plus)
    return [[n, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Attack Power
  #--------------------------------------------------------------------------
  alias quality_modifier_base_atk_pre base_atk
  def base_atk
    n = quality_modifier_base_atk_pre
    n -= get_weapon_quality_modifier(:atk)
    return n
  end
  #--------------------------------------------------------------------------
  # * Get Basic Physical Defense
  #--------------------------------------------------------------------------
  alias quality_modifier_base_pdef_pre base_pdef
  def base_pdef
    n = quality_modifier_base_pdef_pre
    n += get_quality_modifiers(:pdef)
    return n
  end
  #--------------------------------------------------------------------------
  # * Get Basic Magic Defense
  #--------------------------------------------------------------------------
  alias quality_modifier_base_mdef_pre base_mdef
  def base_mdef
    n = quality_modifier_base_mdef_pre
    n += get_quality_modifiers(:mdef)
    return n
  end
  #--------------------------------------------------------------------------
  # * Get Basic Evasion Correction
  #--------------------------------------------------------------------------
  alias quality_modifier_base_eva_pre base_eva
  def base_eva
    n = quality_modifier_base_eva_pre
    n += get_armor_quality_modifiers(:eva)
    return n
  end
end
=begin
Damage modifiers
=end
class Game_Battler
  def damage_weapon(damage)
    @weapon.hp -= damage if @weapon != nil
  end
  def damage_armor1(damage)
    @armors[0].hp -=damage if @armors[0] != nil
  end
  def damage_armor2(damage)
    @armors[1].hp -= damage if @armors[1] != nil
  end
  def damage_armor3(damage)
    @armors[2].hp -= damage if @armors[2] != nil
  end
  def damage_armor4(damage)
    @armors[3].hp -= damage if @armors[3] != nil
  end
  
  def do_damage_armor(attacker, modifier, damage, critical)
    damage = self.damage # value
    critical = self.critical # true/false
    if @armors[1] != nil # Shield
      d = damage - @armors[1].send(modifier)
      d -= @armors[1].send(modifier) if self.guarding? # Double the effect if guarding
      d = [0, d].max
      damage -= d # Remove from the damage pool
      damage_armor2(d)
    end
    if @armors[2] != nil # Body armor
      d = damage -= @armors[2].send(modifier)
      d = [0, d].max
      damage -= d
      # Damage modifiers
      damage_armor3(d)
    end
    if @armors[0] != nil # Helmet
      d = damage -= @armors[0].send(modifier)
      d = [0, d].max
      damage -= d
      damage_armor1(d)
    end
    if @armors[3] != nil # Accessories
      d = damage
      # Damage modifiers
      d -= @armors[3].send(modifier)
      damage -= d
      damage_armor4(d)
    end
  end
  def do_damage_weapon(target, damage, critical)
    if @weapon != nil
      d = (atk * 0.85) - damage
      if d > 0 # If less damage was done than the base atk of the weapon
        d -= @weapon.pdef
        d /= 10
        d = [0, d].max.to_i
        #p "#{@weapon.hp} - #{d}"
        damage_weapon(d)
        #p "#{@weapon.hp}"
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Applying Normal Attack Effects
  #     attacker : battler
  #--------------------------------------------------------------------------
  alias pre_attack_durability_update attack_effect
  def attack_effect(attacker)
    return_value = pre_attack_durability_update(attacker)
    if self.is_a?(Game_Actor)
      if self.damage != "Miss" # If the attack wasn't a miss
        do_damage_armor(attacker, :pdef, self.damage, self.critical)
      end
    end
    if attacker.is_a?(Game_Actor)
      if self.damage != "Miss" # If the attack wasn't a miss
        attacker.do_damage_weapon(self, self.damage, self.critical)
      end
    end
    return return_value
  end
  alias pre_skill_durability_update skill_effect
  def skill_effect(user, skill)
    return_value = pre_skill_durability_update(user, skill)
    if self.is_a?(Game_Actor)
      if self.damage != "Miss" # If the attack wasn't a miss
        do_damage_armor(user, :mdef, self.damage, self.critical)
      end
    end
    return return_value
  end
end