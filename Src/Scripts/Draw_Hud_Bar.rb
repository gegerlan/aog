class Hud < Sprite
  alias bar_item_update update
  def update
    hud_refresh = $game_temp.hud_refresh
    bitmap.clear if hud_refresh
    bar_item_update
    if actor != nil
      if hud_refresh
        draw_bar_items(true) # Force a (re)draw
      else
        draw_bar_items
      end
    end
  end
end

module BlizzCFG 
  Z_ITEM_FILE = "hud_HP"
  Z_ITEM_FILE_EMPTY = "hud_HP_empty"

  # Bar start position
  ITEM_X = 0
  ITEM_Y = 0
  
  # Offset for each bar drawn
  ITEM_OFFSET_Y = 16 # sp.y - hp.y = 33-17 
  ITEM_OFFSET_X = 0  # vertical line
end
class Hud
  DEFAULT_CURRENT = 0
  DEFAULT_MAX     = 100
  
  alias bar_item_initialize initialize
  def initialize
    @bar_items = {} # draw is called in the normal initialize method, so we need to place this here.
    bar_item_initialize
  end
  def add_bar_item(item_name, &state_collector)
    @bar_items[item_name] = {
      :current => nil,
      :max     => nil,
      :name    => item_name,
      :x       => BlizzCFG::ITEM_X,
      :y       => BlizzCFG::ITEM_Y,
      :get     => state_collector
    }
  end
  def remove_bar_item(item_name)
    @bar_items.delete(item_name)
  end
  def draw_bar_items(force_draw = false)
    items_drawn = 2 # Initial offset since SP and HP is separate
    for item_name, saved_state in @bar_items
      item_state = saved_state[:get].call self
      if item_state[:current] != saved_state[:current] || 
          item_state[:max] != saved_state[:max] || force_draw == true ||
          item_state[:visible] != saved_state[:visible]

        if (not item_state[:visible]) && (saved_state[:visible] != item_state[:visible])
          # If we changed the bar to not be visible, force an update
          $game_temp.hud_refresh = true
        end
        saved_state[:current] = item_state[:current]
        saved_state[:max] = item_state[:max]
        saved_state[:visible] = item_state[:visible]
        
        if item_state[:visible]
          saved_state[:y] = BlizzCFG::ITEM_OFFSET_Y * items_drawn
          draw_bar_item(saved_state)
          items_drawn += 1
        end
      end
    end
  end
  def draw_bar_item(item_data)
    # Set the location to draw the item
    start_x = item_data[:x]
    start_y = item_data[:y]
    
    current = item_data[:current] || DEFAULT_CURRENT
    max     = item_data[:max]     || DEFAULT_MAX
    
    rate = (max > 0 ? current.to_f / max : 0)
    if item_data[:name] != nil
      filled_bar_image = "hud_#{item_data[:name]}"
      empty_bar_image = "hud_#{item_data[:name]}_empty"
    else
      filled_bar_image = BlizzCFG::Z_ITEM_FILE
      empty_bar_image  = BlizzCFG::Z_ITEM_FILE_EMPTY
    end
    b1 = RPG::Cache.picture(filled_bar_image)
    b2 = RPG::Cache.picture(empty_bar_image)
    if BlizzCFG::Z_HP_TILING # Not in use
      tiles = max / BlizzCFG::Z_HP_PER_TILE # TODO: Z_HP_PER_TILE
      rows = (tiles.to_f / BlizzCFG::Z_HP_TILE_COLUMNS).ceil # TODO: Z_HP_TILE_COLUMNS
      w, h = b1.width, b1.height
      self.bitmap.fill_rect(start_x, start_y, w * BlizzCFG::Z_HP_TILE_COLUMNS, # TODO: Z_HP_TILE_COLUMNS
          h * rows, Color.new(0, 0, 0, 0))
      full_tiles = (rate * tiles).to_i
      semi_full = ((rate * tiles != full_tiles) ? 1 : 0)
      (0...full_tiles).each {|i|
          x = start_x + (i % BlizzCFG::Z_HP_TILE_COLUMNS) * w # TODO: Z_HP_TILE_COLUMNS
          y = start_y + (i / BlizzCFG::Z_HP_TILE_COLUMNS) * h # TODO: Z_HP_TILE_COLUMNS
          self.bitmap.blt(x, y, b1, Rect.new(0, 0, w, h))}
      if semi_full > 0
        x = start_x + (full_tiles % BlizzCFG::Z_HP_TILE_COLUMNS) * w
        y = start_y + (full_tiles / BlizzCFG::Z_HP_TILE_COLUMNS) * h
        if BlizzCFG::Z_HP_FILL_UP
          h2 = ((1 - rate * tiles + full_tiles) * h).to_i
          self.bitmap.blt(x, y, b2, Rect.new(0, 0, w, h2))
          self.bitmap.blt(x, y + h2, b1, Rect.new(0, h2, w, h - h2))
        else
          w2 = ((rate * tiles - full_tiles) * w).to_i
          self.bitmap.blt(x, y, b1, Rect.new(0, 0, w2, h))
          self.bitmap.blt(x + w2, y, b2, Rect.new(w2, 0, w - w2, h))
        end
      end
      ((full_tiles + semi_full)...tiles).each {|i|
          x = start_x + (i % BlizzCFG::Z_HP_TILE_COLUMNS) * w # TODO: Z_HP_TILE_COLUMNS
          y = start_y + (i / BlizzCFG::Z_HP_TILE_COLUMNS) * h # TODO: Z_HP_TILE_COLUMNS
          self.bitmap.blt(x, y, b2, Rect.new(0, 0, w, h))}
    else
      w1 = (b1.width * rate).to_i
      w2 = b2.width - w1
      self.bitmap.fill_rect(start_x, start_y, b1.width, b1.height, Color.new(0, 0, 0, 0))
      self.bitmap.blt(start_x, start_y, b1, Rect.new(0, 0, w1, b1.height))
      self.bitmap.blt(start_x + w1, start_y, b2, Rect.new(w1, 0, w2, b2.height))
    end
  end
end