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
    @darkness = Sprite.new(@viewport1)
    canvas = Bitmap.new(640,480)
    
    ambiance = 100.0
    
    canvas.fill_rect(0, 0, canvas.width, canvas.height, Color.new(255,255,255,ambiance)) 
    @darkness.bitmap = canvas

    @darkness.blend_type = 2
    @darkness.z = 101
    
    
    @light = {}
    
    $game_map.events.each do |k, event| 
      r,g,b = event.name.scan(/\\c\[(\d+),(\d+),(\d+)\]/)[0]
      
      reach = event.name.scan(/\\r\[(\d+)\]/)[0][0].to_f
      reach_modifier = 1.2
      strength = event.name.scan(/\\s\[([\d\.]+)\]/)[0][0].to_f
      strength_modifier = 0.8
      
      ambiance_modifier = ambiance / 255.0
      
      reach *= reach_modifier
      strength *= strength_modifier * ambiance_modifier
      
      @light[event] = get_light_sprites(reach, strength, r, g, b)
      @light[event].each do |sprite|
        sprite.x = event.screen_x - reach / 2
        sprite.y = event.screen_y - reach / 2
      end
    end
    
=begin
    @fov = Sprite.new(@viewport1)
    @fov.z = 999
    
    bx = $game_player.screen_x
    by = $game_player.screen_y
    
    reach = 100
    reach_modifier = 1
    strength = 0.1
    strength_modifier = 1
    
    reach *= reach_modifier
    strength *= strength_modifier
    
    reach_diameter = reach * 2
    reach_sqr = reach ** 2
    
    canvas = Bitmap.new(reach_diameter, reach_diameter)
    canvas.fill_rect(0, 0, canvas.width, canvas.height, Color.new(0,0,0)) 
    
    for x in 0..reach_diameter do
      for y in 0..reach_diameter do
        dist_sqr = (reach - x)**2 + (reach - y)**2
        if dist_sqr <= reach_sqr
          alpha = 255 - (255 * (dist_sqr.to_f / reach_sqr.to_f))
          alpha *= strength
          color = Color.new(alpha, alpha, alpha)
          canvas.set_pixel(bx + x - reach, by + y - reach, color)
        end
      end
    end
     
    @fov.bitmap = canvas
    @fov.blend_type = 1
  
    @light[$game_player] = [@fov]
=end
    light_initialize 
  end
  alias light_update update
  def update
    @light.each do |event, sprites|
      sprites.each do |sprite|
        sprite.x = event.screen_x - sprite.bitmap.width / 2
        sprite.y = event.screen_y - sprite.bitmap.height / 2 - 16
      end
    end
    light_update
  end
  def get_light_sprites(reach, strength, red, green, blue)
    $light_cache = {} if $light_cache == nil 
    
    if $light_cache[[reach, strength]] == nil
      $light_cache[[reach, strength]] = make_light(reach, strength)
    end
    
    canvas = $light_cache[[reach, strength]]
    canvas_color = make_light_alpha(reach, strength.to_f*0.8)
    canvas_color_2 = make_light_alpha(reach.to_f*0.5, strength)
    
    alpha = Sprite.new(@viewport1)
    color = Sprite.new(@viewport1)
    
    alpha.bitmap = canvas
    alpha.blend_type = 1
    alpha.z = 100
    
    
    r = red.to_i ^ 255
    g = green.to_i ^ 255
    b = blue.to_i ^ 255
    
    color.bitmap = canvas_color
    color.color = Color.new(
      r,
      g,
      b
    )
    color.z = 99
    color.blend_type = 2
    
    color2 = Sprite.new(@viewport1)
    color2.bitmap = canvas_color_2
    color2.color = Color.new(
      red.to_f,
      green.to_f,
      blue.to_f
    )
    color2.z = 102
    color2.blend_type = 1
    
    return [alpha, color, color2]
  end
  
  def make_light(reach, strength)
    diameter = reach * 2
    canvas = Bitmap.new(diameter, diameter)
    reach_sqr = reach ** 2
    for x in 0..diameter do
      for y in 0..diameter do
        dist_sqr = (reach - x)**2 + (reach - y)**2
        if dist_sqr <= reach_sqr
          alpha = 255.0 * dist_sqr.to_f ** (-dist_sqr.to_f / (reach_sqr.to_f + dist_sqr.to_f))
          alpha *= strength
          alpha_color = Color.new(alpha, alpha, alpha)
          canvas.set_pixel(x, y, alpha_color)
        end
      end
    end
    return canvas
  end
  def make_light_alpha(reach, strength)
    diameter = reach * 2
    canvas = Bitmap.new(diameter, diameter)
    reach_sqr = reach ** 2
    for x in 0..diameter do
      for y in 0..diameter do
        dist_sqr = (reach - x)**2 + (reach - y)**2
        if dist_sqr <= reach_sqr
          alpha = 255.0 * dist_sqr.to_f ** (-dist_sqr.to_f / (reach_sqr.to_f + dist_sqr.to_f))
          alpha *= strength
          alpha_color = Color.new(alpha, alpha, alpha, alpha)
          canvas.set_pixel(x, y, alpha_color)
        end
      end
    end
    return canvas
  end
  
end
