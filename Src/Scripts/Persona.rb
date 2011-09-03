# TODO:
#  * Fix fugly Dog class fix
#  * Animation of fading
#  * Easy hook for persona (maybe)
class Persona < Sprite
  attr_reader :actor
  def initialize(viewport = nil)
    super(viewport)
    self.bitmap = Bitmap.new(640,480)
    @visible = true
    self.z = 9999
    @actor = $game_party.actors[0]
  end
  def self.switch 
    return 128
  end
  def self.duration
    return 10
  end
  def self.visible_opacity
    return 255
  end
  def self.transparent_opacity
    return 50
  end
  def visibility=(visibility)
    if @visible != visibility
      @visible = !!visibility
      self.bitmap.clear if !is_visible?
      #self.update_persona
      @old_armor_set = nil if is_visible? #our old picture was nothing, do an update even if equipment is the same!
      update if is_visible?
    end
  end
  def is_visible?
    return @visible
  end
  def set_transparent(fade)
    self.opacity = !!fade ? 50 : 255
  end
  def is_transparent?
    return self.opacity != 255
  end
  def update
    super
    if !is_visible?
      return
    end
    actor_name = @actor.name
    actor_class_name = $data_classes[@actor.class_id].name
    
    armor_set = @actor.armors.map { |armor| 
      [armor.name, armor.condition] if armor != nil
    }
    
    weapon_set = [@actor.weapon].map{ |weapon| 
      [weapon.name, weapon.condition] if weapon != nil
    }

    shy = @actor.is_shy?
    cuffs = @actor.is_cuffed?    
    
    base_modifiers = []
    base_modifiers << "shy" if shy
    base_modifiers << "cuffs" if cuffs
    
    #todo: make a proper hash
    if weapon_set != @old_weapon_set || 
        armor_set != @old_armor_set || 
        actor_class_name != @old_actor_class_name || 
        actor_name != @old_actor_name ||
        base_modifiers != @old_base_modifiers
      self.bitmap.clear

      modifiers = []
      modifiers += base_modifiers
      
      layers = []
      layers << [actor_name, actor_class_name].join(" ")

      layers += weapon_set if actor_class_name != "Dog" #FIXME!

      layers += armor_set if actor_class_name != "Dog" #FIXME!

      layers.each do |layer|
        next if layer == nil
        
        if layer.is_a?(Array)
          layer_name, layer_condition = layer
        elsif layer.is_a?(String)
          layer_name = layer
        elsif layer.is_a?(Condition_Item)
          layer_name = layer.name
          layer_condition = layer.condition
        else
          return false
        end
        
        # These are listed with the worst first, so when the files are
        # searched for, the worst condition possible will come on top
        # of the return list.
        if layer_condition != nil
          modifiers << "broken" if layer_condition < 25
          modifiers << "torn" if layer_condition < 50
          modifiers << "chipped" if layer_condition < 75
        end
        
        # Try getting actor name + actor class + layer image
        picture_path = get_picture_name([actor_name, actor_class_name, layer_name].join(" "), modifiers)
        # Try getting actor name + layer image
        picture_path = get_picture_name([actor_name, layer_name].join(" "), modifiers) if picture_path == nil
        # Try getting layer image
        picture_path = get_picture_name(layer_name, modifiers) if picture_path == nil
        
        if picture_path != nil
          draw(picture_path)
        else
          print "Unable to find %s" % layer if $DEBUG
        end
      end
      @old_armor_set = armor_set.map { |armor| armor.clone if armor != nil }
      @old_weapon_set = weapon_set.clone
      @old_actor_class_name = actor_class_name
      @old_actor_name = actor_name
      @old_base_modifiers = base_modifiers
    end
  end
  def draw(image_path)
    begin
      bitmap = RPG::Cache.picture(image_path)
      rect = Rect.new(0,0,bitmap.width,bitmap.height)
      self.bitmap.blt(0,0,bitmap,rect)
    rescue Exception => e
      print e if $DEBUG
    end
  end
  def actor=(actor)
    if @actor != actor
      @actor = actor
      update
    end
  end
  def dispose
    super
    @old_armor_set.clear
    @old_weapon_set.clear
    @old_base_modifiers.clear
  end
end
# Extending the default spriteset class for getting the scene map viewport1
class Spriteset_Map
  attr_reader :viewport1
  attr_reader :picture_sprites
end
# Present the persona as a map is loaded
class Scene_Map
  alias persona_update update
  def update
    persona_update
    if $persona == nil
      add_persona
    end
  end
  alias persona_main main  
  def main
    persona_main
    $persona.dispose
    $persona = nil
  end
  alias persona_transfer transfer_player
  def transfer_player
    persona_transfer
    add_persona
  end
  def add_persona
    $persona = Persona.new(@spriteset.viewport1)
    @spriteset.picture_sprites.push($persona)
    $persona.set_transparent($game_player.screen_x > 450)
  end
end
# Add a persona to the equipment menu
class Scene_Equip
  alias persona_main main
  def main
    persona_main
    $persona.dispose
    $persona = nil
  end
  alias persona_update update
  def update
    persona_update
    if $persona == nil
      add_persona
    end
    $persona.update
  end
  def add_persona
    $persona = Persona.new
    $persona.actor = @actor
  end
end
module BlizzABS
  class Controller
    alias persona_check_event_trigger_here check_event_trigger_here
    # Change the persona to transparent if the actor is over 450
    def check_event_trigger_here(triggers)
      persona_check_event_trigger_here(triggers)
      $persona.set_transparent($game_player.screen_x > 450) if $persona != nil
    end
  end
end
class Game_Actor
  # Is the actor shy? Only if no body armor, nudity is not OK and perversion is less than 5
  def is_shy?
    return armor3_id == 0 && $game_switches[89] == FALSE && $game_variables[49] < 5
  end
  # Is the actor cuffed? Only if the weapon worn is 33.
  def is_cuffed?
    return weapon_id == 33
  end
end