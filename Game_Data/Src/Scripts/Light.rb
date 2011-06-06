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
    
=begin
    @green_alpha = Sprite.new(@light_viewport)
    @green_alpha.bitmap = Bitmap.new(640, 480)
    @green_alpha.blend_type = 2
    #@green_alpha.color = Color.new(255, 0, 255)
    @green_alpha.opacity = 255

    

    @blue_alpha = Sprite.new(@light_viewport)
    @blue_alpha.bitmap = @light_alpha.bitmap
    @blue_alpha.blend_type = 2
    @blue_alpha.color = Color.new(255, 255, 0)
    
    @red_alpha = Sprite.new(@light_viewport)
    @red_alpha.bitmap = @light_alpha.bitmap
    @red_alpha.blend_type = 2
    @red_alpha.color = Color.new(0, 255, 255)
=end    

    @light_beam_alpha = make_light(100, 1)
    
    $light = Color.new(255, 255, 255, 0)
    
    
    light_initialize
  end
  
  alias light_update update
  def update

    @light_alpha.bitmap.fill_rect(
      0, 
      0, 
      @light_alpha.bitmap.width, 
      @light_alpha.bitmap.height, 
      Color.new(
        $light.red,
        $light.green,
        $light.blue,
        $light.alpha
      )
    )

    range = @light_beam_alpha.width / 2

    $game_map.events.each do |idx, event|
      next if event.screen_x < -range || event.screen_x > range + 640 || event.screen_y < -range || event.screen_y > range + 480
      @light_alpha.bitmap.blt(
        event.screen_x - range,
        event.screen_y - range, 
        @light_beam_alpha,
        Rect.new(0, 0, @light_beam_alpha.width, @light_beam_alpha.height)
      )
    end
    
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
          alpha_color = Color.new(0, 0, 0, 220 - alpha)
          canvas.set_pixel(x, y, alpha_color)
        end
      end
    end
    return canvas
  end
end
