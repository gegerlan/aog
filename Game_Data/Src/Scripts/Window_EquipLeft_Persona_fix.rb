=begin
Make it possible to set the base actor used for making the comparing of equipment
=end
class Window_EquipLeft < Window_Base
  def actor=(actor)
    @actor = actor
  end
end