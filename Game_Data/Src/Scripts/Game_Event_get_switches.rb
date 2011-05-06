class Game_Event
  def get_switches
    switches = []
    for page in @event.pages.reverse
      condition = page.condition
      switches.push(condition.switch1_id) if condition.switch1_valid
      switches.push(condition.switch2_id) if condition.switch2_valid
    end
    return switches
  end
end