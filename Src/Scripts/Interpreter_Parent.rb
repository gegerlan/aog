=begin
Adds parent property to the interpreter.
The parent property contains the parent of the current interpreter running,
i.e. the interpreter which called the common event currently executing.
=end
class Interpreter
  attr_accessor :parent
  alias command_117_pre_parent_pass command_117
  def command_117
    ret = command_117_pre_parent_pass
    @child_interpreter.parent = self
    # Continue
    return ret
  end
end
