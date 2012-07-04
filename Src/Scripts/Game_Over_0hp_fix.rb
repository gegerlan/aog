class Game_Party
  def check_map_slip_damage
    for actor in @actors
      if actor.hp > 0 and actor.slip_damage?
        actor.hp -= [actor.maxhp / 100, 1].max
        if actor.hp == 1
          $game_system.se_play($data_system.actor_collapse_se)
        end
        $game_screen.start_flash(Color.new(255,0,0,128), 4)
        #$game_temp.gameover = $game_party.all_dead?
      end
    end
  end
end
class Interpreter
  def command_311
    # Get operate value
    value = operate_value(@parameters[1], @parameters[2], @parameters[3])
    # Process with iterator
    iterate_actor(@parameters[0]) do |actor|
      # If HP are not 0
      if actor.hp > 0
        # Change HP (if death is not permitted, make HP 1)
        if @parameters[4] == false and actor.hp + value <= 0
          actor.hp = 1
        else
          actor.hp += value
        end
      end
    end
    # Determine game over
    #$game_temp.gameover = $game_party.all_dead?
    # Continue
    return true
  end
end