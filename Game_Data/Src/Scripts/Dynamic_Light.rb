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
      get_light_passage(event,3 )
      @old_event_pos[event] = [event.x, event.y]
    end
    
    @alpha_layer = Sprite.new(@light)
    @alpha_layer.bitmap = Bitmap.new(640, 480)
    @alpha_layer.bitmap.fill_rect(0, 0, 640, 480, Color.new(255, 255, 255))
    @alpha_layer.blend_type = 2
    @alpha_layer.opacity = 100
    
    @exposed_tile.each do |position, transparent|
      x, y = position
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
      draw_tile(@alpha_layer.bitmap, x, y, tile_map)
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
    
    @tile_alpha[source_position] = 255
    
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
  def draw_tile(canvas, x, y, reference_tiles)
    tl, tc, tr, cl, cc, cr, bl, bc, br = reference_tiles
    
    #Create easier handles for top (t), right (r), bottom (b) and left (l)
    t, r, b, l = tc, cr, bc, cl
    
    map = [
      [ #First (top) row
        (t & l) | (t & r & tl) | (l & t & r),
        (t & l) | (t & r) | (l & t & r) | (b & t),
        (t & l) | (t & r) | (l & t & r) | (b & t),
        (t & l & tr) | (t & r) | (l & t & r)
      ],
      [ #Second row
        (t & l) | (b & l) | (l & t & r) | (l & r),
        (t & l) | (t & r) | (l & t & r) | (l & r) | (b & t),
        (t & l) | (t & r) | (l & t & r) | (l & r) | (b & t),
        (b & r) | (t & r) | (l & t & r) | (l & r)
      ],
      [ #Third row
        (t & l) | (b & l) | (l & r),
        (t & l) | (b & l) | (l & r) | (b & t),
        (b & r) | (t & r) | (l & r) | (b & t),
        (b & r) | (t & r) | (l & r)
      ],
      [ #Forth (bottom) row
        (t & l & bl) | (b & l),
        (b & r) | (b & l) | (b & t),
        (b & r) | (b & l) | (b & t),
        (b & r) | (t & r & br)
      ]
    ]

    step = 32/4
    
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
end