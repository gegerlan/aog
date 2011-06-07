#TODO: Update layers only on changes to light source
#TODO: Bind light source only to sepecific events
#TODO: Fix blending (z-layer for tiles?)
#TODO: Add light center/source (focal point)
#TODO: Change ranges for light circles (possibly blt-stretch)
#TODO: Add pulsing effect (opacity/size) for light source

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
    
    @light_alpha.z  = 1
    @color_layer = {}
    {
      'red'   => Tone.new(   0, -255, -255), 
      'green' => Tone.new(-255,    0, -255), 
      'blue'  => Tone.new(-255, -255,    0)
    }.each do |color, tone|
      color_alpha = Sprite.new(@light_viewport)
      color_alpha.bitmap = Bitmap.new(640, 480)
      color_alpha.tone = tone
      color_alpha.blend_type = 1
      color_alpha.z = 0
      @color_layer[color] = color_alpha
    end  

    @light_beam_alpha = make_light(100, 1, Color.new(0, 0, 0))
    @color_beam_alpha = make_light(100, 1)
    
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
        255,
        255,
        255,
        255
      )
    )
    @color_layer.each do |name, layer|
      layer.bitmap.fill_rect(
        0, 
        0, 
        @light_alpha.bitmap.width, 
        @light_alpha.bitmap.height, 
        Color.new(
          0,
          0,
          0,
          255
        )
      )
      layer.opacity = $light.alpha / 2
    end
    
    
    @light_alpha.opacity = $light.alpha
    
    range = @light_beam_alpha.width / 2

    $game_map.events.each do |idx, event|
      next if event.screen_x < -range || event.screen_x > range + 640 || event.screen_y < -range || event.screen_y > range + 480
      strength_match = event.name.scan(/\\strength\[([\d\.]+)\]/)
      strength = strength_match[0] == nil ? 1.0 : strength_match[0][0].to_f
      @light_alpha.bitmap.blt(
        event.screen_x - range,
        event.screen_y - range, 
        @light_beam_alpha,
        Rect.new(0, 0, @light_beam_alpha.width, @light_beam_alpha.height),
        255.0 * strength
      )
      @color_layer.each do |name, layer|
        layer_match = event.name.scan(/\\#{Regexp.quote(name)}\[(\d+)\]/)
        next if layer_match[0] == nil
        opacity = layer_match[0][0].to_i# if match.is_a?(Regex)
        layer.bitmap.blt(
          event.screen_x - range,
          event.screen_y - range, 
          @color_beam_alpha,
          Rect.new(
            0, 
            0,
            @color_beam_alpha.width,
            @color_beam_alpha.height
          ),
          opacity
        )
      end
    end
    
    @light_viewport.update
    light_update
  end
  
  def make_light(reach, strength, color = Color.new(255, 255, 255))
    diameter = reach * 2
    canvas = Bitmap.new(diameter, diameter)
    reach_sqr = reach ** 2
    for x in 0..diameter do
      for y in 0..diameter do
        dist_sqr = (reach - x)**2 + (reach - y)**2
        if dist_sqr <= reach_sqr
          alpha = 255.0 * (dist_sqr.to_f / reach_sqr.to_f)
          alpha = 255.0 - alpha 
          color.alpha = alpha
          alpha_color = color
          canvas.set_pixel(x, y, alpha_color)
        end
      end
    end
    return canvas
  end
end
