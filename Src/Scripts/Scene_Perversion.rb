#==============================================================================
# ** Scene_Perversion
#------------------------------------------------------------------------------
#  This class performs perversion screen processing.
#==============================================================================

class Scene_Perversion
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     actor_index : actor index
  #     equip_index : equipment index
  #--------------------------------------------------------------------------
  def initialize
    main
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    
    actor = $game_party.actors[0]
    
    # Make windows
    @main_window = Window_Perversion.new(actor)
    @status_window = Window_PerversityStatus.new(actor)
    
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
    @status_window.dispose
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
    @status_window.update
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
      
      return
    end
  end
end
