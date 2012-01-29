=begin
Checks or sets events' self-switches. Used from the script event command.
Example
  switch_off?(1, "A")
    => true # Event on index 1, self-switch A, on the current map, is OFF
  switch_on(1, "A")
  switch_off?(1, "A")
    => false # Event on index 1, self-switch A, on the current map, is not OFF
=end
class Interpreter
=begin
  switch_off?(<event_id>, <switch_name>, <map_id = $game_map.map_id>)
    Parameters
      event_id (String or Integer) - identifier for event. Index (Integer) or name (String).
        Names can only be passed for events on the same map.
      switch_name (String) - identifier for the self-switch used. String.
        Recommended valus: A, B, C, D
      map_id (Integer) - the id of the map, where the events will be changed. Index (Integer).
        Default: Current map.
    Returns
      true or false (boolean) = true if switch is OFF for all events with shared identifier
    Example
      switch_off?(1, "A") # Is switch A=OFF on the current map?
      switch_off?(1, "A", 2) # Is switch A=OFF on map with index 2?
      switch_off?("Light", "D") # Are all the D self-switches for all Light events
        on the current map OFF?
=end
  def switch_off?(entitiy_id, switch, map_id = $game_map.map_id)
    state = get_self_switch_state(entitiy_id, switch, map_id)
    if state.is_a?(Array)
      return !state.include?(true)
    end
    return !state
  end
=begin
  switch_on?(<event_id>, <switch_name>, <map_id = $game_map.map_id>)
    Parameters
      event_id (String or Integer) - identifier for event. Index (Integer) or name (String).
        Names can only be passed for events on the same map.
      switch_name (String) - identifier for the self-switch used. String.
        Recommended valus: A, B, C, D
      map_id (Integer) - the id of the map, where the events will be changed. Index (Integer).
        Default: Current map.
    Returns
      true or false (boolean) = true if switch is ON for all events with shared identifier
    Example
      switch_on?(1, "A") # Is event on index 1's switch A set to ON on the current map?
      switch_on?(1, "A", 2) # Is event on index 1's switch A set to ON on map with index 2?
      switch_on?("Light", "D") # Have all events with the name Light their self-switch
        D set to ON on the current map ON?
=end
  def switch_on?(entitiy_id, switch, map_id = $game_map.map_id)
    state = get_self_switch_state(entitiy_id, switch, map_id)
    if state.is_a?(Array)
      return !state.include?(false)
    end
    return !!state
  end
=begin
  switch_on(<event_id>, <switch_name>, <map_id = $game_map.map_id>, <refresh = true>)
    Parameters
      event_id (String or Integer) - identifier for event. Index (Integer) or name (String).
        Names can only be passed for events on the same map.
      switch_name (String) - identifier for the self-switch used. String.
        Recommended valus: A, B, C, D
      map_id (Integer) - the id of the map, where the events will be changed. Index (Integer).
        Default: Current map.
      refresh (Boolean) - update event after changing self-switch
        Default: True
    Example
      switch_on(1, "A") # Sets event on index 1's switch A to ON on the current map
      switch_on(1, "A", 2) # Switches event on index 1's self switch A to ON
        for on map 2
      switch_on("Light", "D") # Sets D to ON for all events with the name Light
        on the current map
=end
  def switch_on(entitiy_id, switch, map_id = $game_map.map_id, refresh = true)
    set_self_switch_state(entitiy_id, switch, true, map_id, refresh)
  end
=begin
  switch_off(<event_id>, <switch_name>, <map_id = $game_map.map_id>, <refresh = true>)
    Parameters
      event_id (String or Integer) - identifier for event. Index (Integer) or name (String).
        Names can only be passed for events on the same map.
      switch_name (String) - identifier for the self-switch used. String.
        Recommended valus: A, B, C, D
      map_id (Integer) - the id of the map, where the events will be changed. Index (Integer).
        Default: Current map.
      refresh (Boolean) - update event after changing self-switch
        Default: True
    Example
      switch_off(1, "A") # Sets event on index 1's switch A to OFF on the current map
      switch_off(1, "A", 2) # Switches event on index 1's self switch A to OFF
        for on map 2
      switch_off("Light", "D") # Sets D to OFF for all events with the name Light
        on the current map
=end
  def switch_off(entitiy_id, switch, map_id = $game_map.map_id, refresh = true)
    set_self_switch_state(entitiy_id, switch, false, map_id, refresh)
  end
  def get_self_switch_state(entitiy_id, switch, map_id = $game_map.map_id)
    if entitiy_id.is_a?(Fixnum)
      return $game_self_switches[[map_id, entitiy_id, switch]]
    elsif entitiy_id.is_a?(String)
      if map_id == $game_map.map_id
        named_events = get_events_by_name(entitiy_id) || []
        if named_events.empty?
          p "Couldn't find events with the name #{entitiy_id}" if $DEBUG
          return nil
        end
        switch_state = []
        named_events.each do |event|
          switch_state << get_self_switch_state(event.id, switch, map_id)
        end
        if switch_state.length == 1
          return switch_state.pop
        else
          return switch_state
        end
      else
        p "Can't retrieve named events outside the current map, aborting." if $DEBUG
      end
    end    
    return nil
  end
  def set_self_switch_state(entitiy_id, switch, value, map_id = $game_map.map_id, refresh = true)
    if entitiy_id.is_a?(Fixnum)
      $game_self_switches[[map_id, entitiy_id, switch]] = value
      if refresh && $game_map.map_id == map_id
        $game_map.events[entitiy_id].refresh
      end
      return true
    elsif entitiy_id.is_a?(String)
      if map_id == $game_map.map_id
        named_events = get_events_by_name(entitiy_id) || []
        if named_events.empty?
          p "Couldn't find any events on the current map with the name #{entitiy_id}" if $DEBUG
          return false
        end
        named_events.each do |event|
          set_self_switch_state(event.id, switch, value, map_id)
          event.refresh if refresh
        end
        return true
      else
        p "Can't modify named events outside the current map, aborting." if $DEBUG
      end
    end    
    return false
  end
end