module Faceset
  FILENAME_DELIMITER = "_"
  def self.set(actor, index)
    ## Base image
    # Character name
    actor_name = actor.name
    # Class name
    class_name = $data_classes[actor.class_id].name

    ## Modifiers
    modifiers = []
    # Nude
    modifiers << "nude" if actor.is_nude?
    
    ## Generate filename
    filename_parts = []
    filename_parts << actor_name if not actor_name.empty?
    filename_parts << class_name if not class_name.empty?
    filename_parts << modifiers.join("_") if not modifiers.empty?
    filename_parts << "%02d" % index if index.is_a?(Numeric)
    
    return if filename_parts.empty?
    
    filename = filename_parts.join(FILENAME_DELIMITER)
    
    if found_file = get_face_name(filename)
      $game_system.face_graphic = found_file
    else
      $game_system.face_graphic = ""
      print "Unable to find #{filename}" if $DEBUG
    end
  end
end