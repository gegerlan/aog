class Scene_Load < Scene_File
  alias force_map_update_save_data read_save_data
  def read_save_data(file)
    force_map_update_save_data(file)
    $game_map.setup($game_map.map_id)
    $game_player.center($game_player.x, $game_player.y)
  end
end
