class Game_Map
  #--------------------------------------------------------------------------
  # * Get Terrain Tag
  #     x          : x-coordinate
  #     y          : y-coordinate
  #--------------------------------------------------------------------------
  def terrain_tag(x, y)
    if @map_id != 0
      for i in [2, 1, 0]
        tile_id = data[x, y, i]
        if tile_id == nil
          return 0
        elsif !@terrain_tags[tile_id]
          print("Terrain tag error for tile %s" % [tile_id.to_s]) if $DEBUG
          return 0
        elsif @terrain_tags[tile_id] > 0
          return @terrain_tags[tile_id]
        end
      end
    end
    return 0
  end
end