def switch_on?(entitiy_id, switch, map_id = $game_map.map_id)
  return $game_self_switches[[map_id, entitiy_id, switch]] == TRUE
end

def switch_off?(entitiy_id, switch, map_id = $game_map.map_id)
  return $game_self_switches[[map_id, entitiy_id, switch]] == FALSE
end

def switch_on(entitiy_id, switch, map_id = $game_map.map_id)
  $game_self_switches[[map_id, entitiy_id, switch]] = TRUE
end

def switch_off(entitiy_id, switch, map_id = $game_map.map_id)
  $game_self_switches[[map_id, entitiy_id, switch]] = FALSE
end