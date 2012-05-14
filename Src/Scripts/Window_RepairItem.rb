class Window_RepairItem < Window_Selectable
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     actor      : actor
  #     equip_type : equip region (0-3)
  #--------------------------------------------------------------------------
  def initialize(cost)
    super(0, 0, 640, 480)
    @cost = cost # cost modifier
    refresh
    self.active = false
    self.index = -1
  end
  #--------------------------------------------------------------------------
  # * Item Acquisition
  #--------------------------------------------------------------------------
  def item
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []

    @data += $game_party.weapons || []
    @data += $game_party.armors || []
    
    for actor in $game_party.actors
      @data << actor.weapon if actor.weapon != nil
      @data << actor.armor1 if actor.armor1 != nil
      @data << actor.armor2 if actor.armor2 != nil
      @data << actor.armor3 if actor.armor3 != nil
      @data << actor.armor4 if actor.armor4 != nil
    end
    
    @data = @data.select do |item|
      item.condition < 100
    end
    
    data = @data.sort do |item1, item2|
      item1.condition <=> item2.condition
    end
    
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
    stat_change = get_stat_change(index)
    owner = get_owner(index)
    item = @data[index]
    x = 4
    y = index * 32

    repair_cost = (item.repair_cost * @cost).to_i
    
    bitmap = RPG::Cache.icon(item.icon_name)
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24))
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 28, y, 50, 32, "#{item.condition}%", 0)
    #self.contents.draw_text(x + 50, y, 16, 32, " ", 1)
    self.contents.draw_text(x + 80, y, 214, 32, "#{item.name}", 0)
    self.contents.draw_text(x + 300, y, 70, 32, "#{repair_cost}g", 2)
    self.contents.draw_text(x + 380, y, 100, 32, owner.name, 0) if owner != nil
    
    stats = ""
    
    stat_change.each { |stat_name, change|
      stats += " %s+%1d" % [stat_name, change]
    }
    
    self.contents.draw_text(x + 490, y, 115, 32, stats, 0) if stats != nil
  end
  
  def get_stat_change(index)
    item = @data[index]
    
    item_clone = item.clone
    item_clone.hp = item_clone.max_hp
    
    stats = %w{pdef mdef str_plus dex_plus agi_plus int_plus}
    stats << "atk" if item.is_a?(Weapon_Condition)
    stats << "eva" if item.is_a?(Armor_Condition)
    
    stats_change = {}
    
    stats.each { |stat_name|
      stats_change[stat_name] = item_clone.send(stat_name) - item.send(stat_name)
    }
    #return stats_change
    return stats_change.select { |stat_name, change|
      change != 0
    }
  end
  
  def get_owner(index)
    item = @data[index]
    if item.is_a?(Armor_Condition)
      haystack = ["armor%d" % (item.kind + 1).to_s]
    elsif item.is_a?(Weapon_Condition)
      haystack = ["weapon"]
    end
    $game_party.actors.each { |actor|
      haystack.each { |item_name|
        return actor if actor.send(item_name) == item
      }
    }
    return nil
  end
  
  #--------------------------------------------------------------------------
  # * Help Text Update
  #--------------------------------------------------------------------------
  def update_help
    @help_window.set_text(self.item == nil ? "" : "#{self.item.hp} / #{self.item.max_hp} hp")
  end
end