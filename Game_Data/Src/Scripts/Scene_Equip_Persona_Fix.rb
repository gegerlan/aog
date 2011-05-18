class Scene_Equip
  def main
    # Get actor
    @actor = $game_party.actors[@actor_index]
    # Make windows
    @help_window = Window_Help.new
    @left_window = Window_EquipLeft.new(@actor.clone)
    @right_window = Window_EquipRight.new(@actor)
    @item_window1 = Window_EquipItem.new(@actor, 0)
    @item_window2 = Window_EquipItem.new(@actor, 1)
    @item_window3 = Window_EquipItem.new(@actor, 2)
    @item_window4 = Window_EquipItem.new(@actor, 3)
    @item_window5 = Window_EquipItem.new(@actor, 4)
    # Associate help window
    @right_window.help_window = @help_window
    @item_window1.help_window = @help_window
    @item_window2.help_window = @help_window
    @item_window3.help_window = @help_window
    @item_window4.help_window = @help_window
    @item_window5.help_window = @help_window
    # Set cursor position
    @right_window.index = @equip_index
    refresh
    # Execute transition
    Graphics.transition
    # Main loop
    loop do
      # Update game screen
      Graphics.update
      # Update input information
      Input.update
      # Frame update
      update
      # Abort loop if screen is changed
      if $scene != self
        break
      end
    end
    # Prepare for transition
    Graphics.freeze
    # Dispose of windows
    @help_window.dispose
    @left_window.dispose
    @right_window.dispose
    @item_window1.dispose
    @item_window2.dispose
    @item_window3.dispose
    @item_window4.dispose
    @item_window5.dispose
  end
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
      item2 = @item_window.item || $data_armors[0]
      if @last_item != item2
        
        # Change equipment
        @last_hp = @actor.hp
        @last_sp = @actor.sp
        @actor.equip(@right_window.index, item2 == nil ? 0 : item2.id)
        # Get parameters for after equipment change
        new_atk = @actor.atk
        new_pdef = @actor.pdef
        new_mdef = @actor.mdef
        # Return equipment
        #@actor.equip(@right_window.index, item1 == nil ? 0 : item1.id)
        @actor.hp = @last_hp
        @actor.sp = @last_sp
        
        @last_item = item2
        
        # Draw in left window
        @left_window.set_new_parameters(new_atk, new_pdef, new_mdef)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when item window is active)
  #--------------------------------------------------------------------------
  def update_item
    # If B button was pressed
    if Input.trigger?(Input::B)
      
      item1 = @right_window.item
      @actor.equip(@right_window.index, item1 == nil ? 0 : item1.id)
      @actor.hp = @last_hp if @last_hp != nil
      @actor.sp = @last_sp if @last_sp != nil
      @left_window.set_new_parameters(@actor.atk, @actor.pdef, @actor.mdef)
      
      @last_item = -1
      
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
      @actor.equip(@right_window.index, item == nil ? 0 : item.id)
      # Activate right window
      @right_window.active = true
      @item_window.active = false
      @item_window.index = -1
      
      @left_window.actor = @actor.clone
      @left_window.refresh
      # Remake right window and item window contents
      @right_window.refresh
      @item_window.refresh
      return
    end
  end
end
