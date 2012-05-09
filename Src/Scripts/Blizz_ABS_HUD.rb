#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Z-HUD for Blizz-ABS by Blizzard
# Version: 1.02b
# Type: Blizz-ABS Add-on
# Date: 29.7.2009
# Date v1.0b: 30.7.2009
# Date v1.01b: 17.12.2009
# Date v1.02b: 23.2.2010
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#  This script is to be distributed under the same terms and conditions like
#  the script it was created for: Blizz-ABS.
# 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Information:
# 
#   This script must be placed below Blizz-ABS and requires Blizz-ABS v2.7 or
#   higher to work properly. It will add a completely new HUD system for
#   Blizz-ABS.
#   
# Notes:
#   
#   Images are placed in the Graphics/Pictures folder. Be sure to set up the
#   HUD height properly. Usually it is enough if it is the sum of the heights
#   of the HP and the SP image. If you use tiling, you need to calculate the
#   maximum possible height the HUD can be and then use that value. It is not
#   recommended to use extremely high values as your HUD will cover too much of
#   the screen and increase lag.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

if !$BlizzABS || BlizzABS::VERSION < 2.7
  raise 'ERROR: The "Z-HUD" requires Blizz-ABS 2.7 or higher.'
end

#==============================================================================
# module BlizzCFG
#==============================================================================

module BlizzCFG

#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# START Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
  # maximum height of the HUD
  Z_HUD_HEIGHT = 96
  
  # tiling HP images
  Z_HP_TILING = false
  # displays as if the images are filled up (only when tiling)
  Z_HP_FILL_UP = true
  # how many columns are used for the tile in one row (only when tiling)
  Z_HP_TILE_COLUMNS = 10
  # how many HP per column (only when tiling)
  Z_HP_PER_TILE = 100
  # full image file
  Z_HP_FILE = 'hud_HP'
  # empty image file
  Z_HP_FILE_EMPTY = 'hud_HP_empty'
  
  # tiling SP images
  Z_SP_TILING = false
  # displays as if the images are filled up (only when tiling)
  Z_SP_FILL_UP = false
  # how many columns are used for the tile in one row (only when tiling)
  Z_SP_TILE_COLUMNS = 10
  # how many SP per column (only when tiling)
  Z_SP_PER_TILE = 10
  # full image file
  Z_SP_FILE = 'hud_SP'
  # empty image file
  Z_SP_FILE_EMPTY = 'hud_SP_empty'
  
  # item hotkey background
  Z_ITEM_BACK = 'item'
  # skill hotkey background
  Z_SKILL_BACK = 'skill'
  
  # hotkeys display background
  Z_HOTKEYS_BACK = 'hotkey'
  
  # minimap background
  Z_MINIMAP_BACK = 'minimap'
  
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# END Configuration
#::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
  $blizzabs_z_hud = 1.02
  
end

#==============================================================================
# Hud
#==============================================================================

class Hud
  
  attr_reader :hotkey_sprite
  
  alias init_zhud_later initialize
  def initialize(viewport = nil)
    init_hotkey_sprite(viewport)
    init_zhud_later(viewport)
    self.x, self.y = 4, 4
    @hotkey_sprite.z = self.z
  end
  
  alias create_positions_zhud_later create_positions
  def create_positions
    create_positions_zhud_later
    b1 = RPG::Cache.picture(BlizzCFG::Z_HP_FILE)
    b2 = RPG::Cache.picture(BlizzCFG::Z_SP_FILE)
    if BlizzCFG::Z_HP_TILING
      w = b1.width * BlizzCFG::Z_HP_TILE_COLUMNS
    else
      w = b1.width
    end
    @hud_width = w if @hud_width < w
    if BlizzCFG::Z_SP_TILING
      w = b2.width * BlizzCFG::Z_SP_TILE_COLUMNS
    else
      w = b2.width
    end
    @hud_width = w if @hud_width < w
    @hud_height = BlizzCFG::Z_HUD_HEIGHT
    @hp_x, @hp_y, @sp_x, @sp_y = 0, 0, 0, b1.height + 4
    update_sp_y
    b = RPG::Cache.picture(BlizzCFG::Z_ITEM_BACK)
    @left_x = b.width
    @left_y = b.height
    @hot_x = b.width
  end
  
  def draw_basic
  end
  
  def draw_empty
  end
  
  def draw_name
  end
  
  def draw_level
  end
  
  def draw_hp
    @hp, @maxhp = actor.hp, actor.maxhp
    rate = (@maxhp > 0 ? @hp.to_f / @maxhp : 0)
    b1 = RPG::Cache.picture(BlizzCFG::Z_HP_FILE)
    b2 = RPG::Cache.picture(BlizzCFG::Z_HP_FILE_EMPTY)
    if BlizzCFG::Z_HP_TILING
      tiles = @maxhp / BlizzCFG::Z_HP_PER_TILE
      rows = (tiles.to_f / BlizzCFG::Z_HP_TILE_COLUMNS).ceil
      w, h = b1.width, b1.height
      self.bitmap.fill_rect(@hp_x, @hp_y, w * BlizzCFG::Z_HP_TILE_COLUMNS,
          h * rows, Color.new(0, 0, 0, 0))
      full_tiles = (rate * tiles).to_i
      semi_full = ((rate * tiles != full_tiles) ? 1 : 0)
      (0...full_tiles).each {|i|
          x = @hp_x + (i % BlizzCFG::Z_HP_TILE_COLUMNS) * w
          y = @hp_y + (i / BlizzCFG::Z_HP_TILE_COLUMNS) * h
          self.bitmap.blt(x, y, b1, Rect.new(0, 0, w, h))}
      if semi_full > 0
        x = @hp_x + (full_tiles % BlizzCFG::Z_HP_TILE_COLUMNS) * w
        y = @hp_y + (full_tiles / BlizzCFG::Z_HP_TILE_COLUMNS) * h
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
          x = @hp_x + (i % BlizzCFG::Z_HP_TILE_COLUMNS) * w
          y = @hp_y + (i / BlizzCFG::Z_HP_TILE_COLUMNS) * h
          self.bitmap.blt(x, y, b2, Rect.new(0, 0, w, h))}
    else
      w1 = (b1.width * rate).to_i
      w2 = b2.width - w1
      self.bitmap.fill_rect(@hp_x, @hp_y, b1.width, b1.height, Color.new(0, 0, 0, 0))
      self.bitmap.blt(@hp_x, @hp_y, b1, Rect.new(0, 0, w1, b1.height))
      self.bitmap.blt(@hp_x + w1, @hp_y, b2, Rect.new(w1, 0, w2, b2.height))
    end
    #draw_sp
  end
  
  def draw_sp
    @sp, @maxsp = actor.sp, actor.maxsp
    rate = (@maxsp > 0 ? @sp.to_f / @maxsp : 0)
    b1 = RPG::Cache.picture(BlizzCFG::Z_SP_FILE)
    b2 = RPG::Cache.picture(BlizzCFG::Z_SP_FILE_EMPTY)
    if BlizzCFG::Z_SP_TILING
      tiles = @maxsp / BlizzCFG::Z_SP_PER_TILE
      rows = (tiles.to_f / BlizzCFG::Z_SP_TILE_COLUMNS).ceil
      w, h = b1.width, b1.height
      self.bitmap.fill_rect(@sp_x, @sp_y, w * BlizzCFG::Z_SP_TILE_COLUMNS,
          h * rows, Color.new(0, 0, 0, 0))
      full_tiles = (rate * tiles).to_i
      semi_full = ((rate * tiles != full_tiles) ? 1 : 0)
      (0...full_tiles).each {|i|
          x = @sp_x + (i % BlizzCFG::Z_SP_TILE_COLUMNS) * w
          y = @sp_y + (i / BlizzCFG::Z_SP_TILE_COLUMNS) * h
          self.bitmap.blt(x, y, b1, Rect.new(0, 0, w, h))}
      if semi_full > 0
        x = @sp_x + (full_tiles % BlizzCFG::Z_SP_TILE_COLUMNS) * w
        y = @sp_y + (full_tiles / BlizzCFG::Z_SP_TILE_COLUMNS) * h
        if BlizzCFG::Z_SP_FILL_UP
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
          x = @sp_x + (i % BlizzCFG::Z_SP_TILE_COLUMNS) * w
          y = @sp_y + (i / BlizzCFG::Z_SP_TILE_COLUMNS) * h
          self.bitmap.blt(x, y, b2, Rect.new(0, 0, w, h))}
    else
      w1 = (b1.width * rate).to_i
      w2 = b2.width - w1
      self.bitmap.fill_rect(@sp_x, @sp_y, b1.width, b1.height, Color.new(0, 0, 0, 0))
      self.bitmap.blt(@sp_x, @sp_y, b1, Rect.new(0, 0, w1, b1.height))
      self.bitmap.blt(@sp_x + w1, @sp_y, b2, Rect.new(w1, 0, w2, b2.height))
    end
  end
  
  def draw_hskill
    @skill = actor.skill
    b1 = RPG::Cache.picture(BlizzCFG::Z_SKILL_BACK)
    @hotkey_sprite.bitmap.fill_rect(0, 0, b1.width, b1.height, Color.new(0, 0, 0, 0))
    @hotkey_sprite.bitmap.blt(0, 0, b1, Rect.new(0, 0, b1.width, b1.height))
    if @skill != 0
      bitmap = RPG::Cache.icon($data_skills[@skill].icon_name)
      x, y = (b1.width - 24) / 2, (b1.height - 24) / 2
      @hotkey_sprite.bitmap.blt(x, y, bitmap, Rect.new(0, 0, 24, 24))
    end
    draw_lskill
  end
  
  def draw_lskill
    @hotkey_sprite.bitmap.fill_rect(0, @left_y + 4, @left_x, 16, Color.new(0, 0, 0, 0))
    @skills_left = get_skills_left
    if @skill != nil && @skill > 0
      if @skills_left >= 0
        if @skills_left == 0
          @hotkey_sprite.bitmap.font.color = Color.new(255, 0, 0)
        elsif @skills_left <= 5
          @hotkey_sprite.bitmap.font.color = Color.new(255, 255, 0)
        else
          @hotkey_sprite.bitmap.font.color = normal_color
        end
        @hotkey_sprite.bitmap.font.size -= 2
        @hotkey_sprite.bitmap.draw_text_full(0, @left_y, @left_x, 20, @skills_left.to_s, 1)
        @hotkey_sprite.bitmap.font.size += 2
      elsif @skills_left == -1
        @hotkey_sprite.bitmap.font.color = Color.new(0, 255, 0)
        @hotkey_sprite.bitmap.font.size += 4
        @hotkey_sprite.bitmap.draw_text_full(0, @left_y, @left_x, 20, '∞', 1)
        @hotkey_sprite.bitmap.font.size -= 4
      end
    end
  end
  
  def draw_hitem
    @item = actor.item
    b1 = RPG::Cache.picture(BlizzCFG::Z_SKILL_BACK)
    b2 = RPG::Cache.picture(BlizzCFG::Z_ITEM_BACK)
    x = b1.width + 4
    @hotkey_sprite.bitmap.fill_rect(x, 0, b2.width, b2.height, Color.new(0, 0, 0, 0))
    @hotkey_sprite.bitmap.blt(x, 0, b2, Rect.new(0, 0, b2.width, b2.height))
    if @item != 0
      bitmap = RPG::Cache.icon($data_items[@item].icon_name)
      x, y = b1.width + 4 + (b2.width - 24) / 2, (b2.height - 24) / 2
      @hotkey_sprite.bitmap.blt(x, y, bitmap, Rect.new(0, 0, 24, 24))
    end
    draw_litem
  end
  
  def draw_litem
    @items_left = $game_party.item_number(@item)
    @hotkey_sprite.bitmap.fill_rect(@left_x + 4, @left_y + 4, @left_x, 16, Color.new(0, 0, 0, 0))
    if @item != nil && @item > 0
      if $data_items[@item] != nil && !$data_items[@item].consumable
        @hotkey_sprite.bitmap.font.color = Color.new(0, 255, 0)
        @hotkey_sprite.bitmap.font.size += 4
        @hotkey_sprite.bitmap.draw_text_full(@left_x + 4, @left_y, @left_x, 20, '∞', 1)
        @hotkey_sprite.bitmap.font.size -= 4
      else
        if @items_left == 0
          @hotkey_sprite.bitmap.font.color = Color.new(255, 0, 0)
        elsif @items_left <= 10
          @hotkey_sprite.bitmap.font.color = Color.new(255, 255, 0)
        else
          @hotkey_sprite.bitmap.font.color = normal_color
        end
        @hotkey_sprite.bitmap.font.size -= 2
        @hotkey_sprite.bitmap.draw_text_full(@left_x + 4, @left_y, @left_x, 20, @items_left.to_s, 1)
        @hotkey_sprite.bitmap.font.size += 2
      end
    end
  end
  
  alias update_zhud_later update
  def update
    update_sp_y if actor != nil
    update_zhud_later
  end
  
  def update_sp_y
    return if !BlizzCFG::Z_HP_TILING
    b1 = RPG::Cache.picture(BlizzCFG::Z_HP_FILE)
    tiles = actor.maxhp / BlizzCFG::Z_HP_PER_TILE
    @sp_y = (tiles.to_f / BlizzCFG::Z_HP_TILE_COLUMNS).ceil * b1.height
  end
  
  alias dispose_zhud_later dispose
  def dispose
    @hotkey_sprite.dispose if @hotkey_sprite != nil
    @hotkey_sprite = nil
    dispose_zhud_later
  end
  
  def init_hotkey_sprite(viewport)
    b1 = RPG::Cache.picture(BlizzCFG::Z_ITEM_BACK)
    b2 = RPG::Cache.picture(BlizzCFG::Z_SKILL_BACK)
    width = b1.width + b2.width
    @hotkey_sprite = Sprite.new(viewport)
    @hotkey_sprite.x = 632 - width
    @hotkey_sprite.y = 4
    @hotkey_sprite.bitmap = Bitmap.new(width + 4, b1.height + 24)
    @hotkey_sprite.bitmap.font.name = 'Arial'
    @hotkey_sprite.bitmap.font.size = 16
    @hotkey_sprite.bitmap.font.bold = true
  end
    
end

#==============================================================================
# Hotkey_Assignment
#==============================================================================

class Hotkey_Assignment
  
  def initialize(viewport = nil)
    super
    self.bitmap = Bitmap.new(32, 320)
    self.bitmap.font.bold = true
    self.bitmap.font.size -= 8
    self.bitmap.font.color = system_color
    self.x, self.y, self.z = 0, 160, 1100
    @skills = BlizzABS::Cache::EmptyKeys
    @items = BlizzABS::Cache::EmptyKeys
    update
  end
  
  def draw(index = nil)
    back = RPG::Cache.picture(BlizzCFG::Z_HOTKEYS_BACK)
    w, h = back.width, back.height
    ow, oh = (w - 24) / 2, (h - 24) / 2
    (index == nil ? BlizzABS::Cache::HotkeyRange : [index]).each {|i|
        if $game_player.skill_hotkeys[i%10] != 0
          object = $data_skills[$game_player.skill_hotkeys[i%10]]
        elsif $game_player.item_hotkeys[i%10] != 0
          object = $data_items[$game_player.item_hotkeys[i%10]]
        end
        if @items[i%10] != $game_player.item_hotkeys[i%10] ||
            @skills[i%10] != $game_player.skill_hotkeys[i%10]
          self.bitmap.fill_rect(0, h*(i-1), w, h, Color.new(0, 0, 0, 0))
          self.bitmap.blt(0, h*(i-1), back, Rect.new(0, 0, w, h))
          if object != nil
            bitmap = RPG::Cache.icon(object.icon_name)
            self.bitmap.blt(ow, h*(i-1)+oh, bitmap, Rect.new(0, 0, 24, 24))
          end
          self.bitmap.draw_text_full(0, h*(i-1)+10, w-2, 32, (i%10).to_s, 2)
        end}
    @items = $game_player.item_hotkeys.clone
    @skills = $game_player.skill_hotkeys.clone
  end
  
end

#==============================================================================
# Scene_Map
#==============================================================================

class Scene_Map
  
  alias update_zhud_later update
  def update
    update_zhud_later
    if @minimap != nil && $game_system.minimap == 1
      if @minimap_back == nil
        @minimap_back = Sprite.new
        @minimap_back.bitmap = RPG::Cache.picture(BlizzCFG::Z_MINIMAP_BACK)
        w = (@minimap_back.bitmap.width - @minimap.vw) / 2
        @minimap_back.x = @minimap.vx - w
        h = (@minimap_back.bitmap.height - @minimap.vh) / 2
        @minimap_back.y = @minimap.vy - h
      end
    elsif @minimap_back != nil
      @minimap_back.dispose
      @minimap_back = nil
    end
  end
  
  alias hud_update_zhud_later hud_update
  def hud_update
    hud_update_zhud_later
    if @hud != nil
      s = @hud.hotkey_sprite
      s.update
      if $game_player.screen_x < s.vx + s.vw + 16 &&
          $game_player.screen_y < s.vy + s.vh + 48 &&
          $game_player.screen_x > s.vx && $game_player.screen_y > s.vy
        s.opacity -= 25 if s.opacity > 80
      elsif s.opacity <= 255
        s.opacity += 25
      end
    end
    if @minimap_back != nil
      s = @minimap_back
      s.update
      if $game_player.screen_x < s.vx + s.vw + 16 &&
          $game_player.screen_y < s.vy + s.vh + 48 &&
          $game_player.screen_x > s.vx && $game_player.screen_y > s.vy
        s.opacity -= 25 if s.opacity > 80
      elsif s.opacity <= 255
        s.opacity += 25
      end
    end
  end
  
end

#==============================================================================
# Window_Skill_Hotkey
#==============================================================================

class Window_Skill_Hotkey < Window_Skill
  
  def initialize(actor)
    super
    @column_max = 1
    self.width, self.height = 288, 480
    self.x, self.y, self.z = 64, 64, 21000
    self.cursor_rect.empty
    self.active = false
    refresh
  end
  
  def draw_item(i)
    if @data[i] == nil
      self.contents.font.color = normal_color
      self.contents.draw_text(32, i*32, 204, 32, '<Remove>')
    else
      if @actor.skill_can_use?(@data[i].id)
        self.contents.font.color = normal_color
      else
        self.contents.font.color = disabled_color
      end
      self.contents.fill_rect(Rect.new(4, i*32, 256, 32), Color.new(0, 0, 0, 0))
      bitmap = RPG::Cache.icon(@data[i].icon_name)
      opacity = self.contents.font.color == normal_color ? 255 : 128
      self.contents.blt(4, 4+i*32, bitmap, Rect.new(0, 0, 24, 24), opacity)
      text = @data[i].name
      if @actor.skills.include?(@data[i].id) &&
          $tons_version != nil && $tons_version >= 3.7 &&
          TONS_OF_ADDONS::EQUAP_SKILLS && DISPLAY_AP_REQ
        aps = BlizzCFG.maxap(@data[i].id)
        text = "#{text} (#{@actor.ap(@data[i].id)}/#{aps})" if aps != 0
      end
      self.contents.draw_text(32, i*32, 204, 32, text)
      sp_cost = @data[i].sp_cost
      if $tons_version != nil && $tons_version >= 6.54 &&
          $game_system.SP_COST_MOD
        sp_cost = BlizzCFG.get_cost_mod(@actor.states, sp_cost)
      end
      self.contents.draw_text(204, i*32, 48, 32, sp_cost.to_s, 2)
    end
  end
  
end

#==============================================================================
# Window_Item_Hotkey
#==============================================================================

class Window_Item_Hotkey < Window_Item
  
  def initialize
    super
    @column_max = 1
    self.width, self.height = 288, 480
    self.x, self.y, self.z = 352, 64, 21000
    self.cursor_rect.empty
    self.active = false
    refresh
  end
  
  def draw_item(i)
    if @data[i] == nil
      self.contents.font.color = normal_color
      self.contents.draw_text(32, i*32, 212, 32, '<Remove>')
    else
      number = $game_party.item_number(@data[i].id)
      if $game_party.item_can_use?(@data[i].id)
        self.contents.font.color = normal_color
      else
        self.contents.font.color = disabled_color
      end
      self.contents.fill_rect(Rect.new(4, i*32, 256, 32), Color.new(0, 0, 0, 0))
      bitmap = RPG::Cache.icon(@data[i].icon_name)
      opacity = self.contents.font.color == normal_color ? 255 : 128
      self.contents.blt(4, 4+i*32, bitmap, Rect.new(0, 0, 24, 24), opacity)
      self.contents.draw_text(32, i*32, 212, 32, @data[i].name)
      self.contents.draw_text(212, i*32, 16, 32, ':', 1)
      self.contents.draw_text(228, i*32, 24, 32, number.to_s, 2)
    end
  end
  
end

#==============================================================================
# Scene_Hotkeys
#==============================================================================

class Scene_Hotkeys
  
  def main
    @spriteset = Spriteset_Map.new
    @view = Viewport.new(0, 0, 640, 480)
    @view.tone = @tone.clone
    @hud = Hud.new if BlizzABS::Config::HUD_ENABLED && $game_system.hud
    if BlizzABS::Config::HOTKEYS
      @hotkeys = Hotkey_Assignment.new
      @hotkeys.z = 5000
    end
    if BlizzABS::Config::MINIMAP && $game_system.minimap > 0
      @minimap = Minimap.new
    end
    @choice = Sprite.new
    @choice.bitmap = $BlizzABS.cache.image('menu_arrow')
    @choice.x, @choice.y, @choice.z, @choice.opacity = 40, 192, 500, 128
    @choice.angle = 90
    @choice.ox = -8
    @active = true
    @index = 0
    @up_mode = true
    @skill_window = Window_Skill_Hotkey.new($game_player.battler)
    @item_window = Window_Item_Hotkey.new
    @last_active = true
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      break if $scene != self
    end
    Graphics.freeze
    @spriteset.dispose
    [@hud, @hotkeys, @minimap].each {|s| s.dispose if s != nil}
    @choice.dispose
    @skill_window.dispose
    @item_window.dispose
    @view.dispose
    while @party_leader != $game_party.actors[0]
      $BlizzABS.player.switch_leader
    end
  end
  
  def update
    @choice.update
    @skill_window.update
    @item_window.update
    @hotkeys.update if @hotkeys != nil
    @choice.oy += (@up_mode ? (@active ? 2 : 1) : (@active ? -2 : -1))
    @up_mode = (@up_mode ? (@choice.oy < 8) : (@choice.oy <= -8))
    if $game_system.select_button && Input.trigger?(Input::Select)
      $game_system.se_play($data_system.cursor_se)
      $BlizzABS.player.switch_leader
      @skill_window.switch_actor
      @hud.update if @hud != nil
      @hotkeys.update if @hotkeys != nil
    elsif @active
      @choice.oy = @choice.oy / 2 * 2
      update_choice
    elsif @skill_window.active
      update_skill
    elsif @item_window.active
      update_item
    end
  end
  
  def update_choice
    @choice.y = 192 + @index * 32
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      $scene = Scene_Map.new
    elsif Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      @active = false
      @skill_window.active = @last_active
      @item_window.active = (!@last_active)
    elsif Input.repeat?(Input::DOWN)
      if Input.trigger?(Input::DOWN) || @index < 9
        $game_system.se_play($data_system.cursor_se)
        @index = (@index + 1) % 10
      end
    elsif Input.repeat?(Input::UP)
      if Input.trigger?(Input::UP) || @index >= 1
        $game_system.se_play($data_system.cursor_se)
        @index = (@index + 9) % 10
      end
    end
  end
  
end