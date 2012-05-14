class Game_Event < Game_Character
  alias start_nil_check start
  def start
    return if @list.nil?
    start_nil_check
  end
end