class Game_Event < Game_Character
  def name
    return @event.name
  end
end

#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc.
#  It's used within the Scene_Map class.
#==============================================================================

class Spriteset_Map
  alias light_initialize initialize
  def initialize
    
    @light_viewport = Viewport.new(0,0,640,480)
    @light_viewport.z = 500
    
    @light_alpha = Sprite.new(@light_viewport)
    @light_alpha.bitmap = Bitmap.new(640, 480)
    
    @light_alpha.blend_type = 2
    #@light_alpha.blend_type = 0
    
    @light_beam_alpha = make_light(100, 1)
    
    light_initialize
    
    
    @light_alpha.bitmap.fill_rect(
      0, 
      0, 
      @light_alpha.bitmap.width, 
      @light_alpha.bitmap.height, 
      Color.new(255,255,255)
    )
    $game_map.events.each do |idx, event|
      @light_alpha.bitmap.blt(
        event.screen_x - @light_beam_alpha.width / 2, 
        event.screen_y - @light_beam_alpha.height / 2, 
        @light_beam_alpha,
        Rect.new(0, 0, @light_beam_alpha.width, @light_beam_alpha.height)
      )
    end    
    
    
  end
  
  alias light_update update
  def update

    @light_viewport.update
    light_update
  end

  
  def make_light(reach, strength)
    diameter = reach * 2
    canvas = Bitmap.new(diameter, diameter)
    reach_sqr = reach ** 2
    for x in 0..diameter do
      for y in 0..diameter do
        dist_sqr = (reach - x)**2 + (reach - y)**2
        if dist_sqr <= reach_sqr
          alpha = 255.0 * (dist_sqr.to_f / reach_sqr.to_f)
          alpha_color = Color.new(0, 0, 0, 255 - alpha)
          canvas.set_pixel(x, y, alpha_color)
        end
      end
    end
    return canvas
  end
end
