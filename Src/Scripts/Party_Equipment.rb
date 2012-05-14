# Uniquely identify items in party inventory and used by actors
class Condition_Item
  attr_reader :id
  attr_reader :hp
  def initialize(id)
    @id = id
    @hp = max_hp
  end
  def condition
    return ((@hp * 100) / max_hp).to_i
  end
  def method_missing(sym, *argz)
    return data.__send__ sym, *argz if data != nil
  end
  def hp=(hp)
    @hp = [[hp, 0].max, max_hp].min
  end
  def max_hp
    return [data.pdef, 1].max * [data.price, 1].max
  end
  def data
    return nil
  end
  def price
    return data.price * (condition/100.0)
  end
  def atk 
    return data.atk * (condition/100.0)
  end
  def pdef 
    return data.pdef * (condition/100.0)
  end
  def mdef 
    return data.mdef * (condition/100.0)
  end
  def str_plus 
    return data.str_plus * (condition/100.0)
  end
  def dex_plus
    return data.dex_plus * (condition/100.0)
  end
  def agi_plus 
    return data.agi_plus * (condition/100.0)
  end
  def int_plus
    return data.int_plus * (condition/100.0)
  end
  def base_price
    return data.price
  end
  def repair_cost
    return ((100 - condition) / 100.0 * base_price).to_i
  end
end
class Weapon_Condition < Condition_Item
  def initialize(weapon_id)
    super(weapon_id)
    @data = $data_weapons[@id]
  end
  def data
    return $data_weapons[@id]
  end
end
class Armor_Condition < Condition_Item
  def initialize(armor_id)
    super(armor_id)
  end
  def data
    return $data_armors[@id]
  end
  def eva
    return data.eva * (condition/100.0)
  end
end

class Game_Party
  attr_reader :weapons
  attr_reader :armors
  
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
    if n < 0 
      lose_weapon(weapon_id, -n)
    else
      if weapon_id.is_a?(Numeric)
        return if weapon_id == 0
        return if $data_weapons[weapon_id] == nil
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
  end
  #--------------------------------------------------------------------------
  # * Gain Armor
  #     armor_id : armor ID
  #     n        : quantity
  #--------------------------------------------------------------------------
  def gain_armor(armor_id, n)
    if n < 0
      lose_armor(armor_id, -n)
    else
      if armor_id.is_a?(Numeric)
        return if armor_id == 0
        return if $data_armors[armor_id] == nil
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
  end
  #--------------------------------------------------------------------------
  # * Lose Weapons
  #     weapon_id : weapon ID
  #     n         : quantity
  #--------------------------------------------------------------------------
  def lose_weapon(weapon_id, n)
    lost_weapon = []
    if weapon_id.is_a?(Condition_Item)
      lost_weapon << @weapons.delete(weapon_id)
    elsif weapon_id.is_a?(Numeric)
      weapon = @weapons.select { |weapon| weapon.id == weapon_id }
      if weapon != nil and weapon.length > 0
        for i in 0..[n, weapon.length - 1].min
          lost_weapon << @weapons.delete(weapon[i])
        end
      end
    end
    @weapons.uniq!
    lost_weapon
  end
  #--------------------------------------------------------------------------
  # * Lose Armor
  #     armor_id : armor ID
  #     n        : quantity
  #--------------------------------------------------------------------------
  def lose_armor(armor_id, n)
    lost_armor = []
    if armor_id.is_a?(Condition_Item)
      lost_armor << @armors.delete(armor_id)
    elsif armor_id.is_a?(Numeric)
      armor = @armors.select {
        |armor| armor.id == armor_id
      }
      if armor != nil and armor.length > 0
        for i in 0..[n, armor.length-1].min
          lost_armor << @armors.delete(armor[i])
        end
      end
    end
    @armors.uniq!
    lost_armor
  end
  
  def get_equippable_armors(class_id)
    armor_set = $data_classes[class_id].armor_set
    return @armors.select { |armor| 
      armor_set.include?(armor.id) && armor.condition > 0
    }
  end
  def get_equippable_weapons(class_id)
    weapon_set = $data_classes[class_id].weapon_set
    @weapons.select { |weapon| 
      weapon_set.include?(weapon.id) && weapon.condition > 0
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
    
    number = item.is_a?(Condition_Item) ? "#{item.condition}%" : ""
    
    bitmap = RPG::Cache.icon(item.icon_name)
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24))
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    self.contents.draw_text(x + 240, y, 16, 32, ":", 1)
    self.contents.draw_text(x + 256, y, 24, 32, number, 2)
  end
end


class Game_Actor < Game_Battler
  attr_reader :weapon
  attr_reader :armors
  alias pre_object_inventory_initialize initialize
  def initialize(actor_id)
    pre_object_inventory_initialize(actor_id)
    # Initialize actor and add default loadout (set by editor)
    @weapon = nil
    @armors = []
    weapon = $game_party.gain_weapon(@weapon_id, 1)
    armor1 = $game_party.gain_armor(@armor1_id, 1)
    armor2 = $game_party.gain_armor(@armor2_id, 1)
    armor3 = $game_party.gain_armor(@armor3_id, 1)
    armor4 = $game_party.gain_armor(@armor4_id, 1)
    pierce1 = $game_party.gain_armor(@pierce1_id, 1)
    pierce2 = $game_party.gain_armor(@pierce2_id, 1)
    pierce3 = $game_party.gain_armor(@pierce3_id, 1)
    pierce4 = $game_party.gain_armor(@pierce4_id, 1)
    pierce5 = $game_party.gain_armor(@pierce5_id, 1)
    pierce6 = $game_party.gain_armor(@pierce6_id, 1)
    pierce7 = $game_party.gain_armor(@pierce7_id, 1)
    equip(0, weapon)
    equip(1, armor1)
    equip(2, armor2)
    equip(3, armor3)
    equip(4, armor4)
    equip(5, pierce1)
    equip(6, pierce2)
    equip(7, pierce3)
    equip(8, pierce4)
    equip(9, pierce5)
    equip(10, pierce6)
    equip(11, pierce7)
  end
  def weapon_id
    return @weapon != nil ? @weapon.id : 0
  end
  def armor1_id
    return @armors[0] != nil ? @armors[0].id : 0
  end
  def armor1
    return @armors[0]
  end
  def armor2_id
    return @armors[1] != nil ? @armors[1].id : 0
  end
  def armor2
    return @armors[1]
  end
  def armor3_id
    return @armors[2] != nil ? @armors[2].id : 0
  end
  def armor3
    return @armors[2]
  end
  def armor4_id
    return @armors[3] != nil ? @armors[3].id : 0
  end
  def armor4
    return @armors[3]
  end
  def pierce1_id
    return @armors[4] != nil ? @armors[4].id : 0
  end
  def pierce1
    return @armors[4]
  end
  def pierce2_id
    return @armors[5] != nil ? @armors[5].id : 0
  end
  def pierce2
    return @armors[5]
  end
  def pierce3_id
    return @armors[6] != nil ? @armors[6].id : 0
  end
  def pierce3
    return @armors[6]
  end
  def pierce4_id
    return @armors[7] != nil ? @armors[7].id : 0
  end
  def pierce4
    return @armors[7]
  end
  def pierce5_id
    return @armors[8] != nil ? @armors[8].id : 0
  end
  def pierce5
    return @armors[8]
  end
  def pierce6_id
    return @armors[9] != nil ? @armors[9].id : 0
  end
  def pierce6
    return @armors[9]
  end
  def pierce7_id
    return @armors[10] != nil ? @armors[10].id : 0
  end
  def pierce7
    return @armors[10]
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
  def pierce1_id=(id)
    equip(5, id)
  end
  def pierce2_id=(id)
    equip(6, id)
  end
  def pierce3_id=(id)
    equip(7, id)
  end
  def pierce4_id=(id)
    equip(8, id)
  end
  def pierce5_id=(id)
    equip(9, id)
  end
  def pierce6_id=(id)
    equip(10, id)
  end
  def pierce7_id=(id)
    equip(11, id)
  end
  
  # Add worn weapon to the party inventory, and remove from actor
  def unequip_weapon
    $game_party.gain_weapon(@weapon, 1) if @weapon != nil
    @weapon = nil
  end
  
  # Add armor in the provided armor slot to the party inventory. Remove item in provided armor slot from the actor's inventory.
  # 0 = helmet
  # 1 = shield
  # 2 = body armor
  # 3 = accessories
  # 4-11 = piercings
  def unequip_armor(armor_slot)
    $game_party.gain_armor(@armors[armor_slot], 1) if @armors[armor_slot] != nil
    @armors[armor_slot] = nil
  end
  
  def equip_weapon(id)
    return if id == 0
    $game_party.lose_weapon(id, 1)
    id = Weapon_Condition.new(id) if id.is_a?(Numeric) && $data_weapons[id] != nil
    @weapon = id if id.is_a?(Condition_Item) #? id : Condition_Item.new(id, "weapon")
  end
  
  def equip_armor(id, armor_slot)
    return if id == 0
    $game_party.lose_armor(id, 1)
    id = Armor_Condition.new(id) if id.is_a?(Numeric) && $data_armors[id] != nil
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
    return if equip_type == nil
    if equip_type == 0   # Weapon
      unequip_weapon
      equip_weapon(id) if id != 0
      @weapon_id = weapon_id()
    elsif equip_type < 12 # Armor
      armor_slot = equip_type - 1
      
      if id.is_a?(Numeric)
        update_auto_state(@armors[armor_slot], $data_armors[id])
      elsif id.is_a?(Armor_Condition) or id.is_a?(RPG::Armor)
        update_auto_state(@armors[armor_slot], id)
      end
      
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
      when 4
        @pierce1_id = pierce1_id()
      when 5
        @pierce2_id = pierce2_id()
      when 6
        @pierce3_id = pierce3_id()
      when 7
        @pierce4_id = pierce4_id()
      when 8
        @pierce5_id = pierce5_id()
      when 9
        @pierce6_id = pierce6_id()
      when 10
        @pierce7_id = pierce7_id()
      end
    end
    # Set switch 100 to ON (triggers update equipment CE)
    $game_switches[100] = true # Inline call to equipment update if possible
  end
  def equippable?(item)
    # If weapon
    if item.is_a?(RPG::Weapon) || item.is_a?(Weapon_Condition)
      # If included among equippable weapons in current class
      if $data_classes[@class_id].weapon_set.include?(item.id)
        return true
      end
    end
    # If armor
    if item.is_a?(RPG::Armor) || item.is_a?(Armor_Condition)
      # If included among equippable armor in current class
      if $data_classes[@class_id].armor_set.include?(item.id)
        return true
      end
    end
    return false
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
class Window_EquipRight < Window_Selectable
  def draw_item_name(item, x, y)
    if item == nil
      return
    end
    bitmap = RPG::Cache.icon(item.icon_name)
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24))
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 28, y, 212, 32, "#{item.name} (#{item.condition})")
  end
  def refresh
    self.contents.clear
    @data = []
    @data.push(@actor.weapon)
    @data.push(@actor.armor1)
    @data.push(@actor.armor2)
    @data.push(@actor.armor3)
    @data.push(@actor.armor4)
    @item_max = @data.size
    self.contents.font.color = system_color
    self.contents.draw_text(4, 32 * 0, 92, 32, $data_system.words.weapon)
    self.contents.draw_text(4, 32 * 1, 92, 32, $data_system.words.armor1)
    self.contents.draw_text(4, 32 * 2, 92, 32, $data_system.words.armor2)
    self.contents.draw_text(4, 32 * 3, 92, 32, $data_system.words.armor3)
    self.contents.draw_text(5, 32 * 4, 92, 32, $data_system.words.armor4)
    draw_item_name(@data[0], 92, 32 * 0)
    draw_item_name(@data[1], 92, 32 * 1)
    draw_item_name(@data[2], 92, 32 * 2)
    draw_item_name(@data[3], 92, 32 * 3)
    draw_item_name(@data[4], 92, 32 * 4)
  end
end
=begin
Damage modifiers
=end
class Game_Battler
  def damage_weapon(damage)
    if @weapon != nil
      @weapon.hp -= damage
      # equip the weapon slot (0) with item 0 (nothing)
      equip(0, 0) if @weapon.hp < 1 # && weapon_fix == false
    end
  end
  def damage_armor1(damage)
    damage_armor(0, damage)
  end
  def damage_armor2(damage)
    damage_armor(1, damage)
  end
  def damage_armor3(damage)
    damage_armor(2, damage)
  end
  def damage_armor4(damage)
    damage_armor(3, damage)
  end
  def damage_armor(armor_slot, damage)
    if @armors[armor_slot] != nil
      @armors[armor_slot].hp -= damage
      armor_fix = __send__ "armor#{armor_slot+1}_fix".to_sym
      # equip armor slot (armor_slot + 1) with item 0 (nothing)
      equip(armor_slot+1, 0) if @armors[armor_slot].hp < 1 && armor_fix == false
    end
  end  
  
  def do_damage_armor(attacker, modifier, damage, critical)
    if @armors[1] != nil # Shield
      d = damage - @armors[1].send(modifier)
      d -= @armors[1].send(modifier) if self.guarding? # Double the effect if guarding
      d = [0, d].max
      damage -= d # Remove from the damage pool
      damage_armor2(d)
    end
    if @armors[2] != nil # Body armor
      d = damage 
      d -= @armors[2].send(modifier)
      d = [0, d].max
      damage -= d
      # Damage modifiers
      damage_armor3(d)
    end
    if @armors[0] != nil # Helmet
      d = damage 
      d -= @armors[0].send(modifier)
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
        do_damage_armor(attacker, :pdef, self.damage.to_i, !!self.critical)
      end
    end
    if attacker.is_a?(Game_Actor)
      if self.damage != "Miss" # If the attack wasn't a miss
        attacker.do_damage_weapon(self, self.damage.to_i, !!self.critical)
      end
    end
    return return_value
  end
  alias pre_skill_durability_update skill_effect
  def skill_effect(user, skill)
    return_value = pre_skill_durability_update(user, skill)
    if self.is_a?(Game_Actor)
      if self.damage != "Miss" # If the attack wasn't a miss
        do_damage_armor(user, :mdef, self.damage.to_i, !!self.critical)
      end
    end
    return return_value
  end
end
class Window_ShopSell < Window_Selectable
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    for i in 1...$data_items.size
      if $game_party.item_number(i) > 0
        @data.push($data_items[i])
      end
    end
    
    @data += $game_party.weapons
    @data += $game_party.armors
    
    
    # If item count is not 0, make a bitmap and draw all items
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
      for i in 0...@item_max
        draw_item(i)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #     index : item number
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    case item
    when RPG::Item
      number = $game_party.item_number(item.id).to_s
    when Weapon_Condition
      number = "#{item.condition}%"
    when Armor_Condition
      number = "#{item.condition}%"
    end
    # If items are sellable, set to valid text color. If not, set to invalid
    # text color.
    if item.price > 0
      self.contents.font.color = normal_color
    else
      self.contents.font.color = disabled_color
    end
    x = 4 + index % 2 * (288 + 32)
    y = index / 2 * 32
    rect = Rect.new(x, y, self.width / @column_max - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(item.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    self.contents.draw_text(x + 240, y, 16, 32, ":", 1)
    self.contents.draw_text(x + 256, y, 24, 32, number, 2)
  end
end
class Scene_Shop
  #--------------------------------------------------------------------------
  # * Frame Update (when sell window is active)
  #--------------------------------------------------------------------------
  def update_sell
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Change windows to initial mode
      @command_window.active = true
      @dummy_window.visible = true
      @sell_window.active = false
      @sell_window.visible = false
      @status_window.item = nil
      # Erase help text
      @help_window.set_text("")
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get item
      @item = @sell_window.item
      # Set status window item
      @status_window.item = @item
      # If item is invalid, or item price is 0 (unable to sell)
      if @item == nil or @item.price == 0
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Get items in possession count
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when Weapon_Condition # RPG::Weapon
        number = 1 # $game_party.weapon_number(@item.id)
      when Armor_Condition # RPG::Armor
        number = 1 # $game_party.armor_number(@item.id)
      end
      # Maximum quanitity to sell = number of items in possession
      max = number
      # Change windows to quantity input mode
      @sell_window.active = false
      @sell_window.visible = false
      @number_window.set(@item, max, @item.price / 2)
      @number_window.active = true
      @number_window.visible = true
      @status_window.visible = true
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when quantity input window is active)
  #--------------------------------------------------------------------------
  def update_number
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Branch by command window cursor position
      case @command_window.index
      when 0  # buy
        # Change windows to buy mode
        @buy_window.active = true
        @buy_window.visible = true
      when 1  # sell
        # Change windows to sell mode
        @sell_window.active = true
        @sell_window.visible = true
        @status_window.visible = false
      end
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play shop SE
      $game_system.se_play($data_system.shop_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Branch by command window cursor position
      case @command_window.index
      when 0  # buy
        # Buy process
        $game_party.lose_gold(@number_window.number * @item.price)
        case @item
        when RPG::Item
          $game_party.gain_item(@item.id, @number_window.number)
        when RPG::Weapon
          $game_party.gain_weapon(@item.id, @number_window.number)
        when RPG::Armor
          $game_party.gain_armor(@item.id, @number_window.number)
        end
        # Refresh each window
        @gold_window.refresh
        @buy_window.refresh
        @status_window.refresh
        # Change windows to buy mode
        @buy_window.active = true
        @buy_window.visible = true
      when 1  # sell
        # Sell process
        $game_party.gain_gold(@number_window.number * (@item.price / 2))
        case @item
        when RPG::Item
          $game_party.lose_item(@item.id, @number_window.number)
        when Weapon_Condition # RPG::Weapon
          $game_party.lose_weapon(@item, @number_window.number) # @item.id -> @item
        when Armor_Condition # RPG::Armor
          $game_party.lose_armor(@item, @number_window.number) # @item.id -> @item
        end
        # Refresh each window
        @gold_window.refresh
        @sell_window.refresh
        @status_window.refresh
        # Change windows to sell mode
        @sell_window.active = true
        @sell_window.visible = true
        @status_window.visible = false
      end
      return
    end
  end
end
class Window_ShopStatus < Window_Base
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    if @item == nil
      return
    end
    if @item.is_a?(RPG::Item)
      number = $game_party.item_number(@item.id)
    elsif @item.is_a?(Weapon_Condition) or @item.is_a?(RPG::Weapon)
      number = $game_party.weapon_number(@item.id)
    elsif @item.is_a?(Armor_Condition) or @item.is_a?(RPG::Armor)
      number = $game_party.armor_number(@item.id)
    end
    self.contents.font.color = system_color
    self.contents.draw_text(4, 0, 200, 32, "number in possession")
    self.contents.font.color = normal_color
    self.contents.draw_text(204, 0, 32, 32, number.to_s, 2)
    if @item.is_a?(RPG::Item)
      return
    end
    # Equipment adding information
    for i in 0...$game_party.actors.size
      # Get actor
      actor = $game_party.actors[i]
      # If equippable, then set to normal text color. If not, set to
      # invalid text color.
      if actor.equippable?(@item)
        self.contents.font.color = normal_color
      else
        self.contents.font.color = disabled_color
      end
      
      # Get current equipment
      if @item.is_a?(Weapon_Condition)
        item1 = actor.weapon
      elsif @item.is_a?(Armor_Condition)
        if @item.kind == 0
          item1 = actor.armor1
        elsif @item.kind == 1
          item1 = actor.armor2
        elsif @item.kind == 2
          item1 = actor.armor3
        else
          item1 = actor.armor4
        end
      end
      
      # Draw actor's name
      self.contents.draw_text(4, 64 + 64 * i, 120, 32, actor.name)
      # If equippable
      if actor.equippable?(@item)
        # If weapon
        if @item.is_a?(Weapon_Condition) or @item.is_a?(RPG::Weapon)
          atk1 = item1 != nil ? item1.atk : 0
          atk2 = @item != nil ? @item.atk : 0
          change = atk2 - atk1
        end
        # If armor
        if @item.is_a?(Armor_Condition) or @item.is_a?(RPG::Armor)
          pdef1 = item1 != nil ? item1.pdef : 0
          mdef1 = item1 != nil ? item1.mdef : 0
          pdef2 = @item != nil ? @item.pdef : 0
          mdef2 = @item != nil ? @item.mdef : 0
          change = pdef2 - pdef1 + mdef2 - mdef1
        end
        # Draw parameter change values
        self.contents.draw_text(124, 64 + 64 * i, 112, 32,
          sprintf("%+d", change), 2)
      end
      # Draw item
      if item1 != nil
        x = 4
        y = 64 + 64 * i + 32
        bitmap = RPG::Cache.icon(item1.icon_name)
        opacity = self.contents.font.color == normal_color ? 255 : 128
        self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
        self.contents.draw_text(x + 28, y, 212, 32, item1.name)
      end
    end
  end
end
=begin
Actor modifiers for equipment worn
=end
class Game_Actor < Game_Battler
  def get_modifiers_armors(sym)
    @armors.inject(0) { |prod, armor|
      prod += armor.send(sym) if armor != nil
      prod # pass on the prod
    }
  end
  def get_modifiers_weapon(sym)
    if @weapon != nil
      return @weapon.send(sym)
    else
      return 0
    end
  end
  def get_modifiers_equipment(sym)
    return get_modifiers_armors(sym) + get_modifiers_weapon(sym)
  end
  #--------------------------------------------------------------------------
  # * Get Basic Strength
  #--------------------------------------------------------------------------
  def base_str
    n = @parameters[2, @level]
    n += get_modifiers_equipment(:str_plus)
    return [[n, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Dexterity
  #--------------------------------------------------------------------------
  def base_dex
    n = @parameters[3, @level]
    n += get_modifiers_equipment(:dex_plus)
    return [[n, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Agility
  #--------------------------------------------------------------------------
  def base_agi
    n = @parameters[4, @level]
    n += get_modifiers_equipment(:agi_plus)
    return [[n, 1].max, 999].min
  end
  #--------------------------------------------------------------------------
  # * Get Basic Intelligence
  #--------------------------------------------------------------------------
  def base_int
    n = @parameters[5, @level]
    n += get_modifiers_equipment(:int_plus)
    return [[n, 1].max, 999].min
  end
    #--------------------------------------------------------------------------
  # * Get Basic Attack Power
  #--------------------------------------------------------------------------
  def base_atk
    return get_modifiers_weapon(:atk) if @weapon != nil
    return base_str * 2
  end
  #--------------------------------------------------------------------------
  # * Get Basic Physical Defense
  #--------------------------------------------------------------------------
  def base_pdef
    return get_modifiers_equipment(:pdef)
  end
  #--------------------------------------------------------------------------
  # * Get Basic Magic Defense
  #--------------------------------------------------------------------------
  def base_mdef
    return get_modifiers_equipment(:mdef)
  end
  #--------------------------------------------------------------------------
  # * Get Basic Evasion Correction
  #--------------------------------------------------------------------------
  def base_eva
    return get_modifiers_armors(:eva)
  end
end