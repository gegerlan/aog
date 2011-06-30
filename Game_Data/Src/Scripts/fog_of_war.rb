class Spriteset_Map
  alias dynamic_light_old_initialize initialize
  def initialize
    @exposed_tile = Hash.new(false)
    @tile_alpha = Hash.new(0)
    @old_event_pos = {}
    
    @white = Color.new(255, 255, 255)
    @black = Color.new(0, 0, 0, 255)
    
    @light = Viewport.new(0, 0, 640, 480)
    @light.z = 200

    
    $game_map.events.each do |idx, event|
      get_light_passage(event, 4)
      @old_event_pos[event] = [event.x, event.y]
    end
    
    @alpha_layer = Sprite.new(@light)
    @alpha_layer.bitmap = Bitmap.new(640, 480)
    @alpha_layer.bitmap.fill_rect(0, 0, 640, 480, Color.new(255, 255, 255))
    @alpha_layer.blend_type = 2
    @alpha_layer.opacity = 255

    @exposed_tile.each do |position, transparent|
      x, y = position
      if !transparent
        draw(@alpha_layer.bitmap, [[@white]], 32, 32, x*32, y*32)
        next
      end

      tile_map = []
      alpha_map = []
      [
        [ 0, -1],
        [ 1,  0],
        [ 0,  1],
        [-1,  0],
      ].each do |delta| 
        dx, dy = delta
        tile_map << @exposed_tile[[x+dx, y+dy]]
        alpha_map << (255-((@tile_alpha[[x+dx, y+dy]].to_f/ 4) * 255))
      end
      clear_top, clear_right, clear_bottom, clear_left  = tile_map
      alpha_top, alpha_right, alpha_bottom, alpha_left  = alpha_map
      
      alpha_center = (255-((@tile_alpha[[x,y]].to_f/4)*255))
      
      
      draw_map = Array.new(32, Array.new(32, false))
      for row_index in 0..draw_map.length - 1
        col = []
        for col_index in 0..draw_map[row_index].length - 1
          alpha = alpha_center

          alpha_values = []
          len  = (draw_map[row_index].length - 1) / 2

          if col_index <= len
            diff = alpha_left - alpha_center
            diff = diff.to_f / 2 if alpha_left != 0 && alpha_left != 255
            alpha_values << ((len - col_index) * (diff.to_f / len))
          elsif col_index >= len
            diff = alpha_center - alpha_right
            diff = diff.to_f / 2 if alpha_right != 0 && alpha_right != 255
            alpha_values << ((len - col_index) * (diff.to_f / len))
          end

          len  = (draw_map.length - 1) / 2

          if row_index <= len
            diff = alpha_top - alpha_center
            diff = diff.to_f / 2 if alpha_top != 0 && alpha_top != 255
            alpha_values << ((len - row_index) * (diff.to_f / len))
            #alpha_values << alpha_center
          elsif row_index >= len
            diff = alpha_bottom - alpha_center
            diff = diff.to_f / 2 if alpha_bottom != 0 && alpha_bottom != 255
            alpha_values << ((row_index - len) * (diff.to_f / len))
            #alpha_values << alpha_center
          end

          alpha = alpha_center + (alpha_values.sum / alpha_values.length)
          #alpha = row_index
          col[col_index] = Color.new(alpha, alpha, alpha)

        end
        draw_map[row_index] = col

      end

#      raise draw_map.to_s

      #draw_map[16][16] = Color.new(255,0,0)


      draw(@alpha_layer.bitmap, draw_map, 32, 32, x*32, y*32, 255)
    end
    dynamic_light_old_initialize
  end

  
  alias dynamic_light_old_update update
  def update
    @light.update
    dynamic_light_old_update
  end
  def get_light_passage(event, radious)
    w = $game_map.width
    h = $game_map.height
    r = radious
    
    center_x = event.x
    center_y = event.y
    
    #Direction of the light flow
    dir = [
      [[ 0, -1], [ 1, -1], [ 1,  0]], # UP
      [[ 1,  0], [ 1,  1], [ 0,  1]], # RIGHT
      [[ 0,  1], [-1,  1], [-1,  0]], # DOWN
      [[-1,  0], [-1, -1], [ 0, -1]]  # LEFT
    ]
    
    source_position = [center_x, center_y]
    source_value = $game_map.passable?(center_x, center_y, 0)
    
    @exposed_tile[source_position] |= source_value
    
    @tile_alpha[source_position] = r
    
    old_list = [source_position]
    old_value = [source_value]
    for d in 0..r-1
      new_list = []
      new_value = []
      section_size = old_list.length / 4
      dir.each_with_index do |side, idx|
        start_pos = section_size * idx
        for c_pos in start_pos..start_pos + section_size
          next if c_pos.to_i >= old_list.length
          cx, cy = old_list[c_pos.to_i]
          source_tile_passage = old_value[c_pos.to_i]
          side.each do |s|
            dx, dy = s
            x = cx + dx
            y = cy + dy
            next if (x - center_x)**2 + (y - center_y)**2 > r**2
            if not new_list.include?([x, y]) and not old_list.include?([x, y]) #expensive!
              #visibility_value = $game_map.passable?(x, y, 0)
              #visibility_value &= source_tile_passage
              visibility_value = $game_map.passable?(cx, cy, 0)
              visibility_value &= source_tile_passage
              @exposed_tile[[x,y]] |= visibility_value
              new_list.push([x, y])
              
              @tile_alpha[[x,y]] += (r - 1) - d
              
              new_value.push(visibility_value)
            end
          end
        end
      end
      old_list = new_list
      old_value = new_value
    end
  end
  def draw_tile_on(canvas, x, y, color)
    canvas.fill_rect(x*32, y*32, 32, 32, color)
  end

  def draw(canvas, map, width = 32, height = 32, offset_x = 0, offset_y = 0, alpha=255)
    step_y = height / map.length
    map.each_with_index do |row, row_index|
      step_x = width / row.length
      row.each_with_index do |column, col_index|
        x_pos = offset_x + (col_index * step_x)
        y_pos = offset_y + (row_index * step_y)
        if column.is_a?(Array)
          draw(canvas, column, step_x, step_y, x_pos, y_pos, alpha)
        else
          #if column.is_a?(Float) or column.is_a?(Fixnum)
          #  color = Color.new(column, column, column)
          #end
          #if !column.is_a?(Color)
          #  column = (column && @black || @white) 
          #end
          
          color = column
          canvas.fill_rect(x_pos, y_pos, step_x, step_y, color) 
        end
      end
    end
  end
end