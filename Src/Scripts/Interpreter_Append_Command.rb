=begin
Adds append_command to interpreter.
Adds the ability to pass an EventCommand to the interpreter, placing the passed
command so it will play at end of the current event command list.
If TRUE is passed, the original Event (map or common event) will have its list
modified until the map is reloaded.
=end
class Interpreter
  def append_command(event_command, destructive = false)
    if !!destructive
      list = @list.clone
    else
      list = @list
    end
    @list = list.insert(-2, event_command)
  end
end
