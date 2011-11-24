class Scene_Piercings
   def refresh
    # Set item window to visible
    # @item_window1.visible = (@right_window.index == 0 or @right_window.index == 1 or @right_window.index == 2 or @right_window.index == 3 or @right_window.index == 4 or @right_window.index == 5 or @right_window.index == 6)
    @item_window1.visible = true
    # Get currently equipped item
    item1 = @right_window.item
    # Set current item window to @item_window
    @item_window = @item_window1
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
# ** Window_PierceRight
#------------------------------------------------------------------------------
#  This window displays items the actor is currently equipped with on the
#  piercings screen.
#==============================================================================

class Window_PierceRight < Window_Selectable
  def refresh
    self.contents.clear
    self.contents.font.color = system_color
    @data = []
    @list = []
    if($game_switches[151] == true)
      @list.push(5)
      @data.push(@actor.pierce1)
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Ear")
      draw_item_name(@actor.pierce1, 92, 32 * (@data.size - 1))
    end
    if($game_switches[152] == true)
      @list.push(6)
      @data.push(@actor.pierce2)
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Nose")
      draw_item_name(@actor.pierce2, 92, 32 * (@data.size - 1))
    end
    if($game_switches[153] == true)
      @list.push(7)
      @data.push(@actor.pierce3)
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Tongue")
      draw_item_name(@actor.pierce3, 92, 32 * (@data.size - 1))
    end
    if($game_switches[154] == true)
      @list.push(8)
      @data.push(@actor.pierce4)
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Nipples")
      draw_item_name(@actor.pierce4, 92, 32 * (@data.size - 1))
    end
    if($game_switches[155] == true)
      @list.push(9)
      @data.push(@actor.pierce5)
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Stomach")
      draw_item_name(@actor.pierce5, 92, 32 * (@data.size - 1))
    end
    if($game_switches[156] == true)
      @list.push(10)
      @data.push(@actor.pierce6)
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Labia")
      draw_item_name(@actor.pierce6, 92, 32 * (@data.size - 1))
    end
    if($game_switches[157] == true)
      @list.push(11)
      @data.push(@actor.pierce7)
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Clitoris")
      draw_item_name(@actor.pierce7, 92, 32 * (@data.size - 1))
    end
    @item_max = @data.size
  end
end
#==============================================================================
# ** Window_PierceItem
#------------------------------------------------------------------------------
#  This window displays choices when opting to change piercing on the
#  piercing screen.
#==============================================================================

class Window_PierceItem < Window_Selectable
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
  def draw_item(index)
    item = @data[index]
    x = 4 + index % 2 * (288 + 32)
    y = index / 2 * 32
    return if item == nil
    bitmap = RPG::Cache.icon(item.icon_name)
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24))
    self.contents.font.color = normal_color
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    self.contents.draw_text(x + 240, y, 16, 32, " ", 1)
    self.contents.draw_text(x + 256, y, 24, 32, item.condition.to_s + "%", 2)
  end
end
