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

class Light_Source
  attr_reader :event
  attr_reader :range
  attr_reader :strength
  def initialize(event, range, strength, red, green, blue, alpha)
    @event = event
    @range = range
    @strength = strength
    @tone = Tone.new(red, green, blue, alpha)
    @layer = Light_Manager.get_radiant(range, strength)
  end
  def draw(bitmap, opacity)
    self_center_x = self.x + self.width / 2
    self_center_y = self.y + self.height / 2

    layer_width = @layer.width
    layer_height = @layer.height
    layer_center_x = self_center_x - @layer.width / 2
    layer_center_y = self_center_y - @layer.height / 2
    layer_rectangle = Rect.new(0, 0, width, height)
    bitmap.blt(
      layer_center_x,
      layer_center_y,
      @layer,
      layer_rectangle, #This can be cashed!
      opacity
    )
  end
  def draw_alpha(bitmap)
    draw(bitmap, @tone.gray) if @tone.gray != 0
  end
  def draw_red(bitmap)
    draw(bitmap, @tone.red) if @tone.red != 0
  end
  def draw_green(bitmap)
    draw(bitmap, @tone.green) if @tone.green != 0
  end
  def draw_blue(bitmap)
    draw(bitmap, @tone.blue) if @tone.blue != 0
  end
  def x 
    return @event.screen_x
  end
  def y 
    return @event.screen_y
  end
  def width
    return @range * 2
  end
  def height
    return @range * 2
  end
end

class Light_Manager
  def self.get_radiant(range, strength)
    @@radiant ||= {}
    if @@radiant[[range, strength]] == nil
      diameter = range * 2
      canvas = Bitmap.new(diameter, diameter)
      range_sqr = range ** 2
      for x in 0..diameter do
        for y in 0..diameter do
          dist_sqr = (range - x)**2 + (range - y)**2
          if dist_sqr <= range_sqr
            alpha = 255.0 * strength * (dist_sqr.to_f / range_sqr.to_f) #dist_sqr.to_f ** (-dist_sqr.to_f / (reach_sqr.to_f + dist_sqr.to_f)) #(dist_sqr.to_f / reach_sqr.to_f)
            alpha = 255.0 - alpha 
            alpha_color = Color.new(alpha,alpha,alpha)
            canvas.set_pixel(x, y, alpha_color)
          end
        end
      end
      @@radiant[[range, strength]] = canvas
    end
    return @@radiant[[range, strength]]
  end
end

class Alpha_Layer < Sprite
  def initialize(viewport, clear_color)
    super(viewport)
    @clear_color = clear_color
    viewport_rect = viewport.rect
    self.bitmap = Bitmap.new(viewport_rect.width, viewport_rect.height)
    clear(clear_color)
  end
  def clear(color)
    self.bitmap.fill_rect(
      0,
      0,
      self.bitmap.width,
      self.bitmap.height,
      @clear_color
    )
  end
end

#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc.
#  It's used within the Scene_Map class.
#==============================================================================

class Spriteset_Map
=begin
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
=end
  alias light_initialize initialize
  def initialize
    @event_last_position = {}
    
    $light = Tone.new(255, 255, 255, 255)
    
    @light_viewport = Viewport.new(0,0,640,480)
    @light_viewport.z = 50
    
    @alpha_layer = Alpha_Layer.new(@light_viewport, Color.new(0,0,0))
    @alpha_layer.blend_type = 2
    @alpha_layer.z = 1
    @alpha_layer.tone = Tone.new(-255, -255, -255)
    
    @red_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @red_layer.blend_type = 2
    @red_layer.tone = Tone.new(-255, 0, 0)
    @red_layer.z = 0
    
    @green_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @green_layer.blend_type = 2
    @green_layer.tone = Tone.new(0, -255, 0)
    @green_layer.z = 0
    
    @blue_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @blue_layer.blend_type = 2
    @blue_layer.tone = Tone.new(0, 0, -255)
    @blue_layer.z = 0

    @light_source = []
    @command = {
      "range" => 50.0,
      "strength" => 1.0,
      "red" => 255.0,
      "green" => 255.0,
      "blue" => 255.0,
      "alpha" => 255.0
    }
    $game_map.events.each do |index, event|
      event_name = event.name
      if event_name =~ /\\light\b/i
        param = [event]
        @command.each do |command, default|
          cmd_search = event_name.scan(/\\#{Regexp.quote(command)}\[([\d\.]+)\]/i)
          if cmd_search[0] && cmd_search[0][0]
            param << cmd_search[0][0].to_f
          else
            param << default  
          end
        end
        @light_source << Light_Source.new(*param)
      end
    end
    light_initialize
  end
  
  alias light_update update
  def update
    # Update tint level (reflects time of day)
    @alpha_layer.opacity = 100 #$light.gray
    # Since we don't use ambient light we need to fake ambiance light during day
    #@red_layer.tone.gray   = $light.gray / 2
    #@green_layer.tone.gray = $light.gray / 2
    #@blue_layer.tone.gray  = $light.gray / 2
    
    @light_source.each do |light_source|
      light_source_x = light_source.x
      light_source_y = light_source.y
      visible = true #light_source.event.visible
      if visible
        range = light_source.range
        # if the event's light is on screen
        on_screen = light_source_x > -range &&
                    light_source_x < 480 + range &&
                    light_source_y > -range &&
                    light_source_y < 480 + range
        if on_screen
          new_position = @event_last_position[light_source] == nil ||
                         @event_last_position[light_source] != 
                               [light_source_x, light_source_y]
          if new_position
            #print "draw!"
            light_source.draw_alpha(@alpha_layer.bitmap)
            light_source.draw_red(@red_layer.bitmap)
            light_source.draw_green(@green_layer.bitmap)
            light_source.draw_blue(@blue_layer.bitmap)
          end
          @event_last_position[light_source] = [light_source_x, light_source_y]
        end #eif on_screen
      end #eif visible
    end #eeach light_source
    
=begin
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
=end
    
    @light_viewport.update
    light_update
  end
=begin
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
=end
end
