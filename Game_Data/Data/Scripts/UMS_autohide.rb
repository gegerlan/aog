module UMS
  AUTOHIDE_IMAGE = 428
  AUTOHIDE_NAME  = 427
end
class Window_Message < Window_Selectable
  alias ums_terminate_message terminate_message
  def terminate_message     
    if $game_switches[UMS::AUTOHIDE_IMAGE] == true
      $game_system.face_graphic = ""
      @face.opacity = 0
    end
    if $game_switches[UMS::AUTOHIDE_NAME]  == true
      $game_system.name = "" 
    end
    ums_terminate_message
  end
end

class Interpreter
  alias ums_command_end command_end
  def command_end
    ums_command_end
    if @depth == 0 && @main
      $game_system.name = "" 
      $game_system.face_graphic = ""
    end
  end
end