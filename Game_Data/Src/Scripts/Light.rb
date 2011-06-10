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
    @black_ambiance_layer = Light_Manager.get_radiant(range, strength, Color.new(0,0,0))
    @white_ambiance_layer = Light_Manager.get_radiant(range, strength, Color.new(255,255,255))
    @white_beam_layer = Light_Manager.get_radiant(range, strength, Color.new(255,255,255), false)
  end
  def draw(bitmap, layer, opacity)
    self_center_x = self.x - self.width / 2
    self_center_y = self.y - self.height / 2

    layer_width = layer.width
    layer_height = layer.height
    layer_center_x = self_center_x #- @layer.width / 2
    layer_center_y = self_center_y #- @layer.height / 2
    layer_rectangle = Rect.new(0, 0, width, height)
    bitmap.blt(
      layer_center_x,
      layer_center_y,
      layer,
      layer_rectangle, #This can be cashed!
      opacity
    )
  end
  def draw_alpha_ambiance(bitmap)
    draw(bitmap, @black_ambiance_layer, @tone.gray) if @tone.gray != 0
  end
  def draw_red_ambiance(bitmap)
    draw(bitmap, @white_ambiance_layer, @tone.red) if @tone.red != 0
  end
  def draw_green_ambiance(bitmap)
    draw(bitmap, @white_ambiance_layer, @tone.green) if @tone.green != 0
  end
  def draw_blue_ambiance(bitmap)
    draw(bitmap, @white_ambiance_layer, @tone.blue) if @tone.blue != 0
  end
  def draw_red_beam(bitmap)
    draw(bitmap, @white_beam_layer, @tone.red) if @tone.red != 0
  end
  def draw_green_beam(bitmap)
    draw(bitmap, @white_beam_layer, @tone.green) if @tone.green != 0
  end
  def draw_blue_beam(bitmap)
    draw(bitmap, @white_beam_layer, @tone.blue) if @tone.blue != 0
  end
  def updates_green?
    return @tone.green != 0
  end
  def updates_red?
    return @tone.red != 0
  end
  def updates_blue?
    return @tone.blue != 0
  end
  def updates_alpha?
    return @tone.gray != 0
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
  def self.get_radiant(range, strength, color, linear = true)
    range = range.to_f
    strength = strength.to_f
    @@radiant ||= {}
    if @@radiant[[range, strength, color, linear]] == nil
      diameter = range * 2
      range_sqr = range ** 2
      canvas = Bitmap.new(diameter, diameter)
      for x in 0..diameter do
        for y in 0..diameter do
          dist_sqr = (range - x)**2 + (range - y)**2
          if dist_sqr <= range_sqr
            if (linear)
              alpha = 255.0 * strength * (dist_sqr.to_f / range_sqr.to_f) #dist_sqr.to_f ** (-dist_sqr.to_f / (reach_sqr.to_f + dist_sqr.to_f)) #(dist_sqr.to_f / reach_sqr.to_f)
              alpha = 255.0 - alpha 
            else
              alpha = 255.0 * strength * dist_sqr.to_f ** (-dist_sqr.to_f / (range_sqr.to_f + dist_sqr.to_f))
            end
            color.alpha = alpha
            #color.red = alpha
            #color.green = alpha
            #color.blue = alpha
            
            canvas.set_pixel(x, y, color)
          end
        end
      end
      @@radiant[[range, strength, color, linear]] = canvas
    end
    return @@radiant[[range, strength, color, linear]]
  end
end

class Alpha_Layer < Sprite
  def initialize(viewport, clear_color)
    super(viewport)
    @clear_color = clear_color
    viewport_rect = viewport.rect
    self.bitmap = Bitmap.new(viewport_rect.width, viewport_rect.height)
    clear
  end
  def clear
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
  alias light_initialize initialize
  def initialize
    @event_last_position = {}
    
    $light = Tone.new(255, 255, 255, 100)
    
    @light_viewport = Viewport.new(0,0,640,480)
    @light_viewport.z = 50
    
    @alpha_layer = Alpha_Layer.new(@light_viewport, Color.new(255,255,255))
    @alpha_layer.blend_type = 2
    @alpha_layer.z = 2
    #@alpha_layer.tone = Tone.new(255, 255, 255)
    
    @red_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @red_layer.blend_type = 2
    @red_layer.tone = Tone.new(-255, 0, 0)
    @red_layer.z = 1
    
    @green_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @green_layer.blend_type = 2
    @green_layer.tone = Tone.new(0, -255, 0)
    @green_layer.z = 1
    
    @blue_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @blue_layer.blend_type = 2
    @blue_layer.tone = Tone.new(0, 0, -255)
    @blue_layer.z = 1
    
    @red_beam_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @red_beam_layer.blend_type = 1
    @red_beam_layer.tone = Tone.new(0, -255, -255)
    @red_beam_layer.z = 3
    
    @green_beam_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @green_beam_layer.blend_type = 1
    @green_beam_layer.tone = Tone.new(-255, 0, -255)
    @green_beam_layer.z = 3
    
    @blue_beam_layer = Alpha_Layer.new(@light_viewport, Color.new(0, 0, 0))
    @blue_beam_layer.blend_type = 1
    @blue_beam_layer.tone = Tone.new(-255, -255, 0)
    @blue_beam_layer.z = 3

    @light_source = get_light_source($game_map.events)
    light_initialize
  end
  
  def get_light_source(events)
    command_list = [
      ["range", 25.0],
      ["strength", 1.0],
      ["red", 0.0],
      ["green", 0.0],
      ["blue", 0.0],
      ["alpha", 255.0]
    ]
    light_source = []
    events.each do |index, event|
      event_name = event.name
      if event_name =~ /\\light\b/i
        param = [event]
        command_list.each do |command|
          command, default = command
          cmd_search = event_name.scan(/\\#{Regexp.quote(command)}\[([\d\.]+)\]/i)
          if cmd_search[0] != nil && cmd_search[0][0] != nil
            param << cmd_search[0][0].to_f
          else
            param << default  
          end
        end
        light_source << Light_Source.new(*param)
      end
    end
    return light_source
  end
  
  def get_modified_light_source(light_sources)
    red_draw_stack = []
    blue_draw_stack = []
    green_draw_stack = []
    alpha_draw_stack = []
    light_sources.each do |light_source|
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
            if light_source.updates_alpha? 
              alpha_draw_stack << light_source
            end            
            if light_source.updates_red?
              red_draw_stack << light_source
            end
            if light_source.updates_green?
              green_draw_stack << light_source
            end
            if light_source.updates_blue?
              blue_draw_stack << light_source
            end
          end
          @event_last_position[light_source] = [light_source_x, light_source_y]
        end #eif on_screen
      end #eif visible
    end #eeach light_source
    return [red_draw_stack, green_draw_stack, blue_draw_stack, alpha_draw_stack]
  end
  
  alias light_update update
  def update
    
    red_draw_stack,
        blue_draw_stack,
        green_draw_stack,
        alpha_draw_stack = get_modified_light_source(@light_source)
=begin    
    update_layer([@alpha_layer], alpha_draw_stack) if not alpha_draw_stack.empty?
    update_layer([@red_layer, @red_beam_layer], alpha_draw_stack) if not red_draw_stack.empty?
    update_layer([@green_layer, @green_beam_layer], alpha_draw_stack) if not green_draw_stack.empty?
    update_layer([@blue_layer, @blue_beam_layer], alpha_draw_stack) if not blue_draw_stack.empty?
=end

    if not alpha_draw_stack.empty?
      @alpha_layer.clear
      @light_source.each do |light_source|
        light_source.draw_alpha_ambiance(@alpha_layer.bitmap)
      end
    end
    if not red_draw_stack.empty?
      @red_layer.clear
      @red_beam_layer.clear
      @light_source.each do |light_source|
        light_source.draw_red_ambiance(@red_layer.bitmap)
        light_source.draw_red_beam(@red_beam_layer.bitmap)
      end
    end
    if not green_draw_stack.empty?
      @green_layer.clear
      @green_beam_layer.clear
      @light_source.each do |light_source|
        light_source.draw_green_ambiance(@green_layer.bitmap)
        light_source.draw_green_beam(@green_beam_layer.bitmap)
      end
    end
    if not blue_draw_stack.empty?
      @blue_layer.clear
      @blue_beam_layer.clear
      @light_source.each do |light_source|
        light_source.draw_blue_ambiance(@blue_layer.bitmap)
        light_source.draw_blue_beam(@blue_beam_layer.bitmap)
      end
    end
    
    @light_viewport.update
    light_update
  end
=begin
  def update_layer(layer, stack)
    if stack[0] != nil
      layer.each do |alpha_layer|
        alpha_layer.clear
        layer.opacity = $light.gray
      end
    end
    while(stack_item = stack.pop)
      #alpha_layer.draw_blue_ambiance(@blue_layer.bitmap)
      #alpha_.draw_blue_beam(@blue_beam_layer.bitmap)
      layer.each do |alpha_layer|
        stack_item.draw(alpha_layer)
      end
    end
  end
=end
end