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
  def create_alpha_layer(
    viewport, 
    blend_type = 0, 
    z_index = 0, 
    tone = Tone.new(0,0,0,0)
  )
    layer = Sprite.new(viewport)
    viewport_rect = viewport.rect
    layer.bitmap = Bitmap.new(
      viewport_rect.width, 
      viewport_rect.height
    )
    layer.tone = tone
    layer.blend_type = blend_type
    layer.z = z_index
    return layer
  end
  
  alias light_initialize initialize
  def initialize
    
    @light_viewport = Viewport.new(0,0,640,480)
    @light_viewport.z = 50
    
    @light_alpha = Sprite.new(@light_viewport)
    @light_alpha.bitmap = Bitmap.new(640, 480)
    @light_alpha.blend_type = 2
    
    @light_alpha.z  = 2
    @color_layer = {}
    {
      'red'   => Tone.new(-255, 0, 0),
      'green' => Tone.new(0, -255, 0), 
      'blue'  => Tone.new(0, 0, -255)
    }.each do |color, tone|
      alpha_layer = create_alpha_layer(
        @light_viewport,
        2,
        1,
        tone
      )
      @color_layer[color] = alpha_layer
    end
    @beam_layer = {}

    {
      'red'   => Tone.new(0, -255, -255),
      'green' => Tone.new(-255, 0, -255), 
      'blue'  => Tone.new(-255, -255, 0)
    }.each do |color, tone|
      alpha_layer = create_alpha_layer(
        @light_viewport,
        1,
        3,
        tone
      )
      @beam_layer[color] = alpha_layer
    end 

    @light_beam_alpha = make_light(300, 0.5, Color.new(0, 0, 0))
    @color_envrionment_alpha = make_light(300, 1)
    @color_beam_alpha = make_light(50, 0.5)
    
    
    @light_alpha.tone = Tone.new(0,0,0,255)
    
    $light = @light_alpha
    
    light_initialize
  end
  
  alias light_update update
  def update
   
    @color_layer.each do |name, layer|
      layer.opacity = $light.tone.gray / 2
    end
    @beam_layer.each do |name, layer|
      layer.opacity = $light.tone.gray
    end
    
    @light_alpha.opacity = $light.tone.gray
    
    range = @light_beam_alpha.width / 2
    
    @old_position ||= {}
    
    layer_update = []
    
    $game_map.events.each do |idx, event|
      next if event.screen_x < -range || event.screen_x > range + 640 || event.screen_y < -range || event.screen_y > range + 480
      if @old_position[event] != nil
        next if @old_position[event]["x"] == event.screen_x && @old_position[event]["y"] == event.screen_y
      end
      @old_position[event] = { 'x' => event.screen_x, 'y' => event.screen_y }
      
      if not layer_update.include?(@light_alpha.bitmap)
        bitmap.fill_rect(0, 0, width, height, Color.new(255,255,255))
        layer_update << @light_alpha.bitmap
      end
      
      strength_match = event.name.scan(/\\strength\[([\d\.]+)\]/)
      strength = strength_match[0] == nil ? 1.0 : strength_match[0][0].to_f
      @light_alpha.bitmap.blt(
        event.screen_x - @light_beam_alpha.width / 2,
        event.screen_y - @light_beam_alpha.width / 2 - 16, 
        @light_beam_alpha,
        Rect.new(0, 0, @light_beam_alpha.width, @light_beam_alpha.height),
        255.0 * strength
      )
      @color_layer.each do |name, layer|
        layer_match = event.name.scan(/\\#{Regexp.quote(name)}\[(\d+)\]/)
        next if layer_match[0] == nil
        opacity = layer_match[0][0].to_i# if match.is_a?(Regex)
        
        if not layer_update.include?(layer.bitmap)
          bitmap.fill_rect(0, 0, width, height, Color.new(0,0,0))
          layer_update << layer.bitmap
        end
        
        layer.bitmap.blt(
          event.screen_x - @color_envrionment_alpha.width / 2,
          event.screen_y - @color_envrionment_alpha.width / 2 - 16, 
          @color_envrionment_alpha,
          Rect.new(
            0, 
            0,
            @color_envrionment_alpha.width,
            @color_envrionment_alpha.height
          ),
          opacity * strength
        )
      end
      @beam_layer.each do |name, layer|
        layer_match = event.name.scan(/\\#{Regexp.quote(name)}\[(\d+)\]/)
        next if layer_match[0] == nil
        opacity = layer_match[0][0].to_i# if match.is_a?(Regex)
        
        if not layer_update.include?(layer.bitmap)
          bitmap.fill_rect(0, 0, width, height, Color.new(0,0,0))
          layer_update << layer.bitmap
        end
        
        layer.bitmap.blt(
          event.screen_x - @color_beam_alpha.width / 2,
          event.screen_y - @color_beam_alpha.width / 2 - 16, 
          @color_beam_alpha,
          Rect.new(
            0, 
            0,
            @color_beam_alpha.width,
            @color_beam_alpha.height
          ),
          opacity * strength
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
          alpha = 255.0 * (dist_sqr.to_f / reach_sqr.to_f) #dist_sqr.to_f ** (-dist_sqr.to_f / (reach_sqr.to_f + dist_sqr.to_f)) #(dist_sqr.to_f / reach_sqr.to_f)
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
