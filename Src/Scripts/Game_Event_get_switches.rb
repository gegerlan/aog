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
  def get_variables
    variables = []
    for page in @event.pages.reverse
      condition = page.condition
      variables.push(condition.variable_id) if condition.variable_valid
    end
    return variables
  end
end