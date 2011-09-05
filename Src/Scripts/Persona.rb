class Persona
  SCREEN_WIDTH  = 640
  SCREEN_HEIGHT = 480
  
  # WEAPONS
  CUFFS = 33
  
  # Center position for each layer (relative to the viewport center)
  OFFSET = {
    :mouth =>  { :x => 53, :y => 84,  :zoom => 0.9},
    :eyes  =>  { :x => 51, :y => 59, :zoom => 0.9},
    :armor3 => { :x => 63, :y => 211, :zoom => 1},
    :blush => { :x => 52, :y => 75, :zoom => 0.9},
    :tears => { :x => 52, :y => 72, :zoom => 0.9},
  }
  # Z-index of item. The higher the number, the more to the front
  ORDER = {
    :hair_back => 1,
    :body      => 5,
    :arms      => 7,
    :armor3_arms=>8,
    :blush     => 10,
    :drool     => 15,
    :mouth     => 20,
    :eyes      => 25,
    :tears     => 27,
    :stains    => 30,
    :armor3    => 40,
    :armor4    => 50,
    :hair_front=> 55,
    :armor2    => 60,
    :armor1    => 70,
  }
  
  def initialize(actor = $game_actors[1])
    @viewport = Viewport.new(0,0,300,300) # Create an empty viewport
    @actor = actor
    @layers = {}
    update
  end
  def update
    if @layers.empty?
      setup_actor
    end
    @layers.each do |index, layer|
      layer.update
    end
    @viewport.update
  end
  def dispose
    super
  end
  
  # Setup the persona for the given actor
  def setup_actor(actor = @actor)
    @actor = actor
    setup_layers
    setup_viewport
  end
  def setup_layers
    @layers = {}
    # Get the layers
    @layers.merge!(get_base_layers)
    @layers.merge!(get_hair_layers)
    @layers[:weapon] = get_weapon_layer
    @layers.merge!(get_armor_layers)
    @layers.merge!(get_face_layers)
    
    # Configure layers
    @layers.each do |index, image|
      if image_offset = OFFSET[index]
        @layers[index].x = image_offset[:x]
        @layers[index].y = image_offset[:y]
        @layers[index].zoom_y = image_offset[:zoom]
        @layers[index].zoom_x = image_offset[:zoom]
      end
      if (image_depth = ORDER[index]) != nil
        @layers[index].z = image_depth
      end
    end
  end

  def get_base_layers
    return {
      :body => get_body_layer,
      :arms => get_arms_layer,
    }
  end
  def get_body_layer
    proc_value = Proc.new { |callee|
      @actor.class_id
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      class_name = $data_classes[value].name.strip
      "Graphics/Persona/#{actor_name}/Body/#{class_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_arms_layer
    proc_value = Proc.new { |callee|
      #@actor.state?(STATE_CUFFED) ? 1 : 0
      @actor.weapon.id == CUFFS ? 1 : 0
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      arms_name = value
      "Graphics/Persona/#{actor_name}/Body/Arms/#{arms_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_hair_layers
    proc_value = Proc.new { |callee|
      1
    }
    proc_value_process_front = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      hair_name = "#{value}"
      "Graphics/Persona/#{actor_name}/Body/Hair/Front/#{hair_name}"
    }
    proc_value_process_back = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      hair_name = "#{value}"
      "Graphics/Persona/#{actor_name}/Body/Hair/Back/#{hair_name}"
    }
    
    return {
      :hair_front => Persona_Picture.new(@viewport, proc_value, proc_value_process_front),
      :hair_back => Persona_Picture.new(@viewport, proc_value, proc_value_process_back),
    }
  end
  
  def get_armor_layers
    return {
      :armor1 => get_armor_layer(:armor1_id),
      :armor2 => get_armor_layer(:armor2_id),
      :armor3 => get_armor_layer(:armor3_id),
      :armor4 => get_armor_layer(:armor4_id),
    }
  end
  def get_armor_layer(sym)
    proc_value = Proc.new { |callee|
      @actor.send(sym)
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      if value != 0
        armor_name = $data_armors[value].name.strip
        "Graphics/Persona/#{actor_name}/Equipment/Armor/#{armor_name}"
      else
        ""
      end
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_armor3_arms_layer(sym)
    proc_value = Proc.new { |callee|
      @actor.weapon.id == CUFFS ? 1 : 0 #@actor.state?(STATE_CUFFED) ?  1 : 0
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      armor3_id = @actor.armor3_id
      if armor3_id != 0
        armor_name = $data_armors[armor3_id].name.strip
        arms_name = value
        "Graphics/Persona/#{actor_name}/Equipment/Armor/#{armor_name}/arms_name"
      else
        ""
      end
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_weapon_layer
    proc_value = Proc.new { |callee|
      @actor.send(:weapon_id)
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      if value != 0
        weapon_name = $data_weapons[value].name.strip
        "Graphics/Persona/#{actor_name}/Equipment/Weapon/#{weapon_name}"
      else
        ""
      end
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_face_layers
    return {
      :blush => get_blush_layer,
      :eyes => get_eyes_layer,
      :tears => get_tears_layer,
      :mouth => get_mouth_layer,
      :drool => get_drool_layer,
      :stains => get_stains_layer,
    }
  end
  def get_eyes_layer
    proc_value = Proc.new { |callee|
      1
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      eyes_name = "#{value}".strip
      "Graphics/Persona/#{actor_name}/Face/Eyes/#{eyes_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_mouth_layer
    proc_value = Proc.new { |callee|
      1
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      mouth_name = "#{value}".strip
      "Graphics/Persona/#{actor_name}/Face/Mouth/#{mouth_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_tears_layer
    proc_value = Proc.new { |callee|
      0
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      tears_name = "#{value}".strip
      "Graphics/Persona/#{actor_name}/Face/Tears/#{tears_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_blush_layer
    proc_value = Proc.new { |callee|
      0
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      blush_name = "#{value}".strip
      "Graphics/Persona/#{actor_name}/Face/Blush/#{blush_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_drool_layer
    proc_value = Proc.new { |callee|
      1
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      drool_name = "#{value}".strip
      "Graphics/Persona/#{actor_name}/Face/Drool/#{drool_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def get_stains_layer
    proc_value = Proc.new { |callee|
      1
    }
    proc_value_process = Proc.new { |value, callee|
      actor_name = @actor.name.strip
      stains_name = "#{value}".strip
      "Graphics/Persona/#{actor_name}/Face/Stains/#{stains_name}"
    }
    return Persona_Picture.new(@viewport, proc_value, proc_value_process)
  end
  def setup_viewport
    base_width, base_height = @layers[:body].width, @layers[:body].height
    
    viewport_width = base_width
    viewport_height = base_height
    viewport_x = SCREEN_WIDTH - viewport_width
    viewport_y = SCREEN_HEIGHT - viewport_height
    
    @viewport.rect = Rect.new(viewport_x, viewport_y, viewport_width, viewport_height)
    
    @viewport.z = 100
  end
end
class Persona_Picture < Sprite
  def initialize(viewport, proc_value, proc_value_process)
    super(viewport)
    @proc_value = proc_value
    @proc_value_process = proc_value_process
    update
  end
  def width
    return self.bitmap.width
  end
  def height
    return self.bitmap.height
  end
  def setup_image(picture)
    return if @old_picture == picture
    new_image = self.bitmap == nil
    self.bitmap.clear if not new_image
    if picture == "" # if no image provided
      self.visible = false
    else
      begin  
        self.bitmap = Bitmap.new(picture)#RPG::Cache::load_bitmap(picture)
        
        # Center origin on image (the point it uses to set the location of the image)
        self.ox = self.bitmap.width  / 2 
        self.oy = self.bitmap.height / 2 
  
        # Center position of image if we haven't previously given it a location
        if new_image
          self.x = self.bitmap.width   / 2
          self.y = self.bitmap.height  / 2
          # Show image
          self.visible = true
        end
        
      rescue
        # Error
      end
    end
    @old_picture = picture
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    if self.bitmap != nil
      self.bitmap.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    update_value = @proc_value.call(self)
    if @old_proc_value != update_value
      setup_image(@proc_value_process.call(update_value, self))
    end
    @old_proc_value = update_value
  end
end
class Scene_Map
  alias persona_update update
  def update
    if @persona == nil
      @persona = Persona.new
    end
    @persona.update
    persona_update
  end
end