class Window_Perversion < Window_Selectable
  def initialize(actor)
    super(0, 64, 640, 416)
    @actor = actor
    refresh
    self.active = false
    self.index = -1
  end
  #--------------------------------------------------------------------------
  # * Item Acquisition
  #--------------------------------------------------------------------------
  def item
    return @data[self.index]
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    @actor.perversion.each do |k, deltas|
      unique_id, event_id, map_id = k
      deltas.each do |delta|
        @data << [unique_id, event_id, map_id, delta]
      end
    end

    # Add blank page
    @data.push(nil)
    # Make a bit map and draw all items
    @item_max = @data.size
    
    self.contents = Bitmap.new(width - 32, row_max * 32)
    for i in 0...@item_max-1
      draw_item(i)
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #     index : item number
  #--------------------------------------------------------------------------
  def draw_item(index)
    unique_id, event_id, map_id, delta = @data[index]
    
    x = 4
    y = index * 32
    
    self.contents.font.color = normal_color
    
    self.contents.draw_text(x, y, 32, 32, "#{delta}", 2)
    self.contents.draw_text(x + 42, y, 238, 32, sprintf("%s (Map%03d)", map_name(map_id), map_id), 0)
    self.contents.draw_text(x + 290, y, 238, 32, sprintf("%s (Ev%03d)", event_name(map_id, event_id), event_id), 0)
    self.contents.draw_text(x + 568, y, 32, 32, "#{unique_id}", 2)
    
  end
  
  def map_name(map_id)
    @@map_name_cache ||= []
    if @@map_name_cache.empty?
      i = load_data("Data/MapInfos.rxdata")
      i.each do |k, v|
        @@map_name_cache[k] = v.name
      end
    end
    return @@map_name_cache[map_id]
  end
  def event_name(map_id, event_id)
    @@event_name_cache ||= []
    if @@event_name_cache[map_id] == nil
      @@event_name_cache[map_id] = []
      if(map_id == $game_map.map_id)
        @map = $game_map
      else
        @map = load_data(sprintf("Data/Map%03d.rxdata", map_id))
      end
      @map.events.each do |k, v|
        @@event_name_cache[map_id][k] = v.name
      end
    end
    return @@event_name_cache[map_id][event_id]
  end
end
class Window_PerversityStatus < Window_Base
  def initialize(actor)
    super(0, 0, 640, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    @actor = actor
    refresh
  end
  def refresh
    self.contents.clear
    draw_actor_name(@actor, 4, 0)
    self.contents.draw_text(130, 0, 120, 32, @actor.sum_perversion.to_s, 2)
    draw_actor_sp(@actor, 260, 0)
  end
end