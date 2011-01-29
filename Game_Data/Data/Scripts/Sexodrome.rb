class Sexodrome
  def self.register_timeout
    if @timeout == nil
      #@timeout = Proc.new {|x| $data_common_events[30].trigger }
      @timeout = Proc.new {|x| $game_switches[54] = true }
    end
    $game_system.add_listener(@timeout)
  end
  def self.remove_timeout
    if @timeout
      $game_system.remove_listener(@timeout)
    end
  end
end