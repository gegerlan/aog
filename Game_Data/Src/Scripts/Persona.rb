# TODO:
#  * Animation of fading
#  * Easy hook for persona (maybe)
#  * Fix issues with persona overlapping text
class Persona < Sprite
  attr_reader :actor
  def initialize(viewport = nil)
    super
    self.bitmap = Bitmap.new(640,480)
    @visible = true
    self.z = 9999
    @actor = $game_party.actors[0]
  end
  def self.switch 
    return 128
  end
  def self.picture_index
    return 2..6
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
    
    shy = @actor.is_shy?
    cuffs = @actor.is_cuffed?
    
    actor_class_name = $data_classes[@actor.class_id].name
    
    armor_set = []
    
    #Order: body armor (3), accessories (4), helmet (2), shield (1)
    [:armor3_id, :armor4_id, :armor2_id, :armor1_id].each do |attr|
      begin
        armor_set << $data_armors[@actor.send attr].name
      rescue
        armor_set << nil
      end
    end
    weapon_set = []
    weapon_set << $data_weapons[@actor.weapon_id].name if @actor.weapon_id != 0
    
    if weapon_set != @old_weapon_set || armor_set != @old_armor_set || actor_class_name != @old_actor_class_name || @actor != @old_actor
      self.bitmap.clear

      layers = []
      layers << [@actor.name, actor_class_name].join(" ")
      
      layers += weapon_set
      
      layers += armor_set
      
      layers.each do |layer|
        next if layer == nil
        
        layer += " shy" if shy
        layer += " cuffs" if cuffs
        
        picture_path = get_picture_name(layer)
        if picture_path != nil
          draw(picture_path)
        else
          print "Unable to find %s" % layer if $DEBUG
        end
      end
      @old_armor_set = armor_set
      @old_weapon_set = weapon_set
      @old_actor_class_name = actor_class_name
      @old_actor = @actor
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
end
class Scene_Map
  alias main_persona main
  def main
    main_persona
    $persona = Persona.new if $persona == nil
  end
end
class Game_Actor < Game_Battler
  alias equip_persona equip
  def equip(equip_type, id)
    equip_persona(equip_type, id)
    $persona.update if $persona != nil
  end
end
module BlizzABS
  class Controller
    alias persona_check_event_trigger_here check_event_trigger_here
    def check_event_trigger_here(triggers)
      persona_check_event_trigger_here(triggers)
      $game_variables[27] == $game_player.screen_y
      $game_variables[28] == $game_player.screen_x
      $persona.set_transparent($game_player.screen_x > 450) if $persona != nil
    end
  end
end
class Scene_Map
  alias persona_transfer_player transfer_player
  def transfer_player
    persona_transfer_player
    $persona.set_transparent($game_player.screen_x > 450) if $persona != nil
  end
end
class Game_Actor
  def is_shy?
    return armor3_id == 0 && $game_switches[89] == FALSE && $game_variables[49] < 5
  end
  def is_cuffed?
    return weapon_id == 33
  end
end
class Scene_Menu
  alias main_menu main
  def main
    if $persona != nil
      visible = $persona.is_visible?
      transparent = $persona.is_transparent?
      $persona.set_transparent(true)
      $persona.visibility = true
      main_menu
      $persona.set_transparent(transparent)
      $persona.visibility = visible
    else
      main_menu
    end
  end
end
class Scene_Equip
  alias main_equip main
  def main
    if $persona != nil
      visible = $persona.is_visible?
      transparent = $persona.is_transparent?
      $persona.set_transparent(false)
      $persona.visibility = true
      actor = $persona.actor
      $persona.actor = $game_party.actors[@actor_index]
      main_equip
      $persona.actor = actor
      $persona.set_transparent(transparent)
      $persona.visibility = visible
    else
      main_equip
    end
  end
end