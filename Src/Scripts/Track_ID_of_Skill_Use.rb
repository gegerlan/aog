class Map_Battler < Game_Character
  #----------------------------------------------------------------------------
  # common_event_call
  #  object - the skill of item
  #  callee_id - the id of the caster (map_id for enemy)
  #  Runs a common event if supported by the object.
  #----------------------------------------------------------------------------
  def common_event_call(object, callee_id = id || 0)
    # if object calls common event
    if object.common_event_id > 0
      # temporary variable
      common_event = $data_common_events[object.common_event_id]
      # setup common event execution
      $game_system.map_interpreter.setup(common_event.list, callee_id, object.common_event_id)
    end
  end
end