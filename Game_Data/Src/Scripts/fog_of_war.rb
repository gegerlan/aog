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
    @alpha_layer.blend_type = 0
    @alpha_layer.opacity = 255

    @exposed_tile.each do |position, transparent|
      x, y = position
      if !transparent
        draw(@alpha_layer.bitmap, [[transparent]], 32, x*32, y*32)
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
        for col_index in 0..draw_map[row_index].length - 1
          alpha = alpha_center

          alpha_values = [
            #(alpha_top/2).to_f * ((draw_map.length - row_index) / draw_map.length),
            #(alpha_left/2).to_f * ((draw_map[row_index].length - col_index).to_f / draw_map.length),
            #(alpha_right/2).to_f * (row_index / draw_map.length).to_f,
            #(alpha_bottom/2).to_f * (col_index / draw_map[row_index].length)
          ]
          len  = (draw_map[row_index].length - 1) / 2
=begin
          if col_index <= len
            diff = alpha_left - alpha_center
            diff = diff.to_f / 2 if alpha_left != 0 && alpha_left != 255
            alpha_values << ((len - col_index) * (diff.to_f / len))
          elsif col_index >= len
            diff = alpha_center - alpha_right
            diff = diff.to_f / 2 if alpha_right != 0 && alpha_right != 255
            alpha_values << ((len - col_index) * (diff.to_f / len))
          end
=end
          #len  = (draw_map.length - 1) / 2
          if row_index <= len
            diff = alpha_top - alpha_center
            diff = diff.to_f / 2 if alpha_top != 0 && alpha_top != 255
            alpha_values << 100 #((len - row_index) * (diff.to_f / len))
            #alpha_values << alpha_center
          elsif row_index >= len
            diff = alpha_center - alpha_bottom
            diff = diff.to_f / 2 if alpha_bottom != 0 && alpha_bottom != 255
            #alpha_values << ((len - row_index) * (diff.to_f / len))
            #alpha_values << alpha_center
            alpha_values << 0
          end

          alpha = alpha_values.sum#alpha_center + (alpha_values.sum / alpha_values.length)
          draw_map[row_index][col_index] = Color.new(alpha, alpha, alpha)
        end
      end
      draw(@alpha_layer.bitmap, draw_map, 32, x*32, y*32, 255)
      
    end
    
=begin
    @exposed_tile.each do |position, transparent|
      x, y = position
      if !transparent
        draw(@alpha_layer.bitmap, [[transparent]], 32, x*32, y*32)
        next
      end
      tile_map = []
      [
        [ 0, -1],
        [ 1,  0],
        [ 0,  1],
        [-1,  0],
      ].each do |delta| 
        dx, dy = delta
        tile_map << (@exposed_tile[[x+dx, y+dy]])
      end
      clear_top, clear_right, clear_bottom, clear_left = tile_map
      
      #visible = clear_top & clear_right & clear_bottom & clear_left
      t = true
      f = false

      #if clear_left & clear_bottom
      draw_map = [
         [clear_left | clear_top, clear_top | clear_right],
         [clear_left | clear_bottom, clear_bottom | clear_right]
      ]
      old_draw_map = [
         [clear_left | clear_top, clear_top | clear_right],
         [clear_left | clear_bottom, clear_bottom | clear_right]
      ]
      for py in 0..draw_map.length - 1
        for px in 0..draw_map[py].length - 1
          #draw_map[py][px] = old_draw_map if draw_map[py][px] == true
          #draw_map[py][px] = true
        end
      end
      draw(@alpha_layer.bitmap, draw_map, 32, x*32, y*32,255- @tile_alpha[[x,y]].to_f/4*255)
    end
=end
=begin
    @exposed_tile.each do |position, transparent|
      x, y = position
      alpha = (@tile_alpha[[x,y]].to_f / 3) * 255
      if !transparent
        draw_tile_on(@alpha_layer.bitmap, x, y, transparent ? @black : @white)
        next
      end
      tile_map = []
      [
        [-1, -1],
        [ 0, -1],
        [ 1, -1],
        [-1,  0],
        [ 0,  0],
        [ 1,  0],
        [-1,  1],
        [ 0,  1],
        [ 1,  1],
      ].each do |delta| 
        dx, dy = delta
        tile_map << (@exposed_tile[[x+dx, y+dy]])
      end
      map = draw_tile(tile_map)
      draw(@alpha_layer.bitmap, map, 32, x*32, y*32)
    end
=end
    
    
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
              visibility_value = $game_map.passable?(x, y, 0)
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
  #def draw_tile(canvas, x, y, reference_tiles)
  def draw_tile(reference_tiles)
    #tl, tc, tr, cl, cc, cr, bl, bc, br = reference_tiles
    
    #Create easier handles for top (t), right (r), bottom (b) and left (l)
    #t, r, b, l = tc, cr, bc, cl
    
    map = [
      [
        l | t, t | r
      ],
      [
        l | b, b | r
      ],
    ]
=begin
   
    map = [
      [ #First (top) row
        (t & l) | (t & r & tl) | (l & t & r) | (b & l & tl),
        (t & l) | (l & t & b) | (t & r) | (l & t & r) | (b & t),
        (t & l) | (t & r) | (l & t & r) | (b & t),
        (t & l & tr) | (b & r & tr) | (t & r) | (l & t & r)
      ],
      [ #Second row
        (t & l) | (b & l) | (l & t & r) | (l & r),
        (t & l) | (t & r) | (l & t & r) | (l & r) | (b & t) | (b & l),
        (t & l) | (t & r) | (l & t & r) | (l & r) | (b & t) | (b & r),
        (b & r) | (t & r) | (l & t & r) | (l & r)
      ],
      [ #Third row
        (t & l) | (b & l) | (l & r),
        (t & l) | (b & l) | (l & r) | (b & t) | (b & r),
        (b & r) | (t & r) | (l & r) | (b & t) | (b & l),
        (b & r) | (t & r) | (l & r)
      ],
      [ #Forth (bottom) row
        (t & l & bl) | (b & l) | (b & r & bl),
        (b & r) | (b & l) | (b & t),
        (b & r) | (b & l) | (b & t),
        (b & r) | (t & r & br) | (b & l & br)
      ]
    ]
=end
    return map
=begin
    new_map = []
    new_row = []
    for row_index in 0..map.length - 1
      row = map[row_index]
      for column_index in 0..row.length - 1
        column = row[column_index]
        if !column
          new_row[column_index] = column
          next
        end
        t = row_index == 0 ? false : !!map[row_index-1][column_index]
        r = column_index == row.length - 1 ? false : !!map[row_index][column_index + 1]
        b = row_index == map.length - 1 ? false : !!map[row_index+1][column_index]
        l = column_index == 0 ? false : !!map[row_index][column_index - 1]
        
        if (t & r & b & l) | (r & l & (t | b)) | (t & b & (l | r))
          new_row[column_index] = column
          next
        end
        
        f = false
        
        new_row[column_index] = [
          [ #First (top) row
            f,
            f,
            f,
            f
          ],
          [ #Second row
            f,
            true,
            true,
            f
          ],
          [ #Third row
            f,
            true,
            true,
            f
          ],
          [ #Forth (bottom) row
            f,
            f,
            f,
            f
          ]
        ]
      end
      new_map[row_index] = new_row
    end
    map = new_map
=end
##
 
    
    
    
#    step = 32/4
=begin    
    cursor = Rect.new(x*32, y*32, step, step)
    for map_y in 0..map.length - 1
      for map_x in 0..map[map_y].length - 1
        cursor.x = x*32 + (step * map_x)
        cursor.y = y*32 + (step * map_y)
        column = map[map_y][map_x]
        canvas.fill_rect(cursor, (column && @black) || @white)
      end
    end  
  end
=end
    #draw(canvas, map, 32, x*32, y*32)
  end
  def draw(canvas, map, width = 32, offset_x = 0, offset_y = 0, alpha=255)
    step = width / map.length
    map.each_with_index do |row, row_index|
      row.each_with_index do |column, col_index|
        x_pos = offset_x + col_index * step
        y_pos = offset_y + row_index * step
        if column.is_a?(Array)
          draw(canvas, column, step, x_pos, y_pos, alpha)
        else
#          if column == nil
#            column = false 
#          end
          if !column.is_a?(Color)
            column = (column && @black || @white) 
          end

          color = column
          #color= Color.new(alpha, alpha, alpha)
          #color.alpha = alpha
          canvas.fill_rect(x_pos, y_pos, step, step, color) 
        end
      end
    end
  end
end