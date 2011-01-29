class RPS
  # 0 = rock, 1 = paper, 2 = scissors
  def self.result(hand)
    pc = rand(3)
    if hand == pc
      return 0
    end
    return hand == (pc + 2) % 3 ? 1 : -1    
  end
end