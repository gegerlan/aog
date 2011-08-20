class Game_Event < Game_Character
  def name
    return event.name
  end
end
class Interpreter
  def call_event_by_name(event_name)
    @@__map_events__ ||= {} # the maps events indexed by name
    if @@__map_events__[:map_id] != $game_map.map_id # create a new index in non exsist for the map
      @@__map_events__.clear
      @@__map_events__[:map_id] = $game_map.map_id
      # Index map events based on name (note that names doesn't have to be unique for an event)
      $game_map.events.each do |index, map_event|
        (@@__map_events__[map_event.name] ||= []) << map_event
      end
    end
    return call_event(*@@__map_events__[event_name])
  end
  def call_event(*events)
    list = []
    for event in events
      list += event.list if event.is_a?(Game_Event)
    end
    if list.length != 0
      # Make child interpreter
      @child_interpreter = Interpreter.new(@depth + 1)
      @child_interpreter.setup(list, @event_id)
    end
    return true
  end
end