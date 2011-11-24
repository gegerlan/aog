#==============================================================================
# ** Window_PierceRight
#------------------------------------------------------------------------------
#  This window displays items the actor is currently equipped with on the
#  piercings screen.
#==============================================================================

class Window_PierceRight < Window_Selectable
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     actor : actor
  #--------------------------------------------------------------------------
  def initialize(actor)
    super(272, 64, 368, 250)
    self.contents = Bitmap.new(width - 32, height - 32)
    @actor = actor
    refresh
    @index = 0
  end
  #--------------------------------------------------------------------------
  # * Item Acquisition
  #--------------------------------------------------------------------------
  def item
    return @data[@index]
  end
  def index
    return @list[@index]
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    self.contents.font.color = system_color
    @data = []
    @list = []
    if($game_switches[151] == true)
      @list.push(5)
      @data.push($data_armors[@actor.pierce1_id])
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Ear")
      draw_item_name($data_armors[@actor.pierce1_id], 92, 32 * (@data.size - 1))
    end
    if($game_switches[152] == true)
      @list.push(6)
      @data.push($data_armors[@actor.pierce2_id])
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Nose")
      draw_item_name($data_armors[@actor.pierce2_id], 92, 32 * (@data.size - 1))
    end
    if($game_switches[153] == true)
      @list.push(7)
      @data.push($data_armors[@actor.pierce3_id])
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Tongue")
      draw_item_name($data_armors[@actor.pierce3_id], 92, 32 * (@data.size - 1))
    end
    if($game_switches[154] == true)
      @list.push(8)
      @data.push($data_armors[@actor.pierce4_id])
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Nipples")
      draw_item_name($data_armors[@actor.pierce4_id], 92, 32 * (@data.size - 1))
    end
    if($game_switches[155] == true)
      @list.push(9)
      @data.push($data_armors[@actor.pierce5_id])
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Stomach")
      draw_item_name($data_armors[@actor.pierce5_id], 92, 32 * (@data.size - 1))
    end
    if($game_switches[156] == true)
      @list.push(10)
      @data.push($data_armors[@actor.pierce6_id])
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Labia")
      draw_item_name($data_armors[@actor.pierce6_id], 92, 32 * (@data.size - 1))
    end
    if($game_switches[157] == true)
      @list.push(11)
      @data.push($data_armors[@actor.pierce7_id])
      self.contents.draw_text(4, 32 * (@data.size - 1), 92, 32, "Clitoris")
      draw_item_name($data_armors[@actor.pierce7_id], 92, 32 * (@data.size - 1))
    end
    @item_max = @data.size
  end
  #--------------------------------------------------------------------------
  # * Help Text Update
  #--------------------------------------------------------------------------
  def update_help
    @help_window.set_text(self.item == nil ? "" : self.item.description)
  end
end