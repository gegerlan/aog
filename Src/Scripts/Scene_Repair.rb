#==============================================================================
# ** Scene_Repair
#------------------------------------------------------------------------------
#  This class performs repair screen processing.
#==============================================================================

class Scene_Repair
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     actor_index : actor index
  #     equip_index : equipment index
  #--------------------------------------------------------------------------
  def initialize(cost = 1)
    @cost = cost # Cost modifier (1 = none)
    main
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    # Make windows
    @main_window = Window_RepairItem.new(@cost)

    refresh
    # Execute transition
    Graphics.transition
    
    @main_window.active = true
    @main_window.index = 0
    
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
    @main_window.dispose
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    # Get currently equipped item
    item1 = @main_window.item
    
    # If item window is active
    if @main_window.active
      # Draw in left window
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Update windows
    @main_window.update
    refresh

    # If right window is active: call update_right
    if @main_window.active
      update_main
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when right window is active)
  #--------------------------------------------------------------------------
  def update_main
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to map
      $scene = Scene_Map.new
      
      @main_window.active = false
      
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      item = @main_window.item
      
      if item == nil
        #$scene = Scene_Map.new
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      
      if item.condition == 100
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      
      repair_cost = (item.repair_cost * @cost).to_i
      if repair_cost > $game_party.gold
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      
      $game_party.lose_gold(repair_cost)
      item.hp = item.max_hp
      
      @main_window.refresh
      
      return
    end
  end
end
