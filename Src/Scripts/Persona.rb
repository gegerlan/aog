class Persona_Layer
  def initialize(method, path)
    @method = method
  end
  def find_files(filename, directory)
    dir = get_name_list
    dir += [directory] if directory != nil
    filepath = dir.join("/") + "/" + filename
    files = Dir[filepath]
    if files.empty? && @parent != nil
      directory = @name if directory.empty?
      @parent.find_files(filename, directory)
    else
      files
    end
  end
  
  def setup_image(image_name)
    begin        
      files = find_files(picture)
      
      if files.empty?
        self.visible = false
        return
      end
      
      filepath = files.first
      
      self.bitmap = Bitmap.new(filepath)#RPG::Cache::load_bitmap(picture)
      
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

  def dispose
    if self.bitmap != nil
      self.bitmap.dispose
    end
    super
  end
  
  def update
    #super
  end
end


class Persona
  PERSONA_FOLDER = "Graphics/Persona"
  PERSONA_SETTINGS_EXTENSION = ".settings"
  def initialize(actor = $game_actors[1])
    @viewport = Viewport.new(0,0,640,480) # Create an empty viewport
    @actor = Actor_Persona_Adapter.new(actor)
    @layers = {}
    @@index ||= self.index
    setup_actor
    update
  end
  def update
    @layers.each do |index, layer|
      layer.update
    end
    @viewport.update
  end
  def dispose
    super
  end
  def setup_actor(actor = @actor)
    @actor = actor
    @index = @@index[@actor.name] || {}
    setup_layers
    setup_viewport
  end
  def setup_layers(index = @index, context = @actor)
    index.each do |layer_name, layer_index|
      #@layers[layer_name] = 
      setup_layer(layer_name, layer_index, context)
      if layer_index.is_a?(Hash)
        setup_layers(layer_index, @layers[layer_name.to_sym])
      end
    end
    p @layers
  end
  def setup_layer(layer_name, layer_index, context)
    begin
      method = context.method(layer_name)
      @layers[layer_name.to_sym] = Persona_Layer.new(method, layer_name) if method != nil
    rescue
        
    end
  end
  def setup_viewport
    
  end
  def index
    @@index = rdir(PERSONA_FOLDER).values[0]
  end
  def rdir(path)
    items = {}
    Dir.foreach(path) do |filepath|
      full_path = "#{path}/#{filepath}"
      if File.directory?(full_path)
        items.merge!(rdir(full_path)) if filepath != "." && filepath != ".."
      else
#        items += filepath
      end
    end
    return { File.basename(path) => items }
  end
end

class Actor_Persona_Adapter
  def initialize(actor)
    @actor = actor
  end
  def Face
    return true
  end
  def method_missing(sym, *argz)
    return @actor.__send__ sym, *argz
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