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
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    # Make viewports
    @viewport1 = Viewport.new(0, 0, 640, 480)
    @viewport2 = Viewport.new(0, 0, 640, 480)
    @viewport3 = Viewport.new(0, 0, 640, 480)
    @viewport2.z = 200
    @viewport3.z = 5000
    # Make tilemap
    @tilemap = Tilemap.new(@viewport1)
    @tilemap.tileset = RPG::Cache.tileset($game_map.tileset_name)
    for i in 0..6
      autotile_name = $game_map.autotile_names[i]
      @tilemap.autotiles[i] = RPG::Cache.autotile(autotile_name)
    end
    @tilemap.map_data = $game_map.data
    @tilemap.priorities = $game_map.priorities
  
=begin    
    @fov = Tilemap.new(@viewport1)
    @fov.tileset = RPG::Cache.tileset($game_map.tileset_name)
    @fov.map_data = Table.new($game_map.display_x, $game_map.display_y, 3)
    for x in 0..50
      for y in 0..50
        @fov.map_data[x,y,0] = 0
        @fov.map_data[x,y,1] = 0
        @fov.map_data[x,y,2] = 396
      end
    end
    @fov.priorities = $game_map.priorities
=end


=begin
    bitmap = Bitmap.new(640,480)
    x = 0
    y = 0
    for x in 0..bitmap.width do
      for y in 0..bitmap.height do
        alpha = [[200 * (Math.sqrt((($game_player.screen_x - x)**2 + ($game_player.screen_y - y)**2)) / 50), 200].min, 150].max
        color = Color.new(alpha.abs,alpha.abs,alpha.abs)
        bitmap.set_pixel(x, y, color)
      end
    end
    @fov.bitmap = bitmap
    @fov.blend_type = 2
=end

    @darkness = Sprite.new(@viewport1)
    canvas = Bitmap.new(640,480)
    
    ambiance = 100.0
    
    canvas.fill_rect(0, 0, canvas.width, canvas.height, Color.new(255,255,255,ambiance)) 
    @darkness.bitmap = canvas

    @darkness.blend_type = 2
    @darkness.z = 1000
    
    
    @light = {}
    
    @fov = Sprite.new(@viewport1)
    @fov.z = 999
    
    $game_map.events.each do |k, event| 
      r,g,b = event.name.scan(/\\c\[(\d+),(\d+),(\d+)\]/)[0]
      
      reach = 100
      reach_modifier = 1.2
      strength = 1
      strength_modifier = 0.8
      
      ambiance_modifier = ambiance / 255.0
      
      reach *= reach_modifier
      strength *= strength_modifier * ambiance_modifier
      
      
      alpha_layer = Sprite.new(@viewport1)
      color_layer = Sprite.new(@viewport1)
      alpha_canvas = Bitmap.new(reach * 2, reach * 2)
      color_canvas = Bitmap.new(reach * 2, reach * 2)
      
      reach_diameter = reach * 2
      reach_sqr = reach ** 2
      for x in 0..reach_diameter do
        for y in 0..reach_diameter do
          dist_sqr = (reach - x)**2 + (reach - y)**2
          if dist_sqr <= reach_sqr
            alpha = 255.0 * dist_sqr.to_f ** (-dist_sqr.to_f / (reach_sqr.to_f + dist_sqr.to_f))
            alpha *= strength
            alpha_color = Color.new(alpha, alpha, alpha)
            alpha_canvas.set_pixel(x, y, alpha_color)
            color_color = Color.new(r.to_f, g.to_f, b.to_f, alpha)
            color_canvas.set_pixel(x, y, color_color)
          end
        end
      end
       
      alpha_layer.bitmap = alpha_canvas
      alpha_layer.blend_type = 1
      alpha_layer.x = event.screen_x - reach / 2
      alpha_layer.y = event.screen_y - reach / 2
      alpha_layer.z = 999
      
      color_layer.bitmap = color_canvas
      color_layer.blend_type = 1
      color_layer.x = event.screen_x - reach / 2
      color_layer.y = event.screen_y - reach / 2
      color_layer.z = 1000

      
      @light[event]=[alpha_layer, color_layer]
    end
    

    canvas = Bitmap.new(640,480)
    canvas.fill_rect(0, 0, canvas.width, canvas.height, Color.new(0,0,0)) 
    
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
   

    # Make panorama plane
    @panorama = Plane.new(@viewport1)
    @panorama.z = -1000
    # Make fog plane
    @fog = Plane.new(@viewport1)
    @fog.z = 3000
    # Make character sprites
    @character_sprites = []
    for i in $game_map.events.keys.sort
      sprite = Sprite_Character.new(@viewport1, $game_map.events[i])
      @character_sprites.push(sprite)
    end
    @character_sprites.push(Sprite_Character.new(@viewport1, $game_player))
    # Make weather
    @weather = RPG::Weather.new(@viewport1)
    # Make picture sprites
    @picture_sprites = []
    for i in 1..50
      @picture_sprites.push(Sprite_Picture.new(@viewport2,
        $game_screen.pictures[i]))
    end
    # Make timer sprite
    @timer_sprite = Sprite_Timer.new
    # Frame update
    update
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    # Dispose of tilemap
    @tilemap.tileset.dispose
    for i in 0..6
      @tilemap.autotiles[i].dispose
    end
    @tilemap.dispose
    # Dispose of panorama plane
    @panorama.dispose
    # Dispose of fog plane
    @fog.dispose
    # Dispose of character sprites
    for sprite in @character_sprites
      sprite.dispose
    end
    # Dispose of weather
    @weather.dispose
    # Dispose of picture sprites
    for sprite in @picture_sprites
      sprite.dispose
    end
    # Dispose of timer sprite
    @timer_sprite.dispose
    # Dispose of viewports
    @viewport1.dispose
    @viewport2.dispose
    @viewport3.dispose
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    
    @light.each do |event, sprites|
      sprites.each do |sprite|
        sprite.x = event.screen_x - sprite.bitmap.width / 2
        sprite.y = event.screen_y - sprite.bitmap.height / 2 
      end
    end
    
    
    # If panorama is different from current one
    if @panorama_name != $game_map.panorama_name or
       @panorama_hue != $game_map.panorama_hue
      @panorama_name = $game_map.panorama_name
      @panorama_hue = $game_map.panorama_hue
      if @panorama.bitmap != nil
        @panorama.bitmap.dispose
        @panorama.bitmap = nil
      end
      if @panorama_name != ""
        @panorama.bitmap = RPG::Cache.panorama(@panorama_name, @panorama_hue)
      end
      Graphics.frame_reset
    end
    # If fog is different than current fog
    if @fog_name != $game_map.fog_name or @fog_hue != $game_map.fog_hue
      @fog_name = $game_map.fog_name
      @fog_hue = $game_map.fog_hue
      if @fog.bitmap != nil
        @fog.bitmap.dispose
        @fog.bitmap = nil
      end
      if @fog_name != ""
        @fog.bitmap = RPG::Cache.fog(@fog_name, @fog_hue)
      end
      Graphics.frame_reset
    end
    # Update tilemap
    @tilemap.ox = $game_map.display_x / 4
    @tilemap.oy = $game_map.display_y / 4
    #@tilemap.update
    

    #@fov.ox = $game_map.display_x / 4
    #@fov.oy = $game_map.display_y / 4

  
    # Update panorama plane
    @panorama.ox = $game_map.display_x / 8
    @panorama.oy = $game_map.display_y / 8
    # Update fog plane
    @fog.zoom_x = $game_map.fog_zoom / 100.0
    @fog.zoom_y = $game_map.fog_zoom / 100.0
    @fog.opacity = $game_map.fog_opacity
    @fog.blend_type = $game_map.fog_blend_type
    @fog.ox = $game_map.display_x / 4 + $game_map.fog_ox
    @fog.oy = $game_map.display_y / 4 + $game_map.fog_oy
    @fog.tone = $game_map.fog_tone
    # Update character sprites
    for sprite in @character_sprites
      sprite.update
    end
    # Update weather graphic
    @weather.type = $game_screen.weather_type
    @weather.max = $game_screen.weather_max
    @weather.ox = $game_map.display_x / 4
    @weather.oy = $game_map.display_y / 4
    @weather.update
    # Update picture sprites
    for sprite in @picture_sprites
      sprite.update
    end
    # Update timer sprite
    @timer_sprite.update
    # Set screen color tone and shake position
    @viewport1.tone = $game_screen.tone
    @viewport1.ox = $game_screen.shake
    # Set screen flash color
    @viewport3.color = $game_screen.flash_color
    # Update viewports
    @viewport1.update
    @viewport3.update
  end
end
