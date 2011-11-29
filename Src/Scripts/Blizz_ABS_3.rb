#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Blizz-ABS by Blizzard and winkio
# Version: 2.80
# Type: Advanced Action Battle System
# Date v1.00: 19.04.2007
# Date v1.01: 30.04.2007
# Date v1.02: 17.07.2007
# Date v1.04: 25.07.2007
# Date v1.09: 25.07.2007
# Date v1.20: 29.07.2007
# Date v1.23: 30.07.2007
# Date v1.24:  5.08.2007
# Date v1.60:  5.09.2007
# Date v1.61:  6.09.2007
# Date v1.62:  7.09.2007
# Date v1.63: 11.09.2007
# Date v1.64: 11.09.2007
# Date v1.65: 12.09.2007
# Date v1.66: 10.10.2007
# Date v1.67: 16.10.2007
# Date v1.69: 31.10.2007
# Date v1.70: 13.11.2007
# Date v1.71: 22.11.2007
# Date v1.72: 10.12.2007
# Date v1.73: 11.12.2007
# Date v1.80: 18.12.2007
# Date v1.89: 13.01.2008
# Date v1.95: 29.02.2008
# Date v1.96:  5.03.2008
# Date v1.97: 28.03.2008
# Date v1.98:  5.04.2008
# Date v1.99:  4.08.2008
# Date v2.00:  1.12.2008
# Date v2.01:  1.12.2008
# Date v2.02:  2.12.2008
# Date v2.03:  3.12.2008
# Date v2.10:  4.12.2008
# Date v2.11:  5.12.2008
# Date v2.12:  5.12.2008
# Date v2.13:  6.12.2008
# Date v2.14:  7.12.2008
# Date v2.15:  8.12.2008
# Date v2.20: 13.12.2008
# Date v2.21: 19.12.2008
# Date v2.22: 08.01.2009
# Date v2.23: 25.01.2009
# Date v2.30:  8.04.2009
# Date v2.31:  8.04.2009
# Date v2.50: 20.04.2009
# Date v2.51: 20.04.2009
# Date v2.52: 20.04.2009
# Date v2.53:  2.05.2009
# Date v2.54: 23.05.2009
# Date v2.55: 28.06.2009
# Date v2.56: 29.07.2009
# Date v2.57: 19.08.2009
# Date v2.60: 27.11.2009
# Date v2.70: 28.11.2009
# Date v2.71:  12.5.2010
# Date v2.74:  16.5.2010
# Date v2.79:  20.5.2010
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#                                    PART 3
# 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#   
#  This work is protected by the following license:
# #----------------------------------------------------------------------------
# #  
# #  Creative Commons - Attribution-NonCommercial-ShareAlike 3.0 Unported
# #  ( http://creativecommons.org/licenses/by-nc-sa/3.0/ )
# #  
# #  You are free:
# #  
# #  to Share - to copy, distribute and transmit the work
# #  to Remix - to adapt the work
# #  
# #  Under the following conditions:
# #  
# #  Attribution. You must attribute the work in the manner specified by the
# #  author or licensor (but not in any way that suggests that they endorse you
# #  or your use of the work).
# #  
# #  Noncommercial. You may not use this work for commercial purposes.
# #  
# #  Share alike. If you alter, transform, or build upon this work, you may
# #  distribute the resulting work only under the same or similar license to
# #  this one.
# #  
# #  - For any reuse or distribution, you must make clear to others the license
# #    terms of this work. The best way to do this is with a link to this web
# #    page.
# #  
# #  - Any of the above conditions can be waived if you get permission from the
# #    copyright holder.
# #  
# #  - Nothing in this license impairs or restricts the author's moral rights.
# #  
# #----------------------------------------------------------------------------
# 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
# Information:
# 
#   This script will allow you to create games with an Action Battle System
#   (ABS) (i.e. Zelda). Action Battle System means real time battle on the map.
# 
#   If you don't read the Manual, you will not be able to use many of the great
#   features this ABS supports.
# 
#   You DID NOT get the documentation with Blizz-ABS? Please contact me under
#   the URL provided below.
# 
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# Map_Battler
#------------------------------------------------------------------------------
#  This class serves as superclass for characters that fight on the map and
#  can use pixel movement.
#==============================================================================

class Map_Battler < Game_Character
  
  # setting all accessible variables
  attr_accessor :in_action
  attr_accessor :s_count
  attr_accessor :current_sprite
  attr_accessor :new_combo_sprite
  attr_accessor :weapon_sprite
  attr_accessor :fade_out
  attr_accessor :blend_type
  attr_accessor :opacity
  attr_accessor :battler
  attr_accessor :force_move
  attr_accessor :normal_speed
  attr_accessor :move_speed
  attr_accessor :character_name_org
  attr_accessor :character_name
  attr_accessor :combo
  attr_accessor :always_on_top
  attr_accessor :through
  attr_accessor :direction_fix
  attr_accessor :direction
  attr_accessor :tile_id
  attr_writer   :freeze_action
  attr_writer   :idle_allowed
  attr_reader   :ai
  attr_reader   :direction_fix
  attr_reader   :attacked
  attr_reader   :precondition
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize
    # call superclass method
    super
    # sprite animation name add-on and weapon sprite animation name add-on
    @current_sprite = @weapon_sprite = ''
    # flag for combo sprite
    @new_combo_sprite = false
    # sprite animation counter, penalty counter and action penalty counter
    @attacked = @in_action = 0
    # action freezing flag
    @freeze_action = false
    # pixel rate setting
    @pixel_rate = $game_system.pixel_rate
    # set original character name
    @character_name_org = @character_name
    # create array of moving commands
    @force_move = []
    # precondition
    @precondition = true
    # sprite animation frame data
    @sindex, @stime, @sframes = 0xFFFF, 1, [1]
    # don't allow idle animation
    @idle_allowed = false
  end
  #----------------------------------------------------------------------------
  # update
  #  Checks if everything is ok with the pixel rate.
  #----------------------------------------------------------------------------
  def update
    # update pixel movement rate
    update_pixel_rate
    # if charging up
    if charging?
      # decrease charge counter
      @charge.time -= 1
      # if charged up and not trigger type
      if charged? && !charging?(BlizzABS::CHARGETrigger)
        # execute charged action
        case @charge.action
        when BlizzABS::CHARGEAttack then use_attack
        when BlizzABS::CHARGESkill then use_skill($data_skills[@charge.id])
        when BlizzABS::CHARGEItem then use_item($data_items[@charge.id])
        end
        # reset action
        self.reset_action
      end
    end
    # if performing a combo
    if @combo != nil
      # update the combo
      @combo.update
      # dispose if combo has ended
      if @combo.ended
        @new_combo_sprite = false
        @combo = nil
      end
    end
    # call superclass method
    super
  end
  #----------------------------------------------------------------------------
  # update_combomove
  #  move - the move to execute
  #  Updates movement.
  #----------------------------------------------------------------------------
  def update_combomove(move = nil)
    # if moving commands exist
    move = @combo.moves[0] if move == nil && @combo.moves.size > 0
    # stop if no move
    return if move == nil
    # move
    case move[0]
    when 1 # walk
      case move[1]
      when 1 then move_lower_left
      when 2 then move_down(move[1])
      when 3 then move_lower_right
      when 4 then move_left(move[1])
      when 6 then move_right(move[1])
      when 7 then move_upper_left
      when 8 then move_up(move[1])
      when 9 then move_upper_right
      when false
        # remove from caterpillar
        remove_from_caterpillar if @cindex != nil
        # reset force counter
        @force_movement = 0
      end
    when 2 # turn
      @direction = move[1]
      @stop_count = move[2]
    when 3 # jump
      # get difference between current speed and normal speed
      dplus = @move_speed - @normal_speed
      # set jumping direction
      x, y = BlizzABS::Cache::DirOffsets[move[1]]
      range = move[2]
      # jump into direction with considering running/sneaking
      jump(x*range + x*dplus, y*range + y*dplus, move[1])
    end
  end
  #----------------------------------------------------------------------------
  # update_pixel_rate
  #  Updates the pixel movement rate if necessary.
  #----------------------------------------------------------------------------
  def update_pixel_rate
    # if pixel movement rate different than the stored one
    if @pixel_rate != $game_system.pixel_rate
      # updating factor
      factor = 2.0 ** ($game_system.pixel_rate - @pixel_rate)
      # store new pixel movement rate
      @pixel_rate = $game_system.pixel_rate
      # refresh coordinates
      @x, @y = (@x * factor).to_i, (@y * factor).to_i
      # update memorized coordinates
      @ai.memory.each_value {|a| a.x, a.y = (a.x * factor).to_i, (a.y * factor).to_i}
    end
  end
  #----------------------------------------------------------------------------
  # update_states
  #  Updates status effects in Blizz-ABS.
  #----------------------------------------------------------------------------
  def update_states
    # if battler exists
    if battler != nil
      # check status effect timers
      check_states
      # change status effect timers
      count_states
      # apply additional status effects
      additional_states
    end
  end
  #----------------------------------------------------------------------------
  # check_states
  #  Checks the time counters for the status effects.
  #----------------------------------------------------------------------------
  def check_states
    # remove all counters from states that are gone
    (battler.state_time.keys - battler.states).each {|id|
        battler.state_time.delete(id)}
    # add all counters from new states
    (battler.states - battler.state_time.keys).each {|id|
        battler.state_time[id] = $data_states[id].hold_turn * 40 + 1}
  end
  #----------------------------------------------------------------------------
  # count_states
  #  Changes the state time counters.
  #----------------------------------------------------------------------------
  def count_states
    # check each state
    battler.state_time.each_key {|id|
        # decrease counter if fading state
        battler.state_time[id] -= 1 if $data_states[id].battle_only
        # if 1 second has passed and probability that the state gets removed
        if battler.state_time[id] <= 0 && battler.state_time[id] % 40 == 0 &&
            rand(100) < $data_states[id].auto_release_prob
          # remove state and counter
          battler.remove_state(id)
          battler.state_time.delete(id)
        end}
  end
  #----------------------------------------------------------------------------
  # additional_states
  #  Handles poison and paralyze effects as well as additional status effects.
  #----------------------------------------------------------------------------
  def additional_states
    # temporary variable
    slip_damage = battler.slip_damage?
    # if Tons of Add-ons is there and using Regen Status
    if $tons_version != nil && $tons_version >= 5.98 &&
        $game_system.REGEN_STATUS
      # modify slip damage flag
      slip_damage |= (HP_REGEN_IDS + SP_REGEN_IDS + SP_POISON_IDS).any? {|i|
          battler.states.include?(i)}
    end
    # if not dead, getting slip damage and every second
    if valid? && slip_damage && Graphics.frame_count % 40 == 0
      # apply the slip damage
      slip_damage_effect
    end
    # if old direction fix was stored
    if @old_direction_fix != nil
      # if able to move again
      if self.restriction < 4
        # reset everything
        @direction_fix, @old_direction_fix = @old_direction_fix, nil
      end
    # if paralyzed
    elsif self.restriction == 4
      # store old direction fix and set new direction fix
      @direction_fix, @old_direction_fix = true, @direction_fix
      # reset movement
      @force_move = []
      # reset action if valid and not charging
      self.reset_action if self.valid? && !self.charging?(BlizzABS::CHARGEFreeze)
    end
  end
  #----------------------------------------------------------------------------
  # slip_damage_effect
  #  Applies slip damage effect.
  #----------------------------------------------------------------------------
  def slip_damage_effect
    # store hpdamage and spdamage
    hpdamage, spdamage = battler.hpdamage, battler.spdamage
    # if Tons of Add-ons is there and using Regen Status
    if $tons_version != nil && $tons_version >= 5.98 &&
        $game_system.REGEN_STATUS
      # calculate HP damage
      damage_hp = battler.maxhp / 50
      damage_hp = 1 if damage_hp < 1
      # if HP damaging state
      if !(HP_REGEN_IDS.any? {|i| battler.states.include?(i)}) &&
          battler.slip_damage?
        # decrease HP by 2%
        battler.hp -= damage_hp
      # if HP regenarating state
      elsif HP_REGEN_IDS.any? {|i| battler.states.include?(i)} &&
          !battler.slip_damage?
        # increase HP by 2%
        battler.hp += damage_hp
      end
      # calculate SP damage
      damage_sp = battler.maxsp / 50
      damage_sp = 1 if damage_sp < 1
      # if SP damaging state
      if SP_POISON_IDS.any? {|i| battler.states.include?(i)}
        # decrease SP by 2%
        battler.sp -= damage_sp
      end
      # if SP regenarating state
      if SP_REGEN_IDS.any? {|i| battler.states.include?(i)}
        # increase SP by 2%
        battler.sp += damage_sp
      end
    else
      # decrease HP by 2%
      dam = battler.maxhp / 50
      dam = 1 if dam < 1
      battler.hp -= dam
    end
    # restore hpdamage and spdamage
    battler.hpdamage, battler.spdamage = hpdamage, spdamage
  end
  #----------------------------------------------------------------------------
  # can_act?
  #  Tests if the battler is able to act in any way.
  #----------------------------------------------------------------------------
  def can_act?
    # "can act" if knockback state
    return true if @ai.state == BlizzABS::AI::Knockback
    # can't act if abort state
    return false if @ai.state == BlizzABS::AI::Abort
    # can act if not defending
    return true unless @ai.act.defend?
    # turn toward reference target if it exists
    turn_toward(@ai.target) if @ai.target != nil
    # can't act
    return false
  end
  #----------------------------------------------------------------------------
  # update_behavior
  #  Updates AI controlled behavior. The deriving classes implement the
  #  methods called in this method and they call this method.
  #----------------------------------------------------------------------------
  def update_behavior
    # if not paralyzed
    if self.restriction < 4
      # update AI
      update_ai
      # update action
      update_action
    end
    # set up any force movement
    setup_move
  end
  #----------------------------------------------------------------------------
  # reset_action
  #  Deletes action data.
  #----------------------------------------------------------------------------
  def reset_action
    return if @ai.act.defend? && !@ai.act.ready?
    @ai.state, @ai.target, @charge = BlizzABS::AI::Return, nil, nil
    @ai.act.set
  end
  #----------------------------------------------------------------------------
  # freeze_action
  #  Overriding method to support paralyzed status effect
  #----------------------------------------------------------------------------
  def freeze_action
    return (self.restriction == 4 || @freeze_action || charging? && !charged?)
  end
  #----------------------------------------------------------------------------
  # restriction
  #  Overriding method for easier reference.
  #----------------------------------------------------------------------------
  def restriction
    return 0 if !valid? || battler.dead?
    return 4 if charging?(BlizzABS::CHARGEFreeze)
    return @battler.restriction
  end
  #----------------------------------------------------------------------------
  # battler_id
  #  Overriding method for easier reference.
  #----------------------------------------------------------------------------
  def battler_id
    return (@battler == nil ? 0 : @battler.id)
  end
  #----------------------------------------------------------------------------
  # states
  #  Overriding method for easier reference.
  #----------------------------------------------------------------------------
  def states
    return (@battler == nil ? [] : @battler.states)
  end
  #----------------------------------------------------------------------------
  # set_action
  #  rate - penalty rate in seconds
  #  Set frame penalty counter.
  #----------------------------------------------------------------------------
  def set_action(rate)
    @in_action = rate
  end
  #----------------------------------------------------------------------------
  # attack_can_use?
  #  Determines whether an attack can be used, serves for extension purposes.
  #  It automatically recognizes HP/SP Crush from Tons of Add-ons.
  #----------------------------------------------------------------------------
  def attack_can_use?
    # if Tons is there and using HP/SP Crush and actor
    if $tons_version != nil && $tons_version >= 6.4 &&
        $game_system.HP_SP_CRUSH && self.is_a?(Map_Actor)
      # can it be used
      return @battler.attack_can_use?
    end
    # can be used
    return true
  end
  #----------------------------------------------------------------------------
  # skill_can_use?
  #  id - skill ID
  #  Determines whether a skill can be used, serves for extendable purposes.
  #----------------------------------------------------------------------------
  def skill_can_use?(id)
    return @battler.skill_can_use?(id)
  end
  #----------------------------------------------------------------------------
  # item_can_use?
  #  id - item ID
  #  Determines whether an item can be used, serves for extendable purposes.
  #----------------------------------------------------------------------------
  def item_can_use?(id)
    return $game_party.item_can_use?(id)
  end
  #----------------------------------------------------------------------------
  # use_defend
  #  Processes using a defending action.
  #----------------------------------------------------------------------------
  def use_defend
    setup_sprites(BlizzABS::SPRDefend)
  end
  #----------------------------------------------------------------------------
  # use_attack
  #  Processes using an attack.
  #----------------------------------------------------------------------------
  def use_attack
    # remove last hpdamage and spdamage values
    @battler.hpdamage = @battler.spdamage = 0
    # if battler can use attack and attack was processed with success
    if attack_can_use?
      # default combo id
      combo_id = 0
      # get combo id based on whether the character is an actor or enemy
      if self.is_a?(Map_Enemy)
        combo_id = BlizzABS::Enemies.combo(self.battler.id)
      elsif self.is_a?(Map_Actor)
        combo_id = BlizzABS::Weapons.combo(self.battler.weapon_id)
      end
      # if combo id is valid and not currently in a combo
      if combo_id != 0 && @combo == nil
        # create combo
        @combo = BlizzABS::Combo.new(combo_id, self)
        # return used
        return true
      end
      # execute attack
      result = $BlizzABS.attack_process(self)
      # if used and not charging up
      if result
        # sets everything up for attack sprites
        setup_sprites(BlizzABS::SPRAttack)
        # set frame penalty
        set_action(self.attack_penalty)
        # attack consumption effect
        attack_consumption
        # set usage animation
        set_usage_animation(battler)
        # set up user damage display if necessary
        user_damage_display
        # reset action if attack executed
        self.reset_action
      end
      # used or charging
      return (result || charging?)
    end
    # not used
    return false
  end
  #----------------------------------------------------------------------------
  # use_skill
  #  skill - the skill to be used
  #  Processes using a skill.
  #----------------------------------------------------------------------------
  def use_skill(skill)
    # remove last hpdamage and spdamage values
    @battler.hpdamage = @battler.spdamage = 0
    # if can use the skill
    #p 'USE: ' + skill_can_use?(skill.id).to_s
    if skill_can_use?(skill.id)
      # get combo id
      combo_id = BlizzABS::Skills.combo(skill.id)
      # if combo id is valid and not currently in a combo
      if combo_id != 0 && @combo == nil
        # create combo
        @combo = BlizzABS::Combo.new(combo_id, self)
        # return used
        return true
      end
      # execute skill
      result = $BlizzABS.skillitem_process(self, skill)
      #p 'RESULT: ' + result.to_s
      # effectiveness
      effective = (result || charging? && !charged?)
      #p 'EFFECTIVE: ' + effective.to_s
      # if used or charging up and about to discharge
      if result
        # set frame penalty
        set_action(self.skill_penalty(skill.id))
        # skill consumption effect
        skill_consumption(skill)
        # call common event
        common_event_call(skill)
        # set usage animation
        set_usage_animation(skill)
        # set sprite animation
        set_sprite_animation(BlizzABS::SPRSkill, skill_sprites?, skill)
        # set up user damage display if necessary
        user_damage_display
        # reset action
        self.reset_action
      # if discharged
      elsif charging? && charged?
        # reset action
        self.reset_action
      end
      # effective
      return effective
    end
    # not used
    return false
  end
  #----------------------------------------------------------------------------
  # use_item
  #  item - the item to be used
  #  Processes using an item.
  #----------------------------------------------------------------------------
  def use_item(item)
    # remove last hpdamage and spdamage values
    @battler.hpdamage = @battler.spdamage = 0
    # if can use the item
    if item_can_use?(item.id)
      # get combo id
      combo_id = BlizzABS::Items.combo(item.id)
      # if combo id is valid and not currently in a combo
      if combo_id != 0 && @combo == nil
        # create combo
        @combo = BlizzABS::Combo.new(combo_id, self)
        # return used
        return true
      end
      # execute item
      result = $BlizzABS.skillitem_process(self, item)
      # effectiveness
      effective = (result || charging? && !charged?)
      # if used or charging up and about to discharge
      if result
        # set frame penalty
        set_action(self.item_penalty(item.id))
        # skill consumption effect
        item_consumption(item)
        # call common event
        common_event_call(item)
        # set usage animation
        set_usage_animation(item)
        # set sprite animation
        set_sprite_animation(BlizzABS::SPRItem, item_sprites?, item)
        # set up user damage display if necessary
        user_damage_display
        # reset action
        self.reset_action
      # if discharged
      elsif charging? && charged?
        # reset action
        self.reset_action
      end
      # effective
      return effective
    end
    # not used
    return false
  end
  #----------------------------------------------------------------------------
  # attack_consumption
  #  Processes aftermath of using an attack. Serves for extension purposes.
  #  It automatically recognizes HP/SP Crush from Tons of Add-ons.
  #----------------------------------------------------------------------------
  def attack_consumption
    # if Tons is there and using HP/SP Crush and actor
    if $tons_version != nil && $tons_version >= 6.4 &&
        $game_system.HP_SP_CRUSH && self.is_a?(Map_Actor)
      # store hpdamage and spdamage
      hpdamage, spdamage = @battler.hpdamage, @battler.spdamage
      # get requirements
      reqs = BlizzCFG.hpsp_crush(@battler.weapon_id)
      # HP consumption
      @battler.hp -= reqs[0]
      # SP consumption
      @battler.sp -= reqs[1]
      # restore hpdamage and spdamage
      @battler.hpdamage, @battler.spdamage = hpdamage, spdamage
    end
  end
  #----------------------------------------------------------------------------
  # skill_consumption
  #  skill - the skill that was used
  #  Processes aftermath of using a skill.
  #----------------------------------------------------------------------------
  def skill_consumption(skill)
    # store spdamage
    spdamage = @battler.spdamage
    # SP consumption
    @battler.sp -= @battler.spdamage + skill.sp_cost
    # restore spdamage
    @battler.spdamage = spdamage
    # if using Tons of Add-ons and HP Consuming Skills
    if $tons_version != nil && $tons_version >= 7.2 && $game_system.HP_SKILL
      # store hpdamage
      hpdamage = @battler.hpdamage
      # HP consumption
      @battler.hp -= @battler.hpdamage + skill.hp_cost
      # restore hpdamage
      @battler.hpdamage = hpdamage
    end
  end
  #----------------------------------------------------------------------------
  # item_consumption
  #  item - the item that was used
  #  Processes aftermath of using an item.
  #----------------------------------------------------------------------------
  def item_consumption(item)
    # item consumption if item can be consumed
    $game_party.lose_item(item.id, 1) if item.consumable
  end
  #----------------------------------------------------------------------------
  # common_event_call
  #  object - the skill of item
  #  Runs a common event if supported by the object.
  #----------------------------------------------------------------------------
  def common_event_call(object)
    # if object calls common event
    if object.common_event_id > 0
      # temporary variable
      common_event = $data_common_events[object.common_event_id]
      # setup common event execution
      $game_system.map_interpreter.setup(common_event.list, 0, object.common_event_id)
    end
  end
  #----------------------------------------------------------------------------
  # attack_effect
  #  character - the character that holds attack data (can be projectile)
  #  _battler  - the attacking battler
  #  Executes attack upon a map character.
  #----------------------------------------------------------------------------
  def attack_effect(character, _battler)
    # stop attack if no battler assigned or still invincible
    return false if @battler == nil || @blinking != nil && @blinking > 0
    # stop attack if pressing CTRL in debug mode
    return false if $DEBUG && @ai.group != 0 && Input.press?(Input::CTRL)
    # if defending
    if BlizzABS::Config::FULL_DEFEND && @ai.act.defend?
      # set attacked counter
      self.attacked = $BlizzABS.pixel
      # request damage sprite
      $BlizzABS.util.request_damage_sprite(self, BlizzABS::Cache::TXTDefend)
      # not executed
      return false
    end
    # needed for defend emulation
    @battler.current_action.kind = 0
    # set own battler's action as defend action if necessary
    @battler.current_action.basic = (@ai.act.defend? ? 1 : 0)
    # reset hpdamage and spdamage
    @battler.hpdamage, @battler.spdamage = 0, 0
    # get result
    result = @battler.attack_effect(_battler)
    # if effect processing was executed
    if result || self.damage_display?
      # apply basic effects
      action_effect(_battler)
      # apply action effect if any actual damage done
      alignment_effect(character.ai.group) if self.damage_done?
      # request damage sprite
      $BlizzABS.util.request_damage_sprite(self)
      # reset hpdamage and spdamage
      @battler.hpdamage, @battler.spdamage = 0, 0
      # attack was executed
      result = true
    end
    # send data to obeserver if attacked by actor
    $BlizzABS.AI.observe(_battler, @battler.damage) if _battler.is_a?(Game_Actor)
    # delete own charge data if executed
    @charge = nil if result
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # skill_effect
  #  character - the character that holds skill use (can be projectile)
  #  _battler  - the skill using battler
  #  skill     - the skill
  #  Executes skill use upon a map character.
  #----------------------------------------------------------------------------
  def skill_effect(character, _battler, skill)
    # stop skill if no battler assigned
    return false if @battler == nil
    # stop skill if pressing CTRL in debug mode
    return false if $DEBUG && @ai.group != 0 && Input.press?(Input::CTRL)
    # reset own battler's action
    @battler.current_action.kind = @battler.current_action.basic = 0
    # reset hpdamage and spdamage
    @battler.hpdamage, @battler.spdamage = 0, 0
    # get result
    result = @battler.skill_effect(_battler, skill)
    # if effect processing was executed
    if result || self.damage_display?
      # apply basic effects
      action_effect(skill)
      # apply action effect if any actual damage done
      alignment_effect(character.ai.group) if self.damage_done?
      # request damage sprite
      $BlizzABS.util.request_damage_sprite(self)
      # reset hpdamage and spdamage
      @battler.hpdamage, @battler.spdamage = 0, 0
      # attack was executed
      result = true
    end
    # send data to obeserver if attacked by actor
    $BlizzABS.AI.observe(_battler, @battler.damage) if _battler.is_a?(Game_Actor)
    # delete own charge data if executed
    @charge = nil if result
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # item_effect
  #  character - the character that holds item use (can be projectile)
  #  item      - the item
  #  Executes item use upon a map character.
  #----------------------------------------------------------------------------
  def item_effect(character, item)
    # stop item if no battler assigned
    return false if @battler == nil 
    # stop item if pressing CTRL in debug mode
    return false if $DEBUG && @ai.group != 0 && Input.press?(Input::CTRL)
    # reset own battler's action
    @battler.current_action.kind = @battler.current_action.basic = 0
    # reset hpdamage and spdamage
    @battler.hpdamage, @battler.spdamage = 0, 0
    # get result
    result = @battler.item_effect(item)
    # if effect processing was executed
    if result || self.damage_display?
      # apply basic effects
      action_effect(item)
      # apply action effect if any actual damage done
      alignment_effect(character.ai.group) if self.damage_done?
      # request damage sprite
      $BlizzABS.util.request_damage_sprite(self)
      # reset hpdamage and spdamage
      @battler.hpdamage, @battler.spdamage = 0, 0
      # attack was executed
      result = true
    end
    # delete own charge data if executed
    @charge = nil if result
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # alignment_effect
  #  group - the group to which the character belongs to
  #  Applies alignment changes.
  #----------------------------------------------------------------------------
  def alignment_effect(group)
    # if not already negatively aligned
    if !(@ai.negative + @ai.neutral).include?(group)
      # add negative group
      @ai.negative.push(group)
      # mark this battler with altered alignment
      @ai.altered_alignment = true
    end
  end
  #----------------------------------------------------------------------------
  # damage_display?
  #  Checks if there is any damage to display.
  #----------------------------------------------------------------------------
  def damage_display?
    return (@battler.hpdamage != 0 || @battler.spdamage != 0 ||
        @battler.damage.is_a?(Numeric))
  end
  #----------------------------------------------------------------------------
  # damage_done?
  #  Checks if there is any actual damage to display.
  #----------------------------------------------------------------------------
  def damage_done?
    return (@battler.hpdamage > 0 || @battler.spdamage > 0 ||
        @battler.damage.is_a?(Numeric) && @battler.damage >= 0)
  end
  #----------------------------------------------------------------------------
  # user_damage_display
  #  Sets up damage display for the user if HP or SP have changed.
  #----------------------------------------------------------------------------
  def user_damage_display
    # if any HP or SP change
    if @battler.hpdamage != 0 || @battler.spdamage != 0
      # request damage sprite
      $BlizzABS.util.request_damage_sprite(self)
    end
    # reset hpdamage and spdamage
    @battler.hpdamage, @battler.spdamage = 0, 0
  end
  #----------------------------------------------------------------------------
  # charging?
  #  type - charge type
  #  Checks whether charging up.
  #----------------------------------------------------------------------------
  def charging?(type = nil)
    return (@charge != nil && (type == nil || type == @charge.type))
  end
  #----------------------------------------------------------------------------
  # charged?
  #  Checks whether charged up.
  #----------------------------------------------------------------------------
  def charged?
    return @charge.charged?
  end
  #----------------------------------------------------------------------------
  # setup_charge
  #  object - battler (for attack), skill or item
  #  charge - charge data
  #  Sets up the appropriate data for charging.
  #----------------------------------------------------------------------------
  def setup_charge(object, charge)
    # get data depending on action to be executed
    case object
    when Map_Battler then action, id = BlizzABS::CHARGEAttack, 0
    when RPG::Skill then action, id = BlizzABS::CHARGESkill, object.id
    when RPG::Item then action, id = BlizzABS::CHARGEItem, object.id
    end
    # setup charge data
    @charge = BlizzABS::ChargeData.new(charge[0], charge[1], action, id)
  end
  #----------------------------------------------------------------------------
  # set_usage_animation
  #  object - the battler, skill or item
  #  Sets usage animation
  #----------------------------------------------------------------------------
  def set_usage_animation(object)
    # set usage animation ID if ANIMATIONS is turned on
    @animation_id = object.animation1_id if BlizzABS::Config::ANIMATIONS
  end
  #----------------------------------------------------------------------------
  # set_sprite_animation
  #  name     - spriteset base name
  #  extended - flag to determine whether to add or not the object.id
  #  object   - the skill or item
  #  Processes using a skill.
  #----------------------------------------------------------------------------
  def set_sprite_animation(name, extended, object)
    # setup sprite extension
    setup_sprites(extended ? name + object.id.to_s : name)
  end
  #----------------------------------------------------------------------------
  # action_effect
  #  object - the battler, skill or item
  #  Applies some basic action effects.
  #----------------------------------------------------------------------------
  def action_effect(object)
    # if damage dealt
    if @battler.hpdamage > 0 || @battler.spdamage > 0
      # set attacked counter
      self.attacked = $BlizzABS.pixel
    end
    # set attacked enemy animation ID if ANIMATIONS is turned on
    @animation_id = object.animation2_id if BlizzABS::Config::ANIMATIONS
  end
  #----------------------------------------------------------------------------
  # valid?
  #  Checks if the assigned battler exists.
  #----------------------------------------------------------------------------
  def valid?
    return (self.battler != nil)
  end
  #----------------------------------------------------------------------------
  # pattern
  #  Overriding method for accessing the pattern number of the spriteset.
  #----------------------------------------------------------------------------
  def pattern
    # if not in action and jumping and turned on JUMPING_SPRITES
    if self.in_action == 0 && jumping? && jumping_sprites?
      # pattern 1 if jumping up, 3 if falling down again else 2
      return (@jump_count > @jump_peak + 1 ? 1 :
          (@jump_count < @jump_peak - 1 ? 3 : 2))
    end
    # if animating and either in action and not defending or charging
    if (in_action > 0 && !@ai.act.defend? || charging?) &&
        @sindex < @sframes.size && @sframes[@sindex] > 0
      # return sprite animation modified pattern
      return @sindex 
    end
    # return normal pattern if not in action
    return @pattern
  end
  #----------------------------------------------------------------------------
  # pattern_size
  #  Gets the altered pattern_size
  #----------------------------------------------------------------------------
  def pattern_size
    # if in action or charging and animating
    if (in_action > 0 || charging?) && @sindex < @sframes.size &&
        @sframes[@sindex] > 0
      # return sprite animation modified pattern
      return @sframes.size
    end
    # return normal pattern if not in action
    return @pattern_size
  end
  #----------------------------------------------------------------------------
  # attack_penalty
  #  Returns the penalty for the attack.
  #----------------------------------------------------------------------------
  def attack_penalty
    return 0
  end
  #----------------------------------------------------------------------------
  # skill_penalty
  #  id - skill ID
  #  Returns the penalty for the skill.
  #----------------------------------------------------------------------------
  def skill_penalty(id)
    # get skill penalty
    penalty = BlizzABS::Skills.penalty(id)
    # limit is sum of all animation frames if using action sprites
    limit = (action_sprites? ? BlizzABS::Skills.frames(id).sum : 0)
    # limit penalty
    return (penalty < limit ? limit : penalty)
  end
  #----------------------------------------------------------------------------
  # item_penalty
  #  id - item ID
  #  Returns the penalty for the item.
  #----------------------------------------------------------------------------
  def item_penalty(id)
    # get item penalty
    penalty = BlizzABS::Items.penalty(id)
    # limit is sum of all animation frames if using action sprites
    limit = (action_sprites? ? BlizzABS::Items.frames(id).sum : 0)
    # limit penalty
    return (penalty < limit ? limit : penalty)
  end
  #----------------------------------------------------------------------------
  # sprite_animation_setup
  #  Processes the sprite-animation timing.
  #----------------------------------------------------------------------------
  def sprite_animation_setup
    # if not Scene_Map, spriteset doesn't exist, not valid or no action sprites
    if !$scene.is_a?(Scene_Map) || $scene.spriteset == nil || !valid? ||
        !action_sprites?
      # stop
      return
    end
    # if defending
    if @ai.act.defend?
      # set spriteset name add-ons
      @current_sprite, @weapon_sprite = BlizzABS::SPRDefend, ''
      # set spriteset name
      @character_name = @character_name_org + @current_sprite
    # spriteset name add-on exists
    elsif @current_sprite != '' && @character_name_org != ''
      # decrease frame timer
      @sframes[@sindex] -= 1
      # increase frame index if this frame is over
      @sindex += 1 if @sframes[@sindex] <= 0
      # if animation expired
      if @sindex >= @sframes.size
        # reset sprites
        reset_sprites
        # set the index back
        @sindex = 0
      else
        # set spriteset name
        @character_name = @character_name_org + @current_sprite
      end
    else
      # reset sprites
      reset_sprites
    end
    # if sprite extension doesn't exist already
    if @current_sprite == '' && @character_name_org != ''
      # set up movement sprite handling
      sprite_movement_animation_setup
    end
  end
  #----------------------------------------------------------------------------
  # sprite_movement_animation_setup
  #  Sets up movement sprite handling.
  #----------------------------------------------------------------------------
  def sprite_movement_animation_setup
    # if jumping and turned on JUMPING_SPRTES
    if jumping_sprites? && self.jumping?
      # set spriteset name
      @character_name = @character_name_org + BlizzABS::SPRJumping
    # if running and turned on RUNNING_SPRTES
    elsif running_sprites? && (self.moving? || Input.dir8 != 0) &&
        self.running? && self.attacked <= 0
      # set spriteset name
      @character_name = @character_name_org + BlizzABS::SPRRunning
    # if sneaking and turned on SNEAKING_SPRTES
    elsif sneaking_sprites? && (self.moving? || Input.dir8 != 0) &&
        self.sneaking? && self.attacked <= 0
      # set spriteset name
      @character_name = @character_name_org + BlizzABS::SPRSneaking
    # if idle and using idle sprites
    elsif self.idle? && idle_sprites?
      # set spriteset name
      @character_name = @character_name_org + BlizzABS::SPRIdle
    # if charging
    elsif self.charging? && charge_sprites?
      # setup charge sprites
      setup_charge_sprites
    end
  end
  #----------------------------------------------------------------------------
  # action_sprites?
  #  Checks if action sprites can be used.
  #----------------------------------------------------------------------------
  def action_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # weapon_sprites?
  #  Checks if weapon sprites can be used.
  #----------------------------------------------------------------------------
  def weapon_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # skill_sprites?
  #  Checks if skill sprites can be used.
  #----------------------------------------------------------------------------
  def skill_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # item_sprites?
  #  Checks if item sprites can be used.
  #----------------------------------------------------------------------------
  def item_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # jumping_sprites?
  #  Checks if jumping sprites can be used.
  #----------------------------------------------------------------------------
  def jumping_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # running_sprites?
  #  Checks if running sprites can be used.
  #----------------------------------------------------------------------------
  def running_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # sneaking_sprites?
  #  Checks if sneaking sprites can be used.
  #----------------------------------------------------------------------------
  def sneaking_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # idle_sprites?
  #  Checks if idle sprites can be used.
  #----------------------------------------------------------------------------
  def idle_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # charge_sprites?
  #  Checks if charge sprites can be used.
  #----------------------------------------------------------------------------
  def charge_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # charge_weapon_sprites?
  #  Checks if charge weapon sprites can be used.
  #----------------------------------------------------------------------------
  def charge_weapon_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # charge_skill_sprites?
  #  Checks if charge skill sprites can be used.
  #----------------------------------------------------------------------------
  def charge_skill_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # charge_item_sprites?
  #  Checks if charge item sprites can be used.
  #----------------------------------------------------------------------------
  def charge_item_sprites?
    return false
  end
  #----------------------------------------------------------------------------
  # setup_sprites
  #  type - the spriteset extension
  #  Sets up everything used for sprite combination.
  #----------------------------------------------------------------------------
  def setup_sprites(type)
    # stop if animations are not active
    return unless action_sprites?
    # set current sprite extension
    @current_sprite = type
    # default animation frames
    data = BlizzABS::Cache::FramesDefault.clone
    # if attack sprites
    if type == BlizzABS::SPRAttack
      # set up attack sprites
      data = setup_attack_sprites
    # if skill sprites
    elsif type[0, 4] == BlizzABS::SPRSkill
      # get frame animation data
      data = BlizzABS::Skills.frames(type[4, type.size - 4].to_i)
    # if item sprites
    elsif type[0, 4] == BlizzABS::SPRItem
      # get frame animation data
      data = BlizzABS::Items.frames(type[4, type.size - 4].to_i)
    end
    # setup frames
    setup_frames(data)
  end
  #----------------------------------------------------------------------------
  # setup_charge_sprites
  #  type - the spriteset extension
  #  Sets up everything used for sprite combination.
  #----------------------------------------------------------------------------
  def setup_charge_sprites
    # spriteset name add-on
    @current_sprite = BlizzABS::SPRCharge
    # default animation frames
    data = BlizzABS::Cache::FramesDefault.clone
    # if charging attack and charge attack active
    if @charge.action == BlizzABS::CHARGEAttack && charge_weapon_sprites?
      # set up charge attack sprites
      data = setup_charge_attack_sprites
    # if charging skill and skill charge active
    elsif @charge.action == BlizzABS::CHARGESkill && charge_skill_sprites?
      # spriteset name add-on
      @current_sprite = BlizzABS::SPRSkill + BlizzABS::SPRCharge +
          @charge.id.to_s
      # get frame animation data
      data = BlizzABS::Skills.charge_frames(@charge.id)
    # if charging item and item charge active
    elsif @charge.action == BlizzABS::CHARGEItem && charge_item_sprites?
      # spriteset name add-on
      @current_sprite = BlizzABS::SPRItem + BlizzABS::SPRCharge +
          @charge.id.to_s
      # get frame animation data
      data = BlizzABS::Items.charge_frames(@charge.id)
    end
    # set spriteset name
    @character_name = @character_name_org + @current_sprite
    # setup frames
    setup_frames(data)
  end
  #----------------------------------------------------------------------------
  # reset_sprites
  #  Resets sprite combination names.
  #----------------------------------------------------------------------------
  def reset_sprites
    # reset spriteset name
    @character_name = @character_name_org
    # reset spriteset name add-on
    @current_sprite = @weapon_sprite = ''
  end
  #----------------------------------------------------------------------------
  # setup_frames
  #  data - frame animation timer data
  #  Sets up the basics used for charge sprite animation.
  #----------------------------------------------------------------------------
  def setup_frames(data)
    @sindex, @stime, @sframes = 0, data.sum, data
  end
  #----------------------------------------------------------------------------
  # attacked=
  #  val - number
  #  Sets the attacked counter and resets all sprites.
  #----------------------------------------------------------------------------
  def attacked=(val)
    # reset sprites
    @current_sprite = @weapon_sprite = ''
    # set attacked counter and reset sprite counter
    @attacked, @sindex = val, 0xFFFF
  end
  #----------------------------------------------------------------------------
  # moving?
  #  Determines if the character is moving.
  #----------------------------------------------------------------------------
  def moving?
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # return if player is moving
    return (@real_x != @x * 128 / pix || @real_y != @y * 128 / pix)
  end
  #----------------------------------------------------------------------------
  # moveto
  #  x - x-coordinate
  #  y - y-coordinate
  #  Instant moving.
  #----------------------------------------------------------------------------
  def moveto(x, y)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # calculate new coordinates
    @x = (x * pix) % ($game_map.width * pix)
    @y = (y * pix) % ($game_map.height * pix)
    @real_x, @real_y = @x * 128 / pix, @y * 128 / pix
    # reset pre-lock direction
    @prelock_direction = 0
  end
  #--------------------------------------------------------------------------
  # move_direction
  #  d - direction
  #  Moves into x or y direction. (pixel movement)
  #--------------------------------------------------------------------------
  def move_direction(d)
    # x and y offsets depending on direction
    ox, oy = BlizzABS::Cache::DirOffsets[d]
    # if passable
    if passable?(@x, @y, d)
      # set new coordinates
      @x += ox
      @y += oy
      # increase steps
      increase_steps
      # moved
      return true
    end
    # check touched events
    check_event_trigger_touch(@x + ox, @y + oy)
    # not moved
    return false
  end
  #--------------------------------------------------------------------------
  # move_down
  #  turn_enabled - flag that determines whether to turn in moving direction
  #  Moves. (pixel movement)
  #--------------------------------------------------------------------------
  def move_down(turn_enabled = true)
    # turn if turn enabled
    turn_down if turn_enabled
    # move into direction
    return move_direction(2)
  end
  #--------------------------------------------------------------------------
  # move_left
  #  turn_enabled - flag that determines whether to turn in moving direction
  #  Moves. (pixel movement)
  #--------------------------------------------------------------------------
  def move_left(turn_enabled = true)
    # turn if turn enabled
    turn_left if turn_enabled
    # move into direction
    return move_direction(4)
  end
  #--------------------------------------------------------------------------
  # move_right
  #  turn_enabled - flag that determines whether to turn in moving direction
  #  Moves. (pixel movement)
  #--------------------------------------------------------------------------
  def move_right(turn_enabled = true)
    # turn if turn enabled
    turn_right if turn_enabled
    # move into direction
    return move_direction(6)
  end
  #--------------------------------------------------------------------------
  # move_up
  #  turn_enabled - flag that determines whether to turn in moving direction
  #  Moves. (pixel movement)
  #--------------------------------------------------------------------------
  def move_up(turn_enabled = true)
    # turn if turn enabled
    turn_up if turn_enabled
    # move into direction
    return move_direction(8)
  end
  #----------------------------------------------------------------------------
  # get_diagonal_movement_data
  #  dx - direction on x-axis
  #  dy - direction on y-axis
  #  Calculates whether diagional movement can be executed or not. If it can't
  #  be executed, an alternative traditional movement is calculated.
  #----------------------------------------------------------------------------
  def get_diagonal_movement_data(dx, dy)
    # get pixel movement and offsets depending on directions
    pix, ox, oy = $BlizzABS.pixel, (dx == 4 ? -1 : 1), (dy == 2 ? 1 : -1)
    # initialize and test first y direction
    move, x_move, y_move = false, false, passable?(@x, @y, dy)
    # if first y direction works
    if y_move
      # test second x direction
      other_x_move = passable?(@x, @y + oy, dx)
      # if pixel movement and second x direction works
      if pix > 1 && other_x_move
        # moving diagonally
        move = true
      # if pixel movement XOR second x direction
      elsif (pix > 1) != other_x_move
        # test first x direction
        x_move = passable?(@x, @y, dx)
        # if first x direction works
        if x_move
          # if second y direction works
          if passable?(@x + ox, @y, dy)
            # moving diagonally
            move = true
          else
            # moving into facing direction
            case @direction
            when dx, 10 - dx then x_move = false
            when dy, 10 - dy then y_move = false
            end
          end
        end
      # if facing in x direction
      elsif @direction != dx && @direction != 10 - dx
        # test x direction
        x_move = passable?(@x, @y, dx)
        # moving in x direction if x direction works
        y_move = false if x_move
      end
    else
      # test x direction
      x_move = passable?(@x, @y, dx)
      # moving diagonally if pixel movement and other direction works
      move = true if pix > 1 && x_move && passable?(@x + ox, @y, dy)
    end
    # result
    return [move, x_move, y_move]
  end
  #----------------------------------------------------------------------------
  # move_diagonal
  #  dx - x direction
  #  dy - y direction
  #  Moves diagonally, this method is generic. (pixel movement)
  #----------------------------------------------------------------------------
  def move_diagonal(dx, dy)
    # get offsets depending on directions
    ox, oy = (dx == 4 ? -1 : 1), (dy == 2 ? 1 : -1)
    # get flags for movement
    move, x_move, y_move = get_diagonal_movement_data(dx, dy)
    # if not direction fixed
    unless @direction_fix
      # if moving diagonal
      if move
        # set direction
        @direction = (@direction == 10 - dx ? dx : @direction == 10 - dy ? dy :
            @direction)
      # if moving left
      elsif x_move
        # set direction
        @direction = dx
      # if moving down
      elsif y_move
        # set direction
        @direction = dy
      end
    end
    # if any movement applies
    if move || x_move || y_move
      # set new coordinates if appropriate movement
      @x += ox if move || x_move
      @y += oy if move || y_move
      # increase steps
      increase_steps
      # moved
      return true
    end
    # check touched events
    check_event_trigger_touch(@x + ox, @y + oy)
    # not moved
    return false
  end
  #----------------------------------------------------------------------------
  # move_lower_left
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_lower_left
    return move_diagonal(4, 2)
  end
  #----------------------------------------------------------------------------
  # move_lower_right
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_lower_right
    return move_diagonal(6, 2)
  end
  #----------------------------------------------------------------------------
  # move_upper_left
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_upper_left
    return move_diagonal(4, 8)
  end
  #----------------------------------------------------------------------------
  # move_upper_right
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_upper_right
    return move_diagonal(6, 8)
  end
  #----------------------------------------------------------------------------
  # move_toward
  #  character    - the character
  #  turn_enabled - whether the character should turn or not
  #  Moves towards a character. (pixel movement)
  #----------------------------------------------------------------------------
  def move_toward(character, turn_enabled = true)
    # get pixel movement rate and calculate differences in x and y
    pix, dx, dy = $BlizzABS.pixel, @x - character.x, @y - character.y
    # set movement route depending on the x and y differences
    if dx < 0 && dy.abs <= pix / 2 # is right
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[6])
    elsif dx > 0 && dy.abs <= pix / 2 # is left
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[4])
    elsif dx.abs <= pix / 2 && dy < 0 # is down
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[2])
    elsif dx.abs <= pix / 2 && dy > 0 # is up
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[8])
    elsif dx > 0 && dy > 0 # is up left
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[7])
    elsif dx > 0 && dy < 0 # is down left
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[1])
    elsif dx < 0 && dy > 0 # is up right
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[9])
    elsif dx < 0 && dy < 0 # is down right
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[3])
    end
  end
  #----------------------------------------------------------------------------
  # move_away_from
  #  character    - the character
  #  turn_enabled - whether the character should turn or not
  #  Moves away from a character. (pixel movement)
  #----------------------------------------------------------------------------
  def move_away_from(character, turn_enabled = true)
    # get pixel movement rate and calculate differences in x and y
    pix, dx, dy = $BlizzABS.pixel, @x - character.x, @y - character.y
    # set movement route depending on the x and y differences
    if dx < 0 && dy.abs <= pix / 2 # is right
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[4])
    elsif dx > 0 && dy.abs <= pix / 2 # is left
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[6])
    elsif dx.abs <= pix / 2 && dy < 0 # is down
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[8])
    elsif dx.abs <= pix / 2 && dy > 0 # is up
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[2])
    elsif dx > 0 && dy > 0 # is up left
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[3])
    elsif dx > 0 && dy < 0 # is down left
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[9])
    elsif dx < 0 && dy > 0 # is up right
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[1])
    elsif dx < 0 && dy < 0 # is down right
      @force_move.push((turn_enabled ? BlizzABS::Cache::TDirs :
          BlizzABS::Cache::FDirs)[7])
    end
  end
  #----------------------------------------------------------------------------
  # move_away_random
  #  character    - the character
  #  turn_enabled - whether the character should turn or not
  #  distance     - distance
  #  Moves away from a character randomly. (pixel movement)
  #----------------------------------------------------------------------------
  def move_away_random(character, turn_enabled = true, distance = 1)
    # calculate differences in x and y
    dx, dy = @real_x - character.real_x, @real_y - character.real_y
    # array of directions
    dir = ($game_system._8_way ? BlizzABS::Cache::Dir8 : BlizzABS::Cache::Dir4)
    # determines where can't move according to the x and y differences
    if dx > 0 && dy > 0 # character is up left
      dir = dir - BlizzABS::Cache::NoDirsUpLeft
    elsif dx > 0 && dy < 0 # character is down left
      dir = dir - BlizzABS::Cache::NoDirsDownLeft
    elsif dx < 0 && dy > 0 # character is up right
      dir = dir - BlizzABS::Cache::NoDirsUpRight
    elsif dx < 0 && dy < 0 # character is down right
      dir = dir - BlizzABS::Cache::NoDirsDownRight
    elsif dx < 0 && dy == 0 # character is right
      dir = dir - BlizzABS::Cache::NoDirsRight
    elsif dx > 0 && dy == 0 # character is left
      dir = dir - BlizzABS::Cache::NoDirsLeft
    elsif dx == 0 && dy < 0 # character is down
      dir = dir - BlizzABS::Cache::NoDirsDown
    elsif dx == 0 && dy > 0 # character is up
      dir = dir - BlizzABS::Cache::NoDirsUp
    end
    # get necessary data
    pix, dir = $BlizzABS.pixel, dir[rand(dir.size)]
    distance *= pix
    # if turn enabled
    if turn_enabled
      # add to movement commands
      distance.to_i.times {@force_move.push(BlizzABS::Cache::TDirs[dir])}
    else
      # add to movement commands
      distance.to_i.times {@force_move.push(BlizzABS::Cache::FDirs[dir])}
    end
  end
  #----------------------------------------------------------------------------
  # overriding move_type_custom
  #----------------------------------------------------------------------------
  alias move_type_custom_blizzabs_later move_type_custom
  def move_type_custom
    # store current index and list
    index, list = @move_route_index, @move_route.list.clone
    # call original method
    move_type_custom_blizzabs_later
    # abort if not move route defined
    return if @move_route == nil && list.size == 0
    # create execution range
    if @move_route_index < index && @move_route_index < list.size-1
      range = index..@move_route_index
    else
      range = index..(list.size-1)
    end
    # set new normal speed if speed changing command
    @normal_speed = @move_speed if range.any? {|i| list[i] != nil && list[i].code == 29}
    # if enemy
    if self.is_a?(Map_Enemy)
      # if spriteset changing command
      @character_name_org = @character_name if range.any? {|i| list[i].code == 41}
      # exit method if jumping or moving
      return if jumping? || moving?
      # if move route exists, basic movement, not skippable and same index
      if index == @move_route_index && index < list.size &&
          list[index].code <= 14 && !@move_route.skippable
        # increase move_route_index
        @move_route_index += 1
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_move
  #  Processes moving progress. (pixel movement)
  #----------------------------------------------------------------------------
  def update_move
    # get pixel movement rate and moving distance
    pix, distance = $BlizzABS.pixel, 2 ** @move_speed
    fx, fy = @x * 128 / pix, @y * 128 / pix
    # set new coordinates
    if fx < @real_x
      rx = @real_x - distance
      @real_x = (rx > fx ? rx : fx)
    elsif fx > @real_x
      rx = @real_x + distance
      @real_x = (rx < fx ? rx : fx)
    end
    if fy < @real_y
      ry = @real_y - distance
      @real_y = (ry > fy ? ry : fy)
    elsif fy > @real_y
      ry = @real_y + distance
      @real_y = (ry < fy ? ry : fy)
    end
    # if walking
    if @walk_anime
      # increase anime_count
      @anime_count += 1.5
    # if standing
    elsif @step_anime
      # increase anime_count
      @anime_count += 1
    end
  end
  #----------------------------------------------------------------------------
  # update_jump
  #  Processes jumping progress. (pixel movement)
  #----------------------------------------------------------------------------
  def update_jump
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # decrease jump count
    @jump_count -= 1
    # set new coordinates
    @real_x = (@real_x * @jump_count + @x * 128 / pix) / (@jump_count + 1)
    @real_y = (@real_y * @jump_count + @y * 128 / pix) / (@jump_count + 1)
  end
  #----------------------------------------------------------------------------
  # ignored_jump_coordinates
  #  Returns the correct real_x and real_y without the jumping offset. It is
  #  being used to ignore jumping distance between allies to prevent separation
  #  from the caterpillar.
  #----------------------------------------------------------------------------
  def ignored_jump_coordinates
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # calculate coordinates back
    real_x = (@real_x * (@jump_count + 1) - @x * 128 / pix) / @jump_count
    real_y = (@real_y * (@jump_count + 1) - @y * 128 / pix) / @jump_count
    # return the result
    return [real_x, real_y]
  end
  #----------------------------------------------------------------------------
  # jump
  #  x - x-coordinate
  #  y - y-coordinate
  #  Jumps. (pixel movement)
  #----------------------------------------------------------------------------
  def jump(x_plus, y_plus, d = nil)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if jumping onto another tile
    if x_plus != 0 or y_plus != 0
      # if horizontal distance is longer
      if x_plus.abs > y_plus.abs
        # turn left or right
        x_plus < 0 ? turn_left : turn_right
      else
        # turn up or down
        y_plus < 0 ? turn_up : turn_down
      end
    end
    # if direction unknown
    if d == nil
      # determine direction depending plus values
      if x_plus > 0 && y_plus > 0 # jumping down right
        d = 3
      elsif x_plus > 0 && y_plus < 0 # jumping up left
        d = 9
      elsif x_plus < 0 && y_plus > 0 # jumping down right
        d = 1
      elsif x_plus < 0 && y_plus < 0 # jumping up left
        d = 7
      elsif x_plus < 0 && y_plus == 0 # jumping left
        d = 4
      elsif x_plus > 0 && y_plus == 0 # jumping right
        d = 6
      elsif x_plus == 0 && y_plus < 0 # jumping up
        d = 8
      elsif x_plus == 0 && y_plus > 0 # jumping down
        d = 2
      end
    end
    # straighten
    straighten
    # find new coordinates
    nx, ny = @x + x_plus * pix, @y + y_plus * pix
    # if can't jump to new location
    if jump_passable?(nx, ny, d) && $game_map.jump_passable?(@x, @y, nx, ny)
      # set new coordinates
      @x, @y = nx, ny
    else
      # reset coordinates
      x_plus = y_plus = 0
    end
    # set jump peak
    @jump_peak = 10 + Math.hypot(x_plus, y_plus).round - @move_speed
    # set jump count and stop count
    @jump_count, @stop_count = @jump_peak * 2, 0
    # jumped if x and y plus are 0
    return (x_plus != 0 || y_plus != 0)
  end
  #----------------------------------------------------------------------------
  # passable?
  #  x - x-coordinate
  #  y - y-coordinate
  #  d - direction
  #  Checks the passability. (pixel movement)
  #----------------------------------------------------------------------------
  def passable?(x, y, d)
    # calculate new coordinates
    nx = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    ny = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    # impassable if standing on impassable tile
    return false unless $game_map.self_passable?(x, y, d, self)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if impassable in all directions
    unless $game_map.direction_passable?(nx, ny, 10 - d) &&
        $game_map.direction_passable?(nx, ny+pix-1, 10 - d) &&
        $game_map.direction_passable?(nx+pix-1, ny, 10 - d) &&
        $game_map.direction_passable?(nx+pix-1, ny+pix-1, 10 - d)
      # impassable
      return false
    end
    # new real coordinates
    rx, ry = nx * 128 / pix, ny * 128 / pix
    # get all events
    events = $game_map.events_only
    # rectangle
    rect = Rect.new(nx, ny, pix, pix)
    # if any event in the way
    if events.any? {|event|
        !event.through && event.character_name != '' &&
        $BlizzABS.util.rect_intersection(rect,
            Rect.new(event.x * pix, event.y * pix, pix, pix))}
      # impassable
      return false
    end
    # if any battler that is not self or an event in the way
    if ($game_map.events.values - [self] - events).any? {|battler|
        !battler.through && battler.character_name != '' &&
        $BlizzABS.util.rect_intersection(rect,
            Rect.new(battler.x, battler.y, pix, pix))}
      # impassable
      return false
    end
    # passable so far
    return true
  end
  #----------------------------------------------------------------------------
  # bush_depth
  #  Checks the bush depth. (pixel movement)
  #----------------------------------------------------------------------------
  def bush_depth
    # if no tile and not jumping and not bush and not always on top
    if @jump_count == 0 && $game_map.pixel_bush?(@x, @y) &&
        @tile_id == 0 && !@always_on_top
      # return bush depth
      return 12
    end
    # no depth
    return 0
  end
  #----------------------------------------------------------------------------
  # terrain_tag
  #  Checks the terrain tag. (pixel movement)
  #----------------------------------------------------------------------------
  def terrain_tag
    # no terrain tag if in mid-air
    return 0 if jumping?
    # return terrain tag at the character's center
    return $game_map.terrain_tag((@real_x + 64) / 128, (@real_y + 64) / 128)
  end
  #----------------------------------------------------------------------------
  # in_action
  #  Overriding method needed for sprite animation.
  #----------------------------------------------------------------------------
  def in_action
    # if not in action and either sprite add-on or path requested
    if @in_action < 1 && (@current_sprite != '' && !charging? ||
        $BlizzABS.AI.path_requesting?(self))
      # in action
      return 1
    end
    # real in action
    return @in_action
  end
  #----------------------------------------------------------------------------
  # in_screen?
  #  Checks whether a battler is within the screen.
  #----------------------------------------------------------------------------
  def in_screen?
    return (((@real_x - $game_map.display_x - 64) / 4).between?(0, 640) &&
            ((@real_y - $game_map.display_y - 64) / 4).between?(0, 480))
  end
  #----------------------------------------------------------------------------
  # running?
  #  Dummy method.
  #----------------------------------------------------------------------------
  def running?
    return false
  end
  #----------------------------------------------------------------------------
  # sneaking?
  #  Dummy method.
  #----------------------------------------------------------------------------
  def sneaking?
    return false
  end
  #----------------------------------------------------------------------------
  # idle?
  #  Checks whether the character is idle on the map.
  #----------------------------------------------------------------------------
  def idle?
    return (@current_sprite == '' && !moving? && !jumping? && self.valid? &&
        self.in_action == 0 && self.restriction < 3 && !charging? &&
        !freeze_action && (@step_anime || self.pattern == @original_pattern))
  end
  
end

#==============================================================================
# Map_Actor
#------------------------------------------------------------------------------
#  This class serves as character class for any actor on the map.
#  Controller controls that instance of this class which has the first party
#  member as battler.
#==============================================================================

class Map_Actor < Map_Battler

  # setting all accessible variables
  attr_accessor :cindex
  attr_accessor :buffer
  attr_accessor :move_speed
  attr_reader   :blinking
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize(index)
    # call superclass method
    super()
    # store battler
    @battler = $game_party.actors[index]
    # set blinking counter
    @blinking = 0
    # save index in caterpillar
    @cindex = index
    # enforce the next force_movement from the buffer
    @force_movement = 0
    # create actor AI data pack
    @ai = BlizzABS::AI::Data_Actor.new(self)
    # set initial normal speed
    @normal_speed = BlizzABS::Config::NORMAL_SPEED
  end
  #----------------------------------------------------------------------------
  # update?
  #  Checks if caterpillar is active.
  #----------------------------------------------------------------------------
  def update?
    return ($game_system.caterpillar_active || in_abseal_range?)
  end
  #----------------------------------------------------------------------------
  # update
  #  Processes all the data.
  #----------------------------------------------------------------------------
  def update
    # check special state effects
    update_states
    # if this character is being controlled by the player
    if self == $game_player
      # always reset alignment group if the alignment was altered for player
      @ai.setup_group(@ai.group) if @ai.altered_alignment
      # no force move like the other battlers
      @force_move = []
      # use combo move if possible
      #if !moving? && @combo != nil && @combo.moves.size > 0
      #  update_combomove
      #end
      # always idle AI state
      @ai.state = BlizzABS::AI::Return
      # update player control over this character
      result = $BlizzABS.player.update_control
      # update stop animation display
      update_step_anime
      # call superclass method
      super
      # call post update process
      $BlizzABS.player.update_moving(result)
      # if battler valid and dead
      if self.valid? && battler.dead?
        # set blendtype to "ghost"
        @blend_type = 1
        # make a ghost animation using opacity
        @opacity = 64 + 192 * (Graphics.frame_count % 4 / 2).abs
        # unfreeze action
        @freeze_action = false
        # reset action data
        self.reset_action
        # not attacked and not in action
        @attacked = @in_action = 0
      else
        # set blendtype to normal
        @blend_type = 0
      end
      # exit method
      return
    end
    # update pixel movement rate
    update_pixel_rate
    # stop if no update necessary
    return if !update?
    # reset spriteset name
    @character_name = @character_name_org
    # update spriteset animation 
    sprite_animation_setup
    # if battler exists
    if valid?
      # if battler is dead
      if battler.dead?
        # stop if summoned
        return if $BlizzABS.summoned?(self)
        # make a ghost animation using opacity
        @opacity = 64 + 192 * (Graphics.frame_count % 4 / 2).abs
        # unfreeze action
        @freeze_action = false
        # reset action data
        self.reset_action
        # not attacked and not in action
        @attacked = @in_action = 0
      end
      # updates any attack action
      update_attacked
    end
    # transparent flag inheritance from player
    @transparent = $game_player.transparent
    # through flag inheritance from player
    @through = $game_player.through
    # set blendtype to "ghost" if dead, otherwise to normal
    @blend_type = (valid? && battler.dead? ? 1 : 0)
    # if battler is not valid or dead or ABS disabled
    if !valid? || battler.dead? || !$game_temp.in_battle
      # if not in caterpillar
      if @cindex == nil
        # set to return state
        @ai.state = BlizzABS::AI::Return
      else
        # set to idle state
        @ai.state = BlizzABS::AI::Idle
      end
      # check state and decide further processing
      case @ai.state
      when BlizzABS::AI::Idle then update_in_caterpillar
      when BlizzABS::AI::Return then update_out_caterpillar
      end
      # call superclass method
      super
      # update stop animation display
      update_step_anime
      # exit method
      return
    end
    # if event is being executed
    if $game_system.map_interpreter.running?
      # check state and decide further processing
      case @ai.state
      when BlizzABS::AI::Idle then update_in_caterpillar
      when BlizzABS::AI::Return then update_out_caterpillar
      else
        # move normally if not already moving
        update_forcemove if !moving?
      end
      # update the event with the superclass method
      super
      # update stop animation display
      update_step_anime
      # exit method
      return
    end
    # AI update phase 1 (pre-phase)
    $BlizzABS.AI.prepare(self)
    # if can't act now
    if !can_act?
      # update action
      update_action
      # call superclass method
      super
      # update stop animation display
      update_step_anime
      # exit method
      return
    end
    # update AI controlled behavior
    update_behavior
    # get pixel move rate
    pix = $BlizzABS.pixel
    # if battler doesn't exist or dead
    if @ai.target != nil && (!@ai.target.valid? || !@ai.target.in_screen? ||
        Math.hypot(self.x / pix - @ai.target.x / pix,
            self.y / pix - @ai.target.y / pix) >
                $BlizzABS.util.get_player_radius * @ai.aggressive / 15)
      # reset movement
      @force_move = []
      # reset action
      self.reset_action
      # if not in catepillar already
      if @cindex == nil
        # return to caterpillar
        @ai.state = BlizzABS::AI::Return
      else
        # idle state
        @ai.state = BlizzABS::AI::Idle
      end
    end
    # set to return if abort requested
    return if @ai.state == BlizzABS::AI::Abort
    # check state and decide further processing
    case @ai.state
    when BlizzABS::AI::Idle then update_in_caterpillar
    when BlizzABS::AI::Return then update_out_caterpillar
    else
      #p 2
      # move normally if not already moving
      update_forcemove if !moving?
    end
    # call superclass method
    super
  end
  #----------------------------------------------------------------------------
  # update_step_anime
  #  Updates stop animation display.
  #----------------------------------------------------------------------------
  def update_step_anime
    # if player's character is animated
    if BlizzABS::Config::ANIMATED_IDS.include?(battler_id)
      # set stopped animation flag
      @step_anime = true
    else
      # set stopped animation flag to defending
      @step_anime = @ai.act.defend?
    end
  end
  #----------------------------------------------------------------------------
  # update_ai
  #  Updates AI specific behavior.
  #----------------------------------------------------------------------------
  def update_ai
    # AI update phase 2 (perception)
    $BlizzABS.AI.perception(self, (@force_move.size == 0))
    # if doing nothing, not force-moving and no target exists
    if self.in_action == 0 && @ai.state != BlizzABS::AI::Knockback &&
        (@ai.target == nil || !@ai.target.valid?)
      # AI update phase 3 (decide action)
      $BlizzABS.AI.decide_action(self)
    end
  end
  #----------------------------------------------------------------------------
  # update_action
  #  Updates the action to be executed.
  #----------------------------------------------------------------------------
  def update_action
    # decrease AI delay count
    @ai.act.delay -= 1
    # stop if no action exists
    return if !@ai.act.valid?
    # if not controller by player
    if self != $game_player
      # if in caterpillar
      if @cindex != nil
        # remove from caterpillar
        remove_from_caterpillar
        # set state to be ready
        @ai.state = BlizzABS::AI::Ready
      end
      # projectile evasion processing if defensive enough
      $BlizzABS.AI.evade_projectiles(self) if rand(200) < 10 - @ai.offensive
    end
    # if defending and counter expired
    if @ai.act.defend? && @ai.act.ready?
      # reset action
      self.reset_action
      # reset sprites
      self.reset_sprites
    end
  end
  #----------------------------------------------------------------------------
  # setup_move
  #  Sets up the forced movement if it is needed.
  #----------------------------------------------------------------------------
  def setup_move
    # if allowed to change speed
    if @ai.state != BlizzABS::AI::MoveOnly
      # if return state and in caterpillar
      if @ai.state == BlizzABS::AI::Return && @cindex != nil
        # set to idle state
        @ai.state = BlizzABS::AI::Idle
      end
      # reset moving speed
      @move_speed = @normal_speed
      # increase moving speed if knockback
      @move_speed += 1 if @ai.state == BlizzABS::AI::Knockback
    # if in caterpillar
    elsif @cindex != nil
      # set to idle state
      @ai.state = BlizzABS::AI::Idle
    end
  end
  #----------------------------------------------------------------------------
  # update_forcemove
  #  move - the move to execute
  #  Updates movement.
  #----------------------------------------------------------------------------
  def update_forcemove(move = nil)
    # if moving commands exist
    move = @force_move.shift if move == nil && @force_move.size > 0
    # stop if no move
    return if move == nil
    # move
    case move[0]
    when 1 then move_lower_left
    when 2 then move_down(move[1])
    when 3 then move_lower_right
    when 4 then move_left(move[1])
    when 6 then move_right(move[1])
    when 7 then move_upper_left
    when 8 then move_up(move[1])
    when 9 then move_upper_right
    when false
      # remove from caterpillar
      remove_from_caterpillar if @cindex != nil
      # reset force counter
      @force_movement = 0
    end
  end
  #----------------------------------------------------------------------------
  # update_pixel_rate
  #  Updates the pixel movement rate if necessary.
  #----------------------------------------------------------------------------
  def update_pixel_rate
    # stop if pixel movement rate is not different than the stored one
    return if @pixel_rate == $game_system.pixel_rate
    # store old buffer and clear buffer
    tmp, @force_move = @force_move, []
    # while there is still data in the old buffer
    while tmp.size > 0
      # if normal command
      if tmp[0][1] == true || tmp[0][1] == false
        # get current command
        move = tmp.shift
        # remove the rest of the commands depending on old pixel movement
        (2 ** @pixel_rate - 1).times {tmp.shift}
        # add into new buffer depending on new pixel movement
        (2 ** $game_system.pixel_rate).times {@force_move.push(move)}
      else
        # directly add into new buffer
        @force_move.push(tmp.shift)
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_in_caterpillar
  #  Updates movement within caterpillar.
  #----------------------------------------------------------------------------
  def update_in_caterpillar
    # reset alignment group if the alignment was altered
    @ai.setup_group(@ai.group) if @ai.altered_alignment
    # get poxel movement
    pix = $BlizzABS.pixel
    # if far enough from the player or relative position doesn't fit movement
    if Math.hypot(@real_x - $game_player.real_x,
        @real_y - $game_player.real_y) > (@cindex + 2) * 128 ||
        @force_move.size < calc_movement.size && @force_movement == 0
      # remove from caterpillar
      remove_from_caterpillar
    else
      # set speed to the player's move speed
      @move_speed = $game_player.move_speed
      # if not moving and buffer not empty and either forced or buffer full
      if !moving? && @force_move.size > 0 &&
          (@force_move.size > @cindex * pix || @force_movement > 0)
        # get next command
        move = @force_move.shift
        # if normal movement command
        if move[1] == true || move[1] == false
          # execute movement command
          update_forcemove(move)
        else
          # check command and decide jump direction
          x, y = BlizzABS::Cache::DirOffsets[move[0]]
          # get jumping range
          range = BlizzABS::Config::JUMPING
          # jump into direction with considering running/sneaking
          jump(x*range + x*move[1], y*range + y*move[1], move[0])
        end
        # decrease counter if counter is active
        @force_movement -= 1 if @force_movement > 0
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_out_caterpillar
  #  Updates movement when separated from caterpillar.
  #----------------------------------------------------------------------------
  def update_out_caterpillar
    # get pixel movement and current index
    pix, ind, battlers = $BlizzABS.pixel, self.index, $BlizzABS.battlers
    # decrease ind for every an actor that is missing in the caterpillar
    (1...ind).each {|i| ind -= 1 if battlers[i].cindex == nil}
    # if not at correct position depending on player
    if (@x - $game_player.x).abs <= ind * pix &&
        (@y - $game_player.y).abs <= ind * pix
      # return to caterpillar if caterpillar is active
      return_to_caterpillar if $game_system.caterpillar_active
    # if still movement commands exist
    elsif @force_move.size > 0
      # execute movement command if not already moving
      update_forcemove if !moving?
    # if caterpillas is active
    elsif $game_system.caterpillar_active
      # request path to party leader
      $BlizzABS.AI.request_path(self, $game_player)
      # set waiting state
      @ai.state = BlizzABS::AI::Request
    end
  end
  #----------------------------------------------------------------------------
  # calc_movement
  #  Calculates a movement pattern to the player's current position when
  #  integrating back into the caterpillar, so this characeter doesn't need to
  #  go to the player's position or a reserved position, but can stay as far as
  #  possible to give a more natural feeling.
  #----------------------------------------------------------------------------
  def calc_movement
    # initialize result
    result = []
    # get differences
    dx, dy = @x - $game_player.x, @y - $game_player.y
    # while differences exist
    while dx.abs > 0 || dy.abs > 0
      # add move command into direction to player
      if dx > 0 && dy > 0 # up left
        result.push(BlizzABS::Cache::TDirs[7])
      elsif dx > 0 && dy < 0 # down right
        result.push(BlizzABS::Cache::TDirs[1])
      elsif dx < 0 && dy > 0 # up right
        result.push(BlizzABS::Cache::TDirs[9])
      elsif dx < 0 && dy < 0 # down left
        result.push(BlizzABS::Cache::TDirs[3])
      elsif dx < 0 && dy == 0 # right
        result.push(BlizzABS::Cache::TDirs[6])
      elsif dx > 0 && dy == 0 # left
        result.push(BlizzABS::Cache::TDirs[4])
      elsif dx == 0 && dy < 0 # down
        result.push(BlizzABS::Cache::TDirs[2])
      elsif dx == 0 && dy > 0 # up
        result.push(BlizzABS::Cache::TDirs[8])
      end
      # decrease difference if there are differences
      dx -= dx.sgn if dx != 0
      dy -= dy.sgn if dy != 0
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # battler
  #  override - allows obtaining the real battler value
  #  Allows disabling of the character if caterpillar is turned off.
  #----------------------------------------------------------------------------
  def battler(override = false)
    return (($game_system.caterpillar || self == $game_player || override) ?
        @battler : nil)
  end
  #----------------------------------------------------------------------------
  # skill_hotkeys
  #  Allows access of the item hotkeys.
  #----------------------------------------------------------------------------
  def skill_hotkeys
    return (battler == nil ? BlizzABS::Cache::HotKeys : battler.skill_hotkeys)
  end
  #----------------------------------------------------------------------------
  # item_hotkeys
  #  Allows access of the item hotkeys.
  #----------------------------------------------------------------------------
  def item_hotkeys
    return (battler == nil ? BlizzABS::Cache::HotKeys : battler.item_hotkeys)
  end
  #----------------------------------------------------------------------------
  # encounter_count
  #  Reroutes the battle-encounter countdown from the controller if being
  #  controlled by the player.
  #----------------------------------------------------------------------------
  def encounter_count
    return (self == $game_player ? $BlizzABS.player.encounter_count : 1)
  end
  #----------------------------------------------------------------------------
  # make_encounter_count
  #  Reroutes the battle-encounter countdown setup.
  #----------------------------------------------------------------------------
  def make_encounter_count
    # stop if map doesn't exist
    return if $game_map.map_id == 0
    # temporary variable
    n = $game_map.encounter_step * (2 ** (5 - $game_system.pixel_rate))
    # 2 hyperdices rolling
    $BlizzABS.player.encounter_count = (rand(n) + rand(n) + 1) *
        2 ** (5 - $game_system.pixel_rate)
  end
  #----------------------------------------------------------------------------
  # remove_from_caterpillar
  #  Procedure used at a couple of places in the script. To shorten the code
  #  the procedure was embedded into one method.
  #----------------------------------------------------------------------------
  def remove_from_caterpillar
    # disintegrate from caterpillar
    update_ci(nil)
    # empty movement buffer, set to return state
    @force_move, @ai.state = [], BlizzABS::AI::Return
    # if too slow
    if @move_speed < $game_player.normal_speed
      # set normal moving speed
      @move_speed = $game_player.normal_speed
    end
  end
  #----------------------------------------------------------------------------
  # return_to_caterpillar
  #  Integrates the map actor back into the caterpillar.
  #----------------------------------------------------------------------------
  def return_to_caterpillar
    # integrate back into caterpillar
    update_ci(self.index)
    # reset action
    self.reset_action
    # calculate movement buffer commands
    @force_move = calc_movement
    # reset force movement counter
    @force_movement = 0
    # idle state
    @ai.state = BlizzABS::AI::Idle
  end
  #----------------------------------------------------------------------------
  # update_ci
  #  index - new caterpillar index
  #  Integrates back into the caterpillar by setting up @cindex.
  #----------------------------------------------------------------------------
  def update_ci(ind = (@cindex == nil ? nil : self.index))
    # set new cindex
    @cindex = ind
    # get all battlers
    battlers = $BlizzABS.battlers
    # if index isn't removing from caterpillar
    if ind != nil
      # iterate through all actors in front of self
      (1...self.index).each {|i|
          # decrease cindex if missing in the caterpillar or no battler
          @cindex -= 1 if battlers[i].cindex == nil || battlers[i].battler == nil}
    end
    # update the @cindex of the actor behind if he exists
    battlers[self.index + 1].update_ci if battlers[self.index + 1] != nil
  end
  #----------------------------------------------------------------------------
  # update_buffer
  #  move - new command added into the buffer
  #  Handles the movement command delay system for caterpillar movement.
  #----------------------------------------------------------------------------
  def update_buffer(move)
    # exit if removed from caterpillar
    return if @cindex == nil
    # if enforce emptying buffer command
    if move == nil
      # set enforcement to the current buffer size
      @force_movement = @force_move.size
    # reintegrate into caterpillar
    elsif move == false
      # calculate movement buffer commands
      @force_move += calc_movement
    else
      # add new command into buffer
      @force_move.push(move)
      # if forced execution or command is jumping
      unless move[1] == true || move[1] == false
        # set enforcement to the current buffer size
        @force_movement = @force_move.size
      end
    end
  end
  #----------------------------------------------------------------------------
  # attack_penalty
  #  Returns the penalty for the weapon.
  #----------------------------------------------------------------------------
  def attack_penalty
    # get weapon penalty
    penalty = BlizzABS::Weapons.penalty(@battler.weapon_id)
    # limit is sum of all animation frames if using action sprites
    limit = (action_sprites? ? BlizzABS::Weapons.frames(@battler.weapon_id).sum : 0)
    # limit penalty
    return (penalty < limit ? limit : penalty)
  end
  #----------------------------------------------------------------------------
  # update_attacked
  #  Processes being attacked and blinking animation.
  #----------------------------------------------------------------------------
  def update_attacked
    # if blinking
    if @blinking > 0
      # set blink opacity
      @opacity = 128 + 128 * ((@blinking + 2) % 4 / 2).abs
      # decrease blinking counter
      @blinking -= 1
    # if not dead
    elsif valid? && !battler.dead?
      # full opacity
      @opacity = 255
    end
    # stop if not attacked
    return if @attacked == 0
    # decrease attacked counter
    @attacked -= 1
    # get thrown back
    move_backward
  end
  #----------------------------------------------------------------------------
  # action_sprites?
  #  Checks if action sprites can be used.
  #----------------------------------------------------------------------------
  def action_sprites?
    return BlizzABS::Config::A_ACTION_SPRITES
  end
  #----------------------------------------------------------------------------
  # weapon_sprites?
  #  Checks if weapon sprites can be used.
  #----------------------------------------------------------------------------
  def weapon_sprites?
    return BlizzABS::Config::A_WEAPON_SPRITES
  end
  #----------------------------------------------------------------------------
  # skill_sprites?
  #  Checks if skill sprites can be used.
  #----------------------------------------------------------------------------
  def skill_sprites?
    return BlizzABS::Config::A_SKILL_SPRITES
  end
  #----------------------------------------------------------------------------
  # item_sprites?
  #  Checks if item sprites can be used.
  #----------------------------------------------------------------------------
  def item_sprites?
    return BlizzABS::Config::A_ITEM_SPRITES
  end
  #----------------------------------------------------------------------------
  # jumping_sprites?
  #  Checks if jumping sprites can be used.
  #----------------------------------------------------------------------------
  def jumping_sprites?
    return BlizzABS::Config::JUMPING_SPRITES
  end
  #----------------------------------------------------------------------------
  # running_sprites?
  #  Checks if running sprites can be used.
  #----------------------------------------------------------------------------
  def running_sprites?
    return BlizzABS::Config::RUNNING_SPRITES
  end
  #----------------------------------------------------------------------------
  # sneaking_sprites?
  #  Checks if sneaking sprites can be used.
  #----------------------------------------------------------------------------
  def sneaking_sprites?
    return BlizzABS::Config::SNEAKING_SPRITES
  end
  #----------------------------------------------------------------------------
  # idle_sprites?
  #  Checks if idle sprites can be used.
  #----------------------------------------------------------------------------
  def idle_sprites?
    return BlizzABS::Config::A_IDLE_SPRITES
  end
  #----------------------------------------------------------------------------
  # charge_sprites?
  #  Checks if charge sprites can be used.
  #----------------------------------------------------------------------------
  def charge_sprites?
    return BlizzABS::Config::A_CHARGE_SPRITES
  end
  #----------------------------------------------------------------------------
  # charge_weapon_sprites?
  #  Checks if charge weapon sprites can be used.
  #----------------------------------------------------------------------------
  def charge_weapon_sprites?
    return BlizzABS::Config::A_CHARGE_WEAPON_SPRITES
  end
  #----------------------------------------------------------------------------
  # charge_skill_sprites?
  #  Checks if charge skill sprites can be used.
  #----------------------------------------------------------------------------
  def charge_skill_sprites?
    return BlizzABS::Config::A_CHARGE_SKILL_SPRITES
  end
  #----------------------------------------------------------------------------
  # charge_item_sprites?
  #  Checks if charge item sprites can be used.
  #----------------------------------------------------------------------------
  def charge_item_sprites?
    return BlizzABS::Config::A_CHARGE_ITEM_SPRITES
  end
  #----------------------------------------------------------------------------
  # setup_attack_sprites
  #  Sets up attack sprites and returns the frame animation data necessary.
  #----------------------------------------------------------------------------
  def setup_attack_sprites
    # get weapon type number
    type = BlizzABS::Weapons.type(self.battler.weapon_id)
    # add weapon type number to sprite extension
    @current_sprite += type.to_s
    # if weapon exists
    if self.battler.weapon_id > 0
      # if weapon sprites active
      if weapon_sprites?
        # set advanced weapon sprite name
        @weapon_sprite = BlizzABS::SPRWeaponID + self.battler.weapon_id.to_s
      else
        # set generic weapon sprite
        @weapon_sprite = BlizzABS::SPRWeapon + type.to_s
      end
    end
    # return frame animation data
    return BlizzABS::Weapons.frames(self.battler.weapon_id)
  end
  #----------------------------------------------------------------------------
  # setup_charge_attack_sprites
  #  Sets up charge attack sprites and returns the frame animation data
  #  necessary.
  #----------------------------------------------------------------------------
  def setup_charge_attack_sprites
    # spriteset name add-on
    @current_sprite = BlizzABS::SPRAttack + BlizzABS::SPRCharge +
        self.battler.weapon_id.to_s
    # return frame animation data
    return BlizzABS::Weapons.charge_frames(self.battler.weapon_id)
  end
  #----------------------------------------------------------------------------
  # use_defend
  #  Processes using a defending action.
  #----------------------------------------------------------------------------
  def use_defend
    # if defend sprites is active
    if BlizzABS::Config::A_DEFEND_SPRITES
      # setup special defend sprite
      setup_sprites(BlizzABS::SPRDefend + battler.armor1_id.to_s)
    else
      # call super class method
      super
    end
  end
  #----------------------------------------------------------------------------
  # refresh
  #  Refreshes the character.
  #----------------------------------------------------------------------------
  def refresh(flag = false)
    # refresh all actors if self is controlled by player and not calling again
    $BlizzABS.player.refresh if !flag && self == $game_player
    # if not valid
    if !valid?
      # set spriteset name
      @character_name_org = @character_name = ''
      # set spriteset hue
      @character_hue = 0
    else
      # set spriteset name
      @character_name_org = @character_name = battler.character_name
      # set spriteset hue
      @character_hue = battler.character_hue
      # set opacity to full and blend type to normal
      @opacity, @blend_type = 255, 0
    end
  end
  #----------------------------------------------------------------------------
  # jump_passable?
  #  x  - x-coordinate
  #  y  - y-coordinate
  #  nx - new x-coordinate
  #  ny - new y-coordinate
  #  Checks if there is a tile with NO_JUMP_TAGS tag so jumping isn't possible.
  #----------------------------------------------------------------------------
  def jump_passable?(x, y, d)
    # impassable if new coordinates not valid
    return false unless $game_map.self_valid?(x, y)
    # passable through or pressing CTRL in DEBUG mode
    return true if $DEBUG && Input.press?(Input::CTRL) || @through
    # passable if landing tile passable
    return ($game_map.self_passable?(x, y, 0, self))
  end
  #----------------------------------------------------------------------------
  # move_down
  #  turn_enabled - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_down(turn_enabled = true)
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # if turn enabled
      if turn_enabled
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[2])
      else
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::FDirs[2])
      end
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # move_left
  #  turn_enabled - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_left(turn_enabled = true)
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # if turn enabled
      if turn_enabled
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[4])
      else
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::FDirs[4])
      end
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # move_right
  #  turn_enabled - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_right(turn_enabled = true)
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # if turn enabled
      if turn_enabled
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[6])
      else
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::FDirs[6])
      end
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # move_up
  #  turn_enabled - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_up(turn_enabled = true)
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # if turn enabled
      if turn_enabled
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[8])
      else
        # update buffer
        $BlizzABS.player.update_buffer(BlizzABS::Cache::FDirs[8])
      end
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # move_lower_left
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_lower_left
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # update buffer
      $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[1])
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # move_lower_right
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_lower_right
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # update buffer
      $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[3])
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # move_upper_left
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_upper_left
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # update buffer
      $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[7])
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # move_upper_right
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_upper_right
    # call superclass method and store result
    result = super
    # if self is controlled by player
    if self == $game_player && result
      # update buffer
      $BlizzABS.player.update_buffer(BlizzABS::Cache::TDirs[9])
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # passable?
  #  x - x-coordinate
  #  y - y-coordinate
  #  d - direction
  #  Checks the passability. (pixel movement)
  #----------------------------------------------------------------------------
  def passable?(x, y, d)
    # calculate new coordinates
    nx = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    ny = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    # impassable if new coordinates not valid
    return false unless $game_map.self_valid?(nx, ny)
    # impassable if paralyzed
    return false if self.restriction == 4
    # passable if actor and pressing CTRL in DEBUG mode
    return true if $DEBUG && Input.press?(Input::CTRL) || @through
    # passability depends on basic testing
    return super
  end
  #----------------------------------------------------------------------------
  # jump
  #  x - x-coordinate
  #  y - y-coordinate
  #  Jumps. (pixel movement)
  #----------------------------------------------------------------------------
  def jump(x_plus, y_plus, d = nil)
    # if direction is unknown
    if d == nil
      # determines direction
      if x_plus > 0 && y_plus > 0 # jumping down right
        d = 3
      elsif x_plus > 0 && y_plus < 0 # jumping up left
        d = 9
      elsif x_plus < 0 && y_plus > 0 # jumping down right
        d = 1
      elsif x_plus < 0 && y_plus < 0 # jumping up left
        d = 7
      elsif x_plus < 0 && y_plus == 0 # jumping left
        d = 4
      elsif x_plus > 0 && y_plus == 0 # jumping right
        d = 6
      elsif x_plus == 0 && y_plus < 0 # jumping up
        d = 8
      elsif x_plus == 0 && y_plus > 0 # jumping down
        d = 2
      end
    end
    # if jumped
    if super
      # if self is controlled by player
      if self == $game_player
        # update buffer
        $BlizzABS.player.update_buffer([d, @move_speed - $game_player.normal_speed])
      end
      # jumped
      return true
    end
    # not jumped
    return false
  end
  #----------------------------------------------------------------------------
  # moveto
  #  x - x-coordinate
  #  y - y-coordinate
  #  Moves the player instantly to a postion, moves all actors and centers the
  #  screen upon the player.
  #----------------------------------------------------------------------------
  def moveto(x, y)
    # call superclass method 
    super
    # call controller method if self is controlled by player
    $BlizzABS.player.moveto(x, y) if self == $game_player
  end
  #----------------------------------------------------------------------------
  # center
  #  x - x-coordinate
  #  y - y-coordinate
  #  Centers the screen upon the player's character if the character is
  #  controlled by the player.
  #----------------------------------------------------------------------------
  def center(x, y)
    $BlizzABS.player.center(x, y) if self == $game_player
  end
  #----------------------------------------------------------------------------
  # attacked=
  #  val - number
  #  Sets the attacked counter and blinking value.
  #----------------------------------------------------------------------------
  def attacked=(val)
    # call superclass method
    super
    # if controlled by player
    if self == $game_player
      # dismantle entire caterpillar
      ($BlizzABS.battlers - [self]).each {|b| b.remove_from_caterpillar}
    else
      # remove from caterpillar
      remove_from_caterpillar
    end
    # set blinking counter if not defending
    @blinking = val * 8 unless BlizzABS::Config::FULL_DEFEND && @ai.act.defend?
  end
  #----------------------------------------------------------------------------
  # check_event_trigger_touch
  #  x - x-coordinate
  #  y - y-coordinate
  #  Checks event touching if self is controlled by player.
  #----------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    $BlizzABS.player.check_event_trigger_touch(x, y) if self == $game_player
  end
  #----------------------------------------------------------------------------
  # index
  #  Returns own position in battlers array composed of actors, summoned pets
  #  and summoned monsters.
  #----------------------------------------------------------------------------
  def index
    return $BlizzABS.battlers.index(self)
  end
  #----------------------------------------------------------------------------
  # running?
  #  Checks if the player is running.
  #----------------------------------------------------------------------------
  def running?
    return (BlizzABS::Config::RUN_SPEED == @move_speed)
  end
  #----------------------------------------------------------------------------
  # sneaking?
  #  Checks if the player is sneaking.
  #----------------------------------------------------------------------------
  def sneaking?
    return (BlizzABS::Config::SNEAK_SPEED == @move_speed)
  end
  #----------------------------------------------------------------------------
  # idle?
  #  Checks whether the character is idle on the map.
  #----------------------------------------------------------------------------
  def idle?
    return (super && (self == $game_player ? !moving? && @idle_allowed :
        @cindex != nil && @force_move.size <= $BlizzABS.pixel * @cindex))
  end
  #----------------------------------------------------------------------------
  # screen_z
  #  height - height on the screen
  #  Gets character's z-coordinate.
  #----------------------------------------------------------------------------
  def screen_z(height = 0)
    return (super - (index == nil ? BlizzABS::Config::MAX_PARTY : index))
  end

end

#==============================================================================
# Game_Player
#------------------------------------------------------------------------------
#  This class serves as override, so a Map_Actor class is loaded as current
#  player.
#==============================================================================

class Game_Player < Map_Actor
  
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize
    # call superclass method for first actor
    super(0)
  end
  
end

#==============================================================================
# Map_Enemy
#------------------------------------------------------------------------------
#  This class handles a map enemy character. It supports pixel movement,
#  complete AI handling, advanced sprite handling and battle handling.
#==============================================================================

class Map_Enemy < Map_Battler
  
  # setting all accessible variables
  attr_accessor :respawn_point
  attr_accessor :hide_health
  attr_reader   :event
  attr_reader   :trigger
  attr_reader   :list
  attr_reader   :page
  attr_reader   :starting
  attr_reader   :execute
  attr_reader   :immortal
  attr_reader   :full_passable
  attr_reader   :move_flag
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize(map_id, event, id = 0, group = 0, attributes = 0x00,
                 move = false, immortal = false, full_passable = false,
                 custom = false, delay = 40, view = 5, hear = 40)
    # if respawning system active
    if event.is_a?(Map_Enemy)
      # get AI attributes
      attributes = event.ai.attributes
      # get event ID of earlier enemy
      id = event.battler_id
      # get moving flag
      move = !event.move_flag
      # get immortal flag
      immortal = event.immortal
      # get full passability flag
      full_passable = event.full_passable
      # get health bar visibility
      @hide_health = event.hide_health
      # get custom AI flag
      custom = event.ai.custom
      # get alignmend group
      group = event.ai.group
      # get AI Delay Time
      delay = event.ai.delay_time
      # get view range
      view = event.ai.view_range
      # get hearing range ratio
      hear = event.ai.hearing_range_ratio
      # get event of earlier enemy
      event = event.event
    end
    # give the enemy all attributes of a normal character
    super()
    # set map ID and store @event (needed for respawn)
    @map_id, @event = map_id, event
    # move to starting position
    moveto(@event.x, @event.y)
    # set erased flag, starting flag, execute flag, precondition and object flag
    @erased = @starting = @execute = @precondition = false
    # set character spriteset name
    @character_name_org = @character_name = ''
    # empty custom triggers
    @custom_triggers = []
    # refresh
    refresh
    # the database enemy
    @enemy = $data_enemies[id]
    # the battler
    @battler = Game_Enemy.new(@enemy)
    # set immortal flag
    @immortal = @battler.immortal = immortal
    # set full passability flag
    @full_passable = full_passable
    # create AI Data
    @ai = BlizzABS::AI::Data_Enemy.new(self, group, attributes, custom, delay,
        view, hear)
    # own ID and own event ID
    @SELF = @id = event.id
    # set moving flag
    @move_flag = !move
  end
  #----------------------------------------------------------------------------
  # transform
  #  id - new enemy's ID in the database
  #  Transforms an enemy battler into another one.
  #----------------------------------------------------------------------------
  def transform(id)
    # set new enemy ID, own ID and database enemy
    @battler.enemy_id, @enemy = id, $data_enemies[id]
    # set HP if over maximum and remove last hpdamage value
    @battler.hp = @battler.hp
    # set SP if over maximum and remove last spdamage value
    @battler.sp = @battler.sp
    # get AI data setup
    attr, delay, view, hear = $BlizzABS.setup_enemy_ai(id)
    # get AI attributes if custom
    attr = @ai.attributes if @ai.custom
    # recreate data pack for new enemy
    @ai = BlizzABS::AI::Data_Enemy.new(self, @ai.group, attr, @ai.custom,
        delay, view, hear)
  end
  #----------------------------------------------------------------------------
  # override lock
  #----------------------------------------------------------------------------
  alias lock_blizzabs_later lock
  def lock
    # store direction fix
    fix, @direction_fix = @direction_fix, true
    # call original method
    lock_blizzabs_later
    # restore direction fix
    @direction_fix = fix
  end
  #----------------------------------------------------------------------------
  # clear_starting
  #  Clears the starting flag.
  #----------------------------------------------------------------------------
  def clear_starting
    @starting = false
  end
  #----------------------------------------------------------------------------
  # start
  #  Setups the starting event code.
  #----------------------------------------------------------------------------
  def start
    # if event code exists
    return if @list.size <= 1
    # set starting and execution flag
    @starting = @execute = true
    # trigger override
    @trigger = 1
  end
  #----------------------------------------------------------------------------
  # erase
  #  Dummy method.
  #----------------------------------------------------------------------------
  def erase
    @terminate = @erased = true
  end
  #----------------------------------------------------------------------------
  # over_trigger?
  #  Dummy method.
  #----------------------------------------------------------------------------
  def over_trigger?
    return false
  end
  #--------------------------------------------------------------------------
  # refresh
  #  Refreshes the character.
  #--------------------------------------------------------------------------
  def refresh
    # initialize
    new_page = nil
    # if not erased
    unless @erased
      # iterate through all pages in reverse order
      @event.pages.reverse.each {|page|
          # temporary variable
          c = page.condition
          # switch 1 condition test
          next if c.switch1_valid && !$game_switches[c.switch1_id]
          # switch 2 condition test
          next if c.switch2_valid && !$game_switches[c.switch2_id]
          # variable condition test
          if c.variable_valid
            # next page if condition not fulfilled
            next if $game_variables[c.variable_id] < c.variable_value
          end
          # self switch condition test
          if c.self_switch_valid
            # temporary variable
            key = [@map_id, @event.id, c.self_switch_ch]
            # next page if condition not fulfilled
            next unless $game_self_switches[key]
          end
          # set local variable
          new_page = page
          # stop looping
          break}
    end
    # setup event page if event page is not the same as last time
    setup_event_page(new_page) if new_page != @page
  end
  #----------------------------------------------------------------------------
  # setup_event_page
  #  new_page - the event page
  #  Set up the defined event page.
  #----------------------------------------------------------------------------
  def setup_event_page(new_page)
    # set as current event page
    @page = new_page
    # if no page fulfills conditions
    if @page == nil
      # set up variables
      @character_name_org = @character_name = ''
      @tile_id = @character_hue = @move_type = 0
      @trigger = @list = nil
      @through, @precondition = true, false
      # exit method
      return
    end
    # set up variables
    @tile_id = @page.graphic.tile_id
    @character_name_org = @character_name = @page.graphic.character_name
    @character_hue = @page.graphic.character_hue
    # if direction is different
    if @original_direction != @page.graphic.direction
      @direction = @page.graphic.direction
      @original_direction = @direction
      @prelock_direction = 0
    end
    # if pattern is different
    if @original_pattern != @page.graphic.pattern
      @pattern = @page.graphic.pattern
      @original_pattern = @pattern
    end
    @opacity = @page.graphic.opacity
    @blend_type = @page.graphic.blend_type
    @move_type = @page.move_type
    @normal_speed = @move_speed = @page.move_speed
    @move_frequency = @page.move_frequency
    @move_route = @page.move_route
    @move_route_index = 0
    @move_route_forcing = false
    @walk_anime = @page.walk_anime
    @step_anime = @page.step_anime
    @direction_fix = @page.direction_fix
    @through = (@page.through || @full_passable)
    @always_on_top = @page.always_on_top
    triggers = $BlizzABS.util.get_triggers(@page.list)
    @trigger = triggers.shift
    @custom_triggers = triggers.shift
    @list = @page.list
    # set precondtion flag
    @precondition = true
  end
  #----------------------------------------------------------------------------
  # update
  #  Executes the enemy behavior according to the AI.
  #----------------------------------------------------------------------------
  def update
    # if outside of ABSEAL range and actually existing
    if !self.update? || !@precondition
      # reset memory and moving route
      @ai.memory, @force_move = {}, []
      # stop updating
      return
    end
    # check special state effects
    update_states
    # reset loop animation
    @loop_animation_id = 0
    # reset spriteset name
    @character_name = @character_name_org
    # update spriteset
    sprite_animation_setup
    # if executing an event code
    if event_execution?
      # call superclass method
      super
      # abort update
      return
    end
    # return if page doesn't exist
    return if @page == nil
    # if event code is being executed or lifeless object or not in battle
    if $game_system.map_interpreter.running? || @ai.lifeless? ||
        !$game_temp.in_battle
      # update movement
      update_forcemove
      # update the event with the superclass method
      super
      # exit method
      return
    end
    # AI update phase 1 (pre-phase)
    $BlizzABS.AI.prepare(self)
    # if can't act now
    if !can_act?
      # update action
      update_action
      # call superclass method
      super
      # exit method
      return
    end
    # update AI controlled behavior
    update_behavior
    # stop execution if abort requested
    return if @ai.state == BlizzABS::AI::Abort
    # update idle
    update_idle
    # update movement
    update_forcemove
    # call superclass method
    super
  end
  #----------------------------------------------------------------------------
  # event_execution?
  #  Tests if the enemy died and is executing an event now.
  #----------------------------------------------------------------------------
  def event_execution?
    # stop if not executing
    return false if !@execute
    # if about to start or running already
    if @starting || $game_system.map_interpreter.running?
      # reset blending type
      @blend_type = 0 if @starting
      # reset moving route
      @force_move = []
      # executing event
      return true
    end
    # if enemy revived with event command
    if valid? && !battler.dead?
      # reset opacity
      @opacity = 255
      # reset blending type
      @blend_type = 0
      # reset execute flag
      @execute = false
      # recreate data pack for new enemy
      @ai = BlizzABS::AI::Data_Enemy.new(self, @ai.group, @ai.attributes,
          @ai.custom, @ai.delay_time, @ai.view_range, @ai.hearing_range_ratio)
      # reset moving route
      @force_move = []
    # if opacity is 0
    elsif (!valid? || battler.dead?) && @opacity == 0
      # set execute flag and erased flag
      @execute, @erased = false, true
      # refresh
      refresh
    end
    # not executing event
    return false
  end
  #----------------------------------------------------------------------------
  # update_ai
  #  Updates AI specific behavior.
  #----------------------------------------------------------------------------
  def update_ai
    # stop if force moving knockback
    return if @ai.state == BlizzABS::AI::Knockback
    # if not aggressive
    if !@ai.aggressive
      # light update
      update_priority = BlizzABS::UPDLight
    # if moving
    elsif moving?
      # medium update
      update_priority = BlizzABS::UPDMedium
    # if trying to move
    elsif @force_move.size > 0
      # heavy update
      update_priority = BlizzABS::UPDHeavy
    else
      # full update
      update_priority = BlizzABS::UPDFull
    end
    # AI update phase 2 (perception)
    in_range = $BlizzABS.AI.perception(self, update_priority)
    # if doing nothing, aggressive and no target exists
    if self.in_action == 0 && @ai.aggressive &&
        (@ai.target == nil || !@ai.target.valid?)
      # AI update phase 3 (decide action)
      $BlizzABS.AI.decide_action(self)
    end
    # update leader related data
    $BlizzABS.AI.leader_update(self)
    # override timer if using "full power" attribute and not running away
    @ai.act.delay = 0 if @ai.full_power && !@ai.act.ready? && !@ai.act.escape?
  end
  #----------------------------------------------------------------------------
  # update_action
  #  Updates the action to be executed.
  #----------------------------------------------------------------------------
  def update_action
    # stop if force moving knockback or action doesn't exist
    return if @ai.state == BlizzABS::AI::Knockback || !@ai.act.valid?
    # decrease delay timer
    @ai.act.delay -= 1
    # if leader and counter expired and only sometimes
    if @ai.leader && @ai.act.ready? && rand(100) < 10
      # all minions
      @ai.minions.each {|b|
          # 50% chance if they have an action pending
          if b.ai.act.valid? && rand(2) == 0
            # force into action
            b.ai.act.delay = 0
            # 50% chance for same target
            b.ai.target = @ai.target if rand(2) == 0
          end}
    end
    # projectile evasion processing if attribute "defensive" is active
    $BlizzABS.AI.evade_projectiles(self) if @ai.defensive && @move_type != 3
    # if counter expired and either running away or defending
    if @ai.act.ready? && (@ai.act.escape? || @ai.act.defend?)
      # reset action
      self.reset_action
      # reset sprites
      self.reset_sprites
    end
  end
  #----------------------------------------------------------------------------
  # setup_move
  #  Sets up the forced movement if it is needed.
  #----------------------------------------------------------------------------
  def setup_move
    # stop if not allowed to change speed
    return if @ai.state == BlizzABS::AI::MoveOnly
    # set to idle state if return state
    @ai.state = BlizzABS::AI::Idle if @ai.state == BlizzABS::AI::Return
    # reset moving speed
    @move_speed = @normal_speed
    # increase moving speed if knockback
    @move_speed += 1 if @ai.state == BlizzABS::AI::Knockback
  end
  #----------------------------------------------------------------------------
  # update_idle
  #  Updates idle action.
  #----------------------------------------------------------------------------
  def update_idle
    # if idle, update time expired and not forced to move
    if @ai.state == BlizzABS::AI::Idle &&
        Graphics.frame_count % 20 == rand(30) && @move_type != 3
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # get possible directions
      dir = ($game_system._8_way ? BlizzABS::Cache::Dir8 : BlizzABS::Cache::Dir4)
      # get one direction
      dir = dir[rand(dir.size)]
      # move randomly
      (pix/2 + rand(pix+1)).times {@force_move.push(BlizzABS::Cache::TDirs[dir])}
      # set idle moving speed
      @move_speed = @normal_speed - 1
    end
  end
  #----------------------------------------------------------------------------
  # update_forcemove
  #  Updates movement.
  #----------------------------------------------------------------------------
  def update_forcemove
    # stop if no moving commands exist
    return if @force_move.size == 0
    # get next moving command
    move = @force_move.shift
    # stop if moving not allowed
    return if !@move_flag
    # execute movement command
    case move[0]
    when 1 then move_lower_left(11)
    when 2 then move_down(11, move[1])
    when 3 then move_lower_right(11)
    when 4 then move_left(11, move[1])
    when 6 then move_right(11, move[1])
    when 7 then move_upper_left(11)
    when 8 then move_up(11, move[1])
    when 9 then move_upper_right(11)
    end
  end
  #----------------------------------------------------------------------------
  # attack_effect
  #  character - the character that holds attack data (can be projectile)
  #  _battler  - the attacking battler
  #  Executes attack upon a map character.
  #----------------------------------------------------------------------------
  def attack_effect(character, _battler)
    # call superclass method
    result = super
    # if actor
    if _battler.is_a?(Game_Actor)
      # get weapon ID and custom event trigger type
      id, cet = _battler.weapon_id, BlizzABS::CETWeapon
    # if enemy
    elsif _battler.is_a?(Game_Enemy)
      # get weapon ID and custom event trigger type
      id, cet = _battler.id, BlizzABS::CETEnemy
    end
    # if can be activated by this weapon / enemy
    if result && @custom_triggers.has_key?(cet) &&
        (@custom_triggers[cet].size == 0 ||
        @custom_triggers[cet].include?(id))
      # run this enemy as event
      self.start
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # skill_effect
  #  character - the character that holds skill use (can be projectile)
  #  _battler  - the skill using battler
  #  skill     - the skill
  #  Executes skill use upon a map character.
  #----------------------------------------------------------------------------
  def skill_effect(character, _battler, skill)
    # call superclass method
    result = super
    # if can be activated by this skill
    if result && @custom_triggers.has_key?(BlizzABS::CETSkill) &&
        (@custom_triggers[BlizzABS::CETSkill].size == 0 ||
        @custom_triggers[BlizzABS::CETSkill].include?(skill.id))
      # run this enemy as event
      self.start
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # item_effect
  #  character - the character that holds item use (can be projectile)
  #  item      - the item
  #  Executes item use upon a map character.
  #----------------------------------------------------------------------------
  def item_effect(character, item)
    # call superclass method
    result = super
    # if can be activated by this item
    if result && @custom_triggers.has_key?(BlizzABS::CETItem) &&
        (@custom_triggers[BlizzABS::CETItem].size == 0 ||
        @custom_triggers[BlizzABS::CETItem].include?(item.id))
      # run this enemy as event
      self.start
    end
    # return result
    return result
  end
  #----------------------------------------------------------------------------
  # alignment_effect
  #  group - the group to which the character belongs to
  #  first - first to get the executed action
  #  Applies alignment changes.
  #----------------------------------------------------------------------------
  def alignment_effect(group, first = true)
    # set to aggressive
    @ai.aggressive = true
    # call superclass method
    super(group)
    # stop if not first to get action executed upon
    return unless first
    # for each battler
    $game_map.battlers.each {|b|
        # if this is an ally and can be seen
        if b.ai.positive.include?(@ai.group) && b.ai.sight.include?(self)
          # make action effect
          b.alignment_effect(group, false)
        end}
    # stop if not linked group
    return if !@ai.linked?
    # for each battler
    $game_map.battlers_group(@ai.group).each {|b|
        # make action effect
        b.alignment_effect(group, false)}
    # stop if not permanently linked
    return if !@ai.permanent?
    # for each alignment group setup
    $game_system.alignments.each_value {|a|
        # make character group to enemy if this group is an ally
        a.enemies.push(group) if a.ally?(@ai.group)}
  end
  #----------------------------------------------------------------------------
  # attack_penalty
  #  Returns the penalty for the enemy.
  #----------------------------------------------------------------------------
  def attack_penalty
    # get weapon penalty
    penalty = BlizzABS::Enemies.penalty(@battler.id)
    # limit is sum of all animation frames if using action sprites
    limit = (action_sprites? ? BlizzABS::Enemies.frames(@battler.id).sum : 0)
    # limit penalty
    return (penalty < limit ? limit : penalty)
  end
  #----------------------------------------------------------------------------
  # action_sprites?
  #  Checks if action sprites can be used.
  #----------------------------------------------------------------------------
  def action_sprites?
    return BlizzABS::Config::E_ACTION_SPRITES
  end
  #----------------------------------------------------------------------------
  # skill_sprites?
  #  Checks if skill sprites can be used.
  #----------------------------------------------------------------------------
  def skill_sprites?
    return BlizzABS::Config::E_SKILL_SPRITES
  end
  #----------------------------------------------------------------------------
  # idle_sprites?
  #  Checks if idle sprites can be used.
  #----------------------------------------------------------------------------
  def idle_sprites?
    return BlizzABS::Config::E_IDLE_SPRITES
  end
  #----------------------------------------------------------------------------
  # charge_sprites?
  #  Checks if charge sprites can be used.
  #----------------------------------------------------------------------------
  def charge_sprites?
    return BlizzABS::Config::E_CHARGE_SPRITES
  end
  #----------------------------------------------------------------------------
  # charge_weapon_sprites?
  #  Checks if charge weapon sprites can be used.
  #----------------------------------------------------------------------------
  def charge_weapon_sprites?
    return BlizzABS::Config::E_CHARGE_SPRITES
  end
  #----------------------------------------------------------------------------
  # charge_skill_sprites?
  #  Checks if charge skill sprites can be used.
  #----------------------------------------------------------------------------
  def charge_skill_sprites?
    return BlizzABS::Config::E_CHARGE_SKILL_SPRITES
  end
  #----------------------------------------------------------------------------
  # setup_attack_sprites
  #  Sets up attack sprites and returns the frame animation data necessary.
  #----------------------------------------------------------------------------
  def setup_attack_sprites
    # set normal weapon sprite
    @weapon_sprite = BlizzABS::SPRWeapon
    # return frame animation data
    return BlizzABS::Enemies.frames(self.battler_id)
  end
  #----------------------------------------------------------------------------
  # setup_charge_attack_sprites
  #  Sets up charge attack sprites and returns the frame animation data
  #  necessary.
  #----------------------------------------------------------------------------
  def setup_charge_attack_sprites
    return BlizzABS::Enemies.charge_frames(self.battler_id)
  end
  #----------------------------------------------------------------------------
  # battler
  #  Allows disabling of the character if the event is does not exist due to
  #  preconditions.
  #----------------------------------------------------------------------------
  def battler
    return (@precondition ? @battler : nil)
  end
  #----------------------------------------------------------------------------
  # valid?
  #  Checks if the assigned battler exists and is not dead.
  #----------------------------------------------------------------------------
  def valid?
    return (super && !self.battler.dead?)
  end
  #----------------------------------------------------------------------------
  # exp
  #  Returns the experience.
  #----------------------------------------------------------------------------
  def exp
    return @battler.exp
  end
  #----------------------------------------------------------------------------
  # gold
  #  Returns the gold.
  #----------------------------------------------------------------------------
  def gold
    return @battler.gold
  end
  #----------------------------------------------------------------------------
  # move_random
  #  Moves into a random direction. (8-way)
  #----------------------------------------------------------------------------
  def move_random(number = 1)
    case rand(8)
    when 0 then number.times {move_down(0)}
    when 1 then number.times {move_left(0)}
    when 2 then number.times {move_right(0)}
    when 3 then number.times {move_up(0)}
    when 4 then number.times {move_lower_left}
    when 5 then number.times {move_upper_left}
    when 6 then number.times {move_lower_right}
    when 7 then number.times {move_upper_right}
    end
  end
  #----------------------------------------------------------------------------
  # move_generic
  #  mode  - flag for overriding
  #  check - turning flag
  #  dir   - direction
  #  Moves with considering the overrides. (pixel movement)
  #----------------------------------------------------------------------------
  def move_generic(mode, check, dir)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if override type of moving
    if mode == 0
      # override and set moving route
      rand(pix*2).times{@force_move.push(BlizzABS::Cache::FDirs[dir])}
    # re-routing the method
    elsif mode
      # set moving route
      pix.times{@force_move.push(BlizzABS::Cache::TDirs[dir])}
    else
      # set moving route
      pix.times{@force_move.push(BlizzABS::Cache::FDirs[dir])}
    end
  end
  #----------------------------------------------------------------------------
  # move_down
  #  mode  - flag for overriding
  #  check - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_down(mode = true, check = true)
    mode == 0 ? move_generic(mode, check, 2) : super(check)
  end
  #----------------------------------------------------------------------------
  # move_left
  #  mode  - flag for overriding
  #  check - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_left(mode = true, check = true)
    mode == 0 ? move_generic(mode, check, 4) : super(check)
  end
  #----------------------------------------------------------------------------
  # move_right
  #  mode  - flag for overriding
  #  check - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_right(mode = true, check = true)
    mode == 0 ? move_generic(mode, check, 6) : super(check)
  end
  #----------------------------------------------------------------------------
  # move_up
  #  mode  - flag for overriding
  #  check - turning flag
  #  Moves. (pixel movement)
  #----------------------------------------------------------------------------
  def move_up(mode = true, check = false)
    mode == 0 ? move_generic(mode, check, 8) : super(check)
  end
  #----------------------------------------------------------------------------
  # move_lower_left
  #  mode - overriding flag
  #  Moves diagonal. (pixel movement)
  #----------------------------------------------------------------------------
  def move_lower_left(mode = 0)
    mode == 0 ? move_generic(mode, true, 1) : super()
  end
  #----------------------------------------------------------------------------
  # move_lower_right
  #  mode - overriding flag
  #  Moves diagonal. (pixel movement)
  #----------------------------------------------------------------------------
  def move_lower_right(mode = 0)
    mode == 0 ? move_generic(mode, true, 3) : super()
  end
  #----------------------------------------------------------------------------
  # move_upper_left
  #  mode - overriding flag
  #  Moves diagonal. (pixel movement)
  #----------------------------------------------------------------------------
  def move_upper_left(mode = 0)
    mode == 0 ? move_generic(mode, true, 7) : super()
  end
  #----------------------------------------------------------------------------
  # move_upper_right
  #  mode - overriding flag
  #  Moves diagonal. (pixel movement)
  #----------------------------------------------------------------------------
  def move_upper_right(mode = 0)
    mode == 0 ? move_generic(mode, true, 9) : super()
  end
  #----------------------------------------------------------------------------
  # passable?
  #  x - x-coordinate
  #  y - y-coordinate
  #  d - direction
  #  Checks the passability. (pixel movement)
  #----------------------------------------------------------------------------
  def passable?(x, y, d)
    # calculate new coordinates
    nx = x + (d == 6 ? 1 : d == 4 ? -1 : 0)
    ny = y + (d == 2 ? 1 : d == 8 ? -1 : 0)
    # impassable if new coordinates not valid
    return false unless $game_map.self_valid?(nx, ny)
    # impassable if paralyzed
    return false if self.restriction == 4
    # passable if full passability
    return true if @full_passable
    # pixel movement rate
    pix = $BlizzABS.pixel
    # rectangle
    rect = Rect.new(nx, ny, pix, pix)
    # if an actor is in the way
    if $BlizzABS.battlers.any? {|actor|
        !actor.through && actor.character_name != '' &&
        $BlizzABS.util.rect_intersection(rect,
            Rect.new(actor.x, actor.y, pix, pix))}
      # impassable
      return false
    end
    # passability depends on basic testing
    return super
  end
  #----------------------------------------------------------------------------
  # idle?
  #  Checks whether the character is idle on the map.
  #----------------------------------------------------------------------------
  def idle?
    return (super && @force_move.size == 0)
  end
  #----------------------------------------------------------------------------
  # check_event_trigger_touch
  #  x - x-coordinate
  #  y - y-coordinate
  #  Checks event touching.
  #----------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # stop if an event is being executed already
    return false if $game_system.map_interpreter.running?
    # if any battler in the way
    if @trigger == BlizzABS::CETEventTouch && !jumping? && !over_trigger? &&
        !$game_player.through && $game_player.character_name != '' &&
        $BlizzABS.util.rect_intersection(Rect.new(x, y, pix, pix),
            Rect.new($game_player.x, $game_player.y, pix, pix))
      # start
      start 
      # started
      return true
    end
    # not started
    return false
  end
  #----------------------------------------------------------------------------
  # check_event_trigger_at
  #  x - x-coordinate
  #  y - y-coordinate
  #  Check event if it was triggered at a specific position. (pixel movement)
  #----------------------------------------------------------------------------
  def check_event_trigger_at(x, y)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if player touched this event and not jumping and not over_trigger
    if !jumping? && !over_trigger? && $BlizzABS.util.rect_intersection(
        Rect.new(@x, @y, pix, pix), Rect.new(x, y, pix, pix))
      # start
      start
      # started
      return true
    end
    # not started
    return false
  end
  
end

#==============================================================================
# Map_Remote
#------------------------------------------------------------------------------
#  This class handles remotes used in battle such as traps and projectiles. It
#  supports pixel movement and deals attack/skill/item according to the
#  battler's state when the remote was created.
#==============================================================================

class Map_Remote < Map_Battler
  
  # setting all accessible variables
  attr_reader :type
  attr_reader :group
  #----------------------------------------------------------------------------
  # Initialization
  #  character_name - spriteset file name
  #  creator        - character that created the projectile or item
  #  id             - skill id
  #  type           - which specific type of projectile
  #  target_group   - which battler groups to target
  #  dead_type      - dead or non-dead targets
  #  explode        - exploding or not
  #----------------------------------------------------------------------------
  def initialize(character_name, creator, id, type, target_group, dead_type,
                 explode)
    # call superclass method without arguments
    super()
    # id of weapon/skill/item
    @id = id
    # if exploding
    if explode != nil
      # exploding range and animation ID
      @explode_type, @explode_range, @explode_id = explode
    else
      # no explosion
      @explode_type = @explode_range = @explode_id = nil
    end
    # set type
    @type = type
    # target group
    @group = target_group
    # targeting dead or alive targets
    @dead_type = dead_type
    # set character_name
    @character_name = character_name
    # set coordinates to the same a the creator
    @real_x, @real_y = creator.real_x, creator.real_y
    # pixel movement
    pix = $BlizzABS.pixel
    # set map coordinates to real coordinates, taking pixel movement into account
    @x, @y = @real_x * pix / 128, @real_y * pix / 128
    # a number of projectiles appear instantly while other need a moment
    @request_time = (BlizzABS::REMRequest.include?(type) ? 4 : 10)
    # create array of already hit targets
    @hit = []
    # set opacity
    @opacity = 255
    # create a copy of the battler
    @battler_copy = creator.battler.clone
    # store the creator
    @creator = creator
    # set direction to the same as the creator's
    @direction = creator.direction
    # animate and goes through anything
    @walk_anime = @step_anime = @through = true
  end
  #----------------------------------------------------------------------------
  # battler
  #  Safe method that returns the battler who shot the projectile.
  #----------------------------------------------------------------------------
  def battler
    return @battler_copy
  end
  #----------------------------------------------------------------------------
  # create
  #  After creation time delay expires, the sprite is being created.
  #----------------------------------------------------------------------------
  def create
    # create own sprite
    sprite = Sprite_Character.new($scene.spriteset.viewport1, self)
    # update sprite once
    sprite.update
    # add to spriteset
    $scene.spriteset.character_sprites.push(sprite)
  end
  #----------------------------------------------------------------------------
  # execute
  #  Executes the projectile's effect.
  #----------------------------------------------------------------------------
  def execute(target = @target)
    # if skill
    if BlizzABS::REMSkills.include?(@type)
      # execute skill
      target.skill_effect(@creator, @battler_copy, $data_skills[@id])
      # check special skill effects
      $BlizzABS.check_special_skills(@creator, [target], $data_skills[@id])
    # if item
    elsif BlizzABS::REMItems.include?(@type)
      # execute item
      target.item_effect(@creator, $data_items[@id])
    else
      # execute attack
      target.attack_effect(@creator, @battler_copy)
      # if shot item
      if @type == BlizzABS::REMShotItem
        # store damage
        dmg = target.battler.damage
        # execute item
        target.item_effect(@creator, $data_items[@id])
        # if damage is a number and any damage done
        if target.battler.damage.is_a?(Numeric) &&
          (target.battler.hpdamage > 0 || target.battler.spdamage > 0)
          # add attack damage if attack damage was a number
          target.battler.damage += dmg if dmg.is_a?(Numeric)
        # if no damage done with item
        elsif target.battler.hpdamage == 0 && target.battler.spdamage == 0
          # set back to attack damage
          target.battler.damage = dmg
        end
      end
    end
    # clear damage displays
    target.battler.damage, target.battler.damage_pop = nil, false
    # add to already hit targets
    @hit.push(target)
    # sets flag for self-termination if necessary
    @terminate = true unless BlizzABS::REMPersistent.include?(@type)
  end
  #--------------------------------------------------------------------------
  # update
  #  Processes projectile movement.
  #--------------------------------------------------------------------------
  def update
    # update execution
    update_execution
    # call superclass method
    super
  end
  #--------------------------------------------------------------------------
  # requesting?
  #  Checks if the sprite can be updated already.
  #--------------------------------------------------------------------------
  def requesting?
    # decrease counter
    @request_time -= 1
    # abort method if creation request has not expired yet
    return false if @request_time > 0
    # create if scene is Scene_Map and spriteset exists
    create if $scene.is_a?(Scene_Map) && $scene.spriteset != nil
    # can update
    return true
  end
  #----------------------------------------------------------------------------
  # update_execution
  #  consider_all - considers if remote targets all enemies
  #  Updates the execution.
  #----------------------------------------------------------------------------
  def update_execution(consider_all = false)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if considering all targets
    if consider_all
      # if skill
      if BlizzABS::REMSkills.include?(@type)
        # get skill
        object = $data_skills[@id]
      else
        # get item
        object = $data_items[@id]
      end
      # new value from scope data
      consider_all = $BlizzABS.util.get_scope_data(object.scope)[2]
    end
    return if !(@fade_out || @explode_type != BlizzABS::EXPLEnd)
    # iterate through all battlers
    ($game_map.battlers + $BlizzABS.battlers).each {|battler|
        # if battler can be hit and battler and projectile intersect
        if battler.battler != nil && @group.include?(battler.ai.group) &&
            @dead_type == battler.battler.dead? &&
            $BlizzABS.util.intersection(effect_area,
            Rect.new(battler.real_x / 4, battler.real_y / 4, 32, 32))
          # execute action unless already hit
          execute(battler) unless @hit.include?(battler)
          # check explosion if exploding skill/item
          check_explosion(battler) if @explode_id
          # stop iteration if not considering all targets
          break if !consider_all
        end}
  end
  #----------------------------------------------------------------------------
  # check_explosion
  #  battler - the map battler around which the skill explodes
  #  Checks and executes exploding skills/items.
  #----------------------------------------------------------------------------
  def check_explosion(battler = @target)
    # iterate through all map battlers
    ($game_map.battlers + $BlizzABS.battlers).each {|ch|
        # get differences in coordinates
        dx, dy = ch.real_x-battler.real_x, ch.real_y-battler.real_y
        # create affection area shape
        area = Circle.new(battler.real_x / 4 + 16, battler.real_y / 4 + 16,
            @explode_range * 32, 0)
        # create target position rectangle
        rect = Rect.new(ch.real_x/4, ch.real_y/4, 32, 32)
        # if target can be hit and not already hit
        if ch.battler != nil && @group.include?(ch.ai.group) &&
            @dead_type == ch.battler.dead? &&
            $BlizzABS.util.intersection(area, rect) && !@hit.include?(ch)
          # execute action unless already hit
          execute(ch)
          # override with explosion animation if using animations
          ch.animation_id = @explode_id if BlizzABS::Config::ANIMATIONS
        end}
  end
  #----------------------------------------------------------------------------
  # turn_toward_target
  #  Same as turn_towards_player, but turning toward the destination.
  #----------------------------------------------------------------------------
  def turn_toward_target
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # calculate the differences
    dx, dy = @real_x*pix/128-@x, @real_y*pix/128-@y
    # check the differences
    if dx < 0 && dx.abs >= dy.abs # target is right
      turn_right
    elsif dx > 0 && dx.abs >= dy.abs # target is left
      turn_left
    elsif dy < 0 # target is down
      turn_down
    elsif dy > 0 # target is up
      turn_up
    end
  end
  #----------------------------------------------------------------------------
  # out_of_screen?
  #  add - how much extra out of the screen is allowed.
  #  Quick test if the projectile is out of the visible screen.
  #----------------------------------------------------------------------------
  def out_of_screen?(add = 0)
    return (self.real_x - $game_map.display_x + add < 0 ||
            self.real_x - $game_map.display_x + add > 2560 ||
            self.real_y - $game_map.display_y + add < 0 ||
            self.real_y - $game_map.display_y + add > 1920)
  end
  
end

#==============================================================================
# Map_Projectile
#------------------------------------------------------------------------------
#  This class handles projectiles used in battle. It is based on the remote
#  system.
#==============================================================================

class Map_Projectile < Map_Remote
  
  # setting all accessible variables
  attr_reader :type
  attr_reader :group
  #----------------------------------------------------------------------------
  # Initialization
  #  character_name - spriteset file name
  #  creator        - character that created the projectile or item
  #  id             - skill id
  #  distance       - how far can it go
  #  speed          - moving speed of the projectile
  #  type           - which specific type of projectile
  #  target_group   - which battler groups to target
  #  dead_type      - dead or non-dead targets
  #  explode        - exploding or not
  #----------------------------------------------------------------------------
  def initialize(character_name, creator, id, distance, speed, type,
                 target_group, dead_type = false, explode = nil)
    # call superclass method without arguments
    super(character_name, creator, id, type, target_group, dead_type, explode)
    # move in creator's facing direction slightly
    case creator.direction
    when 2 then @real_y += 64
    when 4 then @real_x -= 64
    when 6 then @real_x += 64
    when 8 then @real_y -= 64
    end
    # normal moving speed
    @normal_speed = speed
    # if distance is a fixed target
    if distance.is_a?(Game_Character)
      # set target and speed
      @target, @move_speed = distance, @normal_speed - 2
      # set projectile range
      d = ($BlizzABS.pixel == 1 ? 1 : 2)
    else
      # set target and speed
      @target, @move_speed = nil, @normal_speed
      # set projectile range
      d = ((distance - 1) * $BlizzABS.pixel).to_i
    end
    @move_speed = 1 if @move_speed < 1
    # set up final position depending on creator's facing direction
    case creator.direction
    when 2 then @y += d
    when 4 then @x -= d
    when 6 then @x += d
    when 8 then @y -= d
    end
    # create array of caught items
    @items = []
    # freeze player's action in case of returning projectile
    @creator.freeze_action = (@type == BlizzABS::REMReturning)
    # helping variable
    @accelerate = 0
  end
  #--------------------------------------------------------------------------
  # update
  #  Processes projectile movement.
  #--------------------------------------------------------------------------
  def update
    # abort if still requesting to be created
    return unless requesting?
    # update speed
    update_speed
    # update target related data
    update_target
    # turn toward the target position
    turn_toward_target
    # update projectile behavior
    update_projectile
    # call superclass method
    super
  end
  #----------------------------------------------------------------------------
  # update_speed
  #  Updates speed additions.
  #----------------------------------------------------------------------------
  def update_speed
    # if accelerating counter
    if @accelerate > 0
      # decrease accelerating counter
      @accelerate -= 1
      # accelerate if accelerating counter expired
      @move_speed = @normal_speed if @accelerate == 0
    end
    # additional stop animation updates depending on speed
    number = @move_speed - 2
    number = 1 if number < 1
    (number < 3 ? number : 3).times {update_stop}
  end
  #----------------------------------------------------------------------------
  # update_target
  #  Updates target related data.
  #----------------------------------------------------------------------------
  def update_target
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # find target or return to creator depending on the type
    case @type
    when BlizzABS::REMOnReturn then @x, @y = @creator.x, @creator.y
    when BlizzABS::REMHomingSkill, BlizzABS::REMHomingItem
      @x, @y = @target.x, @target.y
    end
    # if special type and very close to target
    if (@type == BlizzABS::REMOnReturn || @type == BlizzABS::REMHomingSkill ||
        @type == BlizzABS::REMHomingItem) &&
        Math.hypot(@x * 32 / pix - @real_x / 4, @y * 32 / pix - @real_y / 4) <= 8
      # set to target's position
      moveto(@x / pix, @y / pix)
    end
  end
  #----------------------------------------------------------------------------
  # update_projectile
  #  Updates additional projectile behavior.
  #----------------------------------------------------------------------------
  def update_projectile
    # if not moving or out of screen or non-homing projectile hitting a wall
    if !moving? || out_of_screen?(128) ||
        !BlizzABS::REMHomingBase.include?(@type) &&
        BlizzABS::Config::WALL_TAGS.include?(self.terrain_tag)
      # which internal type of projectile
      case @type
      when BlizzABS::REMReturning
        # returning projectile returns now
        @type = BlizzABS::REMOnReturn
        # set coordinates to creator's
        @x, @y = @creator.x, @creator.y
        # slow down and set acceleration count
        @move_speed, @accelerate = @normal_speed - 1, 5
      # homing skill projectile ready for pursuit
      when BlizzABS::REMInitSkill
        @type, @move_speed = BlizzABS::REMHomingSkill, @normal_speed - 1
        @accelerate = 9
      # homing item projectile ready for pursuit
      when BlizzABS::REMInitItem
        @type, @move_speed = BlizzABS::REMHomingItem, @normal_speed - 1
        @accelerate = 9
      # homing projectile hit the target
      when BlizzABS::REMHomingSkill, BlizzABS::REMHomingItem
        # execute skill/item
        execute if !@hit.include?(@target)
        # check explosion if exploding skill/item
        check_explosion(self) if @explode_id
      else
        # set termination flag
        @terminate = true
        # set all caught items' new position
        @items.each {|i| i.moveto((@real_x + 64) / 128, (@real_y + 64) / 128)}
        # unfreeze creator action
        @creator.freeze_action = false
        # check drop item
        check_drop
      end
      # correct moving speed
      @move_speed = 1 if @move_speed < 1
    end
  end
  #----------------------------------------------------------------------------
  # update_execution
  #  Updates the execution.
  #----------------------------------------------------------------------------
  def update_execution
    # if homing projetile that is pursuing a target
    if BlizzABS::REMHomingBase.include?(@type)
      # if target's and projectile's rectangles intersect
      if @target.valid? && $BlizzABS.util.intersection(effect_area,
          Rect.new(@target.real_x / 4, @target.real_y / 4, 32, 32))
        # execute action
        execute if !@hit.include?(@target)
        # check explosion if exploding skill/item
        check_explosion if @explode_id
      end
    # if not out of screen at all
    elsif !out_of_screen?
      # update skill fading
      update_skill_fade
      # update items that are being returned
      update_returning_items
      # call superclass method
      super
    end
  end
  #----------------------------------------------------------------------------
  # update_skill_fade
  #  Updates fading away effect for expiring skills.
  #----------------------------------------------------------------------------
  def update_skill_fade
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if moving and not returning projectile and close to final position
    if moving? && !BlizzABS::REMHomingExtend.include?(@type) &&
       (@real_x - @x * 128 / pix).abs < 128 && (@real_y - @y * 128 / pix).abs < 128
      # slow down
      @move_speed = @normal_speed - 1
      # correct moving speed
      @move_speed = 1 if @move_speed < 1
      # if skill
      if @type == BlizzABS::REMNormalSkill || @type == BlizzABS::REMBreakSkill
        # start fade out
        @fade_out = true
      end
    end
    # if exploding and set to explode at end of path
    if @fade_out && @explode_id && @explode_type != BlizzABS::EXPLTarget
      # explode
      check_explosion(self)
    end
  end
  #----------------------------------------------------------------------------
  # update_returning_items
  #  Updates items that are being move by returning projectiles.
  #----------------------------------------------------------------------------
  def update_returning_items
    # if not using corpses and not terminated returning projectile
    if !BlizzABS::Config::CORPSES && @type == BlizzABS::REMOnReturn &&
        !@terminate
      # iterate through all events without added items
      ($game_map.events_only - @items).each {|event|
          # if caught dropped item
          if event.dropped? && @creator == $game_player &&
              $BlizzABS.util.intersection(effect_area, Rect.new(event.real_x/4,
              event.real_y / 4, 32, 32))
            # add item into caught items array
            @items.push(event)
          end}
      # set all caught items' new position
      @items.each {|i| i.set_real_position(@real_x, @real_y)}
    end
  end
  #----------------------------------------------------------------------------
  # check_drop
  #  Checks if the projectile needs to leave a dropped item.
  #----------------------------------------------------------------------------
  def check_drop
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if dropping ammo active and floor beneath
    if BlizzABS::Config::DROP_AMMO &&
        !BlizzABS::Config::NO_FLOOR_TAGS.include?(
        $game_map.terrain_tag(@x / pix, @y / pix))
      # depending on type, drop a weapon/item
      case @type
      when BlizzABS::REMShotItem, BlizzABS::REMNormalItem,
           BlizzABS::REMBreakItem
        $BlizzABS.drop_event([$data_items[@id]], @real_x + 64, @real_y + 64)
      when BlizzABS::REMShotWeapon
        $BlizzABS.drop_event([$data_weapons[@id]], @real_x + 64, @real_y + 64)
      end
    end
  end
  #----------------------------------------------------------------------------
  # effect_area
  #  Creates own effect area for convenience.
  #----------------------------------------------------------------------------
  def effect_area
    return Rect.new(@real_x / 4 + 8, @real_y / 4 + 8, 16, 16)
  end
  #----------------------------------------------------------------------------
  # update?
  #  Overrides ABSEAL. Projectiles get terminated as soon as the get out of the
  #  screen and traps stay on the map like dropped objects.
  #----------------------------------------------------------------------------
  def update?
    return true
  end
  
end

#==============================================================================
# Map_Trap
#------------------------------------------------------------------------------
#  This class handles traps used in battle. It is based on the remote system.
#==============================================================================

class Map_Trap < Map_Remote
  
  # setting all accessible variables
  attr_reader :type
  attr_reader :group
  #----------------------------------------------------------------------------
  # Initialization
  #  character_name - spriteset file name
  #  creator        - character that created the projectile or item
  #  id             - skill id
  #  distance       - how far can it go
  #  time           - how long it stays on the map
  #  type           - which specific type of projectile
  #  target_group   - which battler groups to target
  #  dead_type      - dead or non-dead targets
  #  explode        - exploding or not
  #----------------------------------------------------------------------------
  def initialize(character_name, creator, id, distance, time, type,
                 target_group, dead_type = false, explode = nil)
    # call superclass method without arguments
    super(character_name, creator, id, type, target_group, dead_type, explode)
    # set distance and time in frames
    @distance, @time = distance, time * 40
    # store affection area
    @area = Circle.new(@real_x/4 + 16, @real_y/4 + 16, @distance * 32, 0)
  end
  #--------------------------------------------------------------------------
  # update
  #  Processes projectile movement.
  #--------------------------------------------------------------------------
  def update
    # abort if still requesting to be created
    return if !requesting? || !update?
    # set termination flag if trap expired
    @terminate = true if @time <= 0
    # decrease timer
    @time -= 1
    # call superclass method
    super
  end
  #----------------------------------------------------------------------------
  # effect_area
  #  Creates own effect area for convenience.
  #----------------------------------------------------------------------------
  def effect_area
    return @area
  end
  
end

#==============================================================================
# Map_Timed
#------------------------------------------------------------------------------
#  This class handles timed traps used in battle. It is based on normal traps.
#==============================================================================

class Map_Timed < Map_Trap
  
  #--------------------------------------------------------------------------
  # update
  #  Processes projectile movement.
  #--------------------------------------------------------------------------
  def update
    # abort if still requesting to be created
    return if !requesting? || !update?
    # if trap expired
    if @time <= 0
      # execute the timed trap
      update_execution(true)
      # execute upon self for animation
      execute(self)
      # set termination flag
      @terminate = true
    end
    # decrease timer
    @time -= 1
    # call superclass method
    super
  end
  #----------------------------------------------------------------------------
  # update_execution
  #  override - the override flag
  #  Updates the execution.
  #----------------------------------------------------------------------------
  def update_execution(override = false)
    # update only if overriding
    super(true) if override
  end
  
end

#==============================================================================
# Bitmap
#------------------------------------------------------------------------------
#  This class was enhanced with methods to support the drawing of gradient bars
#  and outlined text.
#==============================================================================

class Bitmap
  
  #----------------------------------------------------------------------------
  # gradient_bar_hud
  #  x          - x-coordinate
  #  y          - y-coordinate
  #  w          - width
  #  rate       - fill rate
  #  image_key  - image key for image used for drawing or two images
  #  change_hue - changing hue on changing fill rate
  #  Draws the HUD gradient bar.
  #----------------------------------------------------------------------------
  def gradient_bar_hud(x, y, w, rate, image_key, change_hue = 0)
    # if own bitmaps used
    if image_key.is_a?(Array)
      # set HUD bitmap
      bitmap = image_key[1]
      # draw stretched bitmap onto HUD
      stretch_blt(Rect.new(x+1, y+1, w, 12), bitmap, Rect.new(0, 0, 1, 12))
      # set HUD bitmap
      bitmap = image_key[0]
    else
      # get empty HUD bitmap
      bitmap = $BlizzABS.cache.image('empty_' + image_key)
      # draw stretched bitmap onto HUD
      stretch_blt(Rect.new(x+1, y+1, w, 12), bitmap, Rect.new(0, 0, 1, 12))
      # get HUD bitmap
      bitmap = $BlizzABS.cache.image(image_key)
    end
    # if requested hue changing bar
    if change_hue > 0
      # change hue of bitmap according to fill rate
      bitmap.hue_change((change_hue - 1.5).sgn * (1.25 - rate / 0.8) * 120 /
          (change_hue ** 2))
    end
    # draw stretched bitmap onto HUD
    stretch_blt(Rect.new(x+1, y+1, w*rate, 12), bitmap, Rect.new(0, 0, 1, 12))
  end
  #----------------------------------------------------------------------------
  # draw_circle
  #  x     - x-coordinate
  #  y     - y-coordinate
  #  rad   - radius of the circle
  #  color - fill color
  #  Draws a circle.
  #----------------------------------------------------------------------------
  def draw_circle(x, y, rad, color)
    # iterate from center to right border
    (0...rad).each {|r|
        # calculate y-coordinate from x-coordinate via trigonometric functions
        h = (rad * Math.sin(Math.acos(r/rad.to_f))).to_i
        # draw vertical bar
        fill_rect(x+rad-r-1, y+rad-h, 1, h*2+1, color)
        # draw identical vertical bar on the left side
        fill_rect(x+rad+r, y+rad-h, 1, h*2+1, color)}
  end
  #----------------------------------------------------------------------------
  # draw_text_full
  # x2    - x-coordinate
  # y2    - y-coordinate
  # w2    - width
  # h2    - height
  # text2 - text
  # a2    - align
  #  Uses an aliased version of draw_text to draw outlined text.
  #----------------------------------------------------------------------------
  # if method not aliased already
  if $tons_version == nil || $tons_version < 1.6
    # alias original method
    alias draw_text_shaded_later draw_text
  end
  def draw_text_full(x2, y2, w2 = 0, h2 = 0, text2 = '', a2 = 0)
    # if x2 is a rectangle
    if x2.is_a?(Rect)
      # set temporary variables
      x, y, w, h, text, a = x2.x, x2.y, x2.width, x2.height, y2, w2
    else
      # set temporary variables
      x, y, w, h, text, a = x2, y2, w2, h2, text2, a2
    end
    # save old font color
    save_color = self.font.color.clone
    # set new font color (black)
    self.font.color = Color.new(0, 0, 0)
    # draw text with offsets in all directions
    [x-1, x+1].each {|xx| [y-1, y+1].each {|yy|
            draw_text_shaded_later(xx, yy, w, h, text, a)}}
    # restore original color
    self.font.color = save_color
    # drw text at normal postion
    draw_text_shaded_later(x, y, w, h, text, a)
  end
  
end

#==============================================================================
# RPG::Sprite
#------------------------------------------------------------------------------
#  This class was modified so the loop animation ID can be read.
#==============================================================================

class RPG::Sprite
  
  attr_reader :loop_animation_id
  
end
  
#==============================================================================
# Sprite_Character
#------------------------------------------------------------------------------
#  This class was modified to support loop animations and custom frame numbers.
#==============================================================================

class Sprite_Character
  
  #----------------------------------------------------------------------------
  # override update
  #----------------------------------------------------------------------------
  alias upd_player_blizzabs_later update
  def update
    # check if there will be a change
    change = (@tile_id != @character.tile_id ||
        @character_name != @character.character_name ||
        @character_hue != @character.character_hue)
    # call original method
    upd_player_blizzabs_later
    # if changed and valid bitmap and valid character
    if change && self.bitmap != nil && @character != nil && @tile_id < 384
      # if graphic is an icon
      if @icon
        # use whole image
        @cw, @ch = self.bitmap.width, self.bitmap.height
        # zero offset
        self.ox, self.oy = 0, 0
        # change source rectangle position
        self.src_rect.x, self.src_rect.y = 0, 0
        # change source rectangle dimensions
        self.src_rect.width, self.src_rect.height = @cw, @ch
      # if graphic is not an icon
      else
        # change frame width
        @cw = self.bitmap.width / @character.pattern_size
        # change offset
        self.ox = @cw / 2
        # change source rectangle x
        self.src_rect.x = @character.pattern * @cw
        # change source rectangle width
        self.src_rect.width = @cw
      end
    end
    # if animation ID is different than current one
    if @character.loop_animation_id != @loop_animation_id
      # store new ID
      @loop_animation_id = @character.loop_animation_id
      # show animation loop
      loop_animation($data_animations[@loop_animation_id])
    end
  end
  
end

#==============================================================================
# Sprite_CharacterDrop
#------------------------------------------------------------------------------
#  This class was modified to support animation sprites and dropped item icon
#  display.
#==============================================================================

class Sprite_CharacterDrop < RPG::Sprite
  
  # setting all accessible variables
  attr_accessor :character
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize(viewport, character)
    # call original method
    super(viewport)
    # set the character
    @character = character
    # cache new icon bitmap
    self.bitmap = RPG::Cache.icon(@character.character_name)
    # set x and y position offset
    self.ox, self.oy = self.bitmap.width / 2, self.bitmap.height
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # call superclass method
    super
    # set x and y position
    self.x, self.y = @character.screen_x, @character.screen_y
    # set z position
    self.z = @character.screen_z(self.bitmap.height / 4) + 31
  end
  
end
  
#==============================================================================
# Sprite_CharacterCombo
#------------------------------------------------------------------------------
#  This class additionally displays the combo sprite and animation
#==============================================================================

class Sprite_CharacterCombo < RPG::Sprite
  
  # setting all accessible variables
  attr_accessor :character
  attr_accessor :combo_sprite
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize(viewport, character)
    # call original method
    super(viewport)
    # set the character
    @character = character
    # setup the sprite
    setup
    # update
    update
  end
  #--------------------------------------------------------------------------
  # setup
  #  Sets up the sprite.
  #--------------------------------------------------------------------------
  def setup
    # get the sprite file name
    @combo_sprite = ''
    @combo_sprite = @character.character_name_org if @character.combo.extension
    @combo_sprite += @character.combo.sprite
    # get the animation id
    @loop_animation_id = @character.combo.animation
    # if sprite
    if @combo_sprite != ''
      # load bitmap
      self.bitmap = RPG::Cache.character(@combo_sprite, 0)
    # no sprite
    else
      # dummy bitmap
      self.bitmap = Bitmap.new(1, 1)
    end
    # get dimesions
    @cw = bitmap.width / @character.combo.animation_frames.size
    @ch = bitmap.height / 4
    # set offsets accordingly
    self.ox = @cw / 2
    self.oy = @ch / 2 + 16
    # set source rectangle
    self.src_rect.set(0, 0, @cw, @ch)
  end
  #--------------------------------------------------------------------------
  # update
  #  Updates the sprite.
  #--------------------------------------------------------------------------
  def update
    # call superclass method
    super
    # set visible
    self.visible = (not @character.transparent)
    # set next source rectangle
    sx = @character.pattern * @cw
    sy = (@character.direction - 2) / 2 * @ch
    self.src_rect.set(sx, sy, @cw, @ch)
    # set sprite coordinates
    self.x = @character.screen_x
    self.y = @character.screen_y
    self.z = @character.screen_z(@ch) + 1
    # set opacity level
    self.opacity = @character.opacity
    # set blend method
    self.blend_type = @character.blend_type
    # set bush depth
    self.bush_depth = @character.bush_depth
    # if animation
    if @loop_animation_id != 0
      # play animation
      animation($data_animations[@loop_animation_id], true)
      # reset animation
      @loop_animation_id = 0
    end
  end
  
end

#==============================================================================
# Sprite_CharacterWeapon
#------------------------------------------------------------------------------
#  This class additionally displays the weapon sprite
#==============================================================================

class Sprite_CharacterWeapon < RPG::Sprite
  
  # setting all accessible variables
  attr_accessor :character
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize(viewport, character)
    # call original method
    super(viewport)
    # set the character
    @character = character
    # get the sprite file name
    weapon_sprite = @character.character_name_org + @character.weapon_sprite
    # load bitmap
    self.bitmap = RPG::Cache.character(weapon_sprite, 0)
    # get dimesions
    @cw = bitmap.width / @character.pattern_size
    @ch = bitmap.height / 4
    # set offsets accordingly
    self.ox = @cw / 2
    self.oy = @ch / 2 + 16
    # set source rectangle
    self.src_rect.set(0, 0, @cw, @ch)
    # upadte
    update
  end
  #--------------------------------------------------------------------------
  # update
  #  Updates the sprite.
  #--------------------------------------------------------------------------
  def update
    # call superclass method
    super
    # set visible
    self.visible = (not @character.transparent)
    # set next source rectangle
    sx = @character.pattern * @cw
    sy = (@character.direction - 2) / 2 * @ch
    self.src_rect.set(sx, sy, @cw, @ch)
    # set sprite coordinates
    self.x = @character.screen_x
    self.y = @character.screen_y
    self.z = @character.screen_z(@ch)
    # set opacity level
    self.opacity = @character.opacity
    # set blend method
    self.blend_type = @character.blend_type
    # set bush depth
    self.bush_depth = @character.bush_depth
  end
  
end

#==============================================================================
# Sprite_Damage
#------------------------------------------------------------------------------
#  This class provides damage sprite display in Blizz-ABS.
#==============================================================================
  
class Sprite_Damage < Sprite
  
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize(request, viewport = nil)
    # call superclass method
    super(viewport)
    # draw the damage
    draw_damage(request)
    # set map offsets
    @map_x, @map_y = request.x, request.y
    # set position right
    self.z = 1
    # radians of direction vector
    rad = rand(360) * Math::PI / 180
    # vector length
    @vx, @vy = -Math.cos(rad) * 3, Math.sin(rad) * 2
    # display counter
    @counter = Math::PI
    # updatet the sprite
    update
  end
  #----------------------------------------------------------------------------
  # update
  #  Updates the sprite's movement over the screen.
  #----------------------------------------------------------------------------
  def update
    # calculate offset if map display position has changed
    self.x = @map_x - self.bitmap.width / 2 - $game_map.display_x / 4
    self.y = @map_y - self.bitmap.height / 2 - $game_map.display_y / 4
    # set new offsets
    self.ox, self.oy = @vx * (@counter - Math::PI), @vy * (@counter - Math::PI)
    # increased counter
    @counter += 1
    # if using bouncing damage display
    if BlizzABS::Config::BOUNCING_DAMAGE
      # sinc function
      self.oy += (Math.sin((@counter - Math::PI) / 5.0) * 800 / (@counter)).abs
      # decrease opacity if counter high enough
      self.opacity -= 15 if @counter > 35
    else
      # wider sinc function
      self.oy += (Math.sin((@counter - Math::PI) / 10.0) * 1200 / (@counter)).abs
      # decrease opacity if counter high enough
      self.opacity -= 15 if @counter > 15
    end
    # if critical and each second frame
    if @critical && Graphics.frame_count % 2 == 0
      # make hue change animation
      self.bitmap.hue_change(60)
    end
  end
  #----------------------------------------------------------------------------
  # damage
  #  request - the damage sprite request
  #  Creates a damage text bitmap.
  #----------------------------------------------------------------------------
  def draw_damage(request)
    # get request data
    w, h = request.width, request.height
    # increase width a bit if italic text
    w += BlizzABS::Cache::FontSizeDamage / 6 if BlizzABS::Cache::FontItalicDamage
    # increase width a bit if bold text
    w += BlizzABS::Cache::FontSizeDamage / 6 if BlizzABS::Cache::FontBoldDamage
    # create real bitmap
    self.bitmap = Bitmap.new(w, h)
    # set font
    self.bitmap.font.name = BlizzABS::Cache::FontNameDamage
    # set font size
    self.bitmap.font.size = BlizzABS::Cache::FontSizeDamage
    # set font color
    self.bitmap.font.color = BlizzABS::Cache::DMGColors['Shadow']
    # set font italic
    self.bitmap.font.italic = BlizzABS::Cache::FontItalicDamage
    # set font bold
    self.bitmap.font.bold = BlizzABS::Cache::FontBoldDamage
    # draw text with offsets in all directions
    self.bitmap.draw_text_shaded_later(-1, -1, w, h, request.damage, 1)
    self.bitmap.draw_text_shaded_later(2, 2, w, h, request.damage, 1)
    self.bitmap.draw_text_shaded_later(2, -1, w, h, request.damage, 1)
    self.bitmap.draw_text_shaded_later(-1, 2, w, h, request.damage, 1)
    # get damage color
    self.bitmap.font.color = request.color
    # draw damage string
    self.bitmap.draw_text_shaded_later(0, 0, w, h, request.damage, 1)
    # set critical flag
    @critical = request.critical
  end 
  
end

#==============================================================================
# Control_Sprite_Character
#------------------------------------------------------------------------------
#  This class is an interception class for Sprite_Character. It substitutes its
#  instances everywhere and handles them. It provides ABSEAL limitation
#  control, damage sprite control and enemy fade_in/dying animations.
#  It disposes sprites out of the ABSEAL range immediately.
#==============================================================================

class Control_Sprite_Character
  
  # setting all accessible variables
  attr_accessor :fade_in
  attr_accessor :dying
  attr_accessor :respawning
  attr_accessor :fade_out
  attr_accessor :select
  attr_reader   :character
  attr_reader   :damage
  #----------------------------------------------------------------------------
  # Initialization
  #  viewport  - a viewport
  #  character - the character to observe and display
  #----------------------------------------------------------------------------
  def initialize(viewport, character = nil)
    # set all flags
    @fade_in = @dying = @fade_out = @respawning = false
    # set select animation mode and health bar width
    @select = 0
    # store character
    self.character = character
    # store viewport
    @viewport = viewport
  end
  #----------------------------------------------------------------------------
  # character=
  #  char - the new character to observe and display
  #  Gives the character to the sprite as well if it exists.
  #----------------------------------------------------------------------------
  def character=(char)
    # store character
    @character = char
    # give character to sprite if sprite exists
    @sprite.character = char if @sprite != nil
    # set battler ID
    @battler_id = (@character.is_a?(Map_Battler) ? @character.battler_id : nil)
  end
  #----------------------------------------------------------------------------
  # update
  #  Processes sprite update if the sprite exists. If not, it tests if the
  #  character is within ABSEAL range and creates a sprite. Every sprite
  #  which's character is outside of ABSEAL gets disposed.
  #----------------------------------------------------------------------------
  def update
    # if character within ABSEAL range or special character
    if self.character_valid?
      # if sprite doesn't exists yet
      if @sprite == nil || @sprite.disposed?
        # if dropped item needs an icon spriteset
        if @character.icondrop
          # create a drop sprite
          @sprite = Sprite_CharacterDrop.new(@viewport, @character)
        else
          # create a sprite
          @sprite = Sprite_Character_ABSEAL_ed.new(@viewport, @character)
        end
        # create health sprite
        create_health_sprite
        # update health bar if health bar exists
        update_health if @health != nil
      else
        # if destruction sprite exists
        if @destruct != nil
          # update it
          @destruct.update
        # if respawning sprite exists
        elsif @respawn != nil
          # update it
          @respawn.update
        # if map battler
        elsif @character.is_a?(Map_Battler) && !@character.is_a?(Map_Remote)
          # if character needs new combo sprite
          if @character.new_combo_sprite
            # dispose old sprite if it exists
            @combo.dispose if @combo != nil
            # create combo sprite
            @combo = Sprite_CharacterCombo.new(@viewport, @character)
            # reset flag
            @character.new_combo_sprite = false
          # if still using combo sprite
          elsif @character.combo != nil && @combo != nil
            # update combo sprite
            @combo.update
          elsif @combo != nil
            # delete combo sprite
            @combo.dispose
            @combo = nil
          end
          # if weapon sprite doesn't exist
          if @weapon == nil
            # if character using weapon
            if @character.weapon_sprite != ''
              # create weapon sprite
              @weapon = Sprite_CharacterWeapon.new(@viewport, @character)
            end
          # if still using weapon sprite
          elsif @character.weapon_sprite != ''
            # update weapon sprite
            @weapon.update
          else
            # delete weapon sprite
            @weapon.dispose
            @weapon = nil
          end
          if @character.ai.act.defend?
            # show running away animation
            @character.loop_animation_id = BlizzABS::Config::DEFEND_ANIMATION_ID
          # if running away
          elsif @character.ai.act.escape?
            # show running away animation
            @character.loop_animation_id = BlizzABS::Config::FLEE_ANIMATION_ID
          else
            # set state animation if battler exists
            @character.loop_animation_id = (@character.battler == nil ? 0 :
                @character.battler.state_animation_id)
          end
        else
          # no animation
          @character.loop_animation_id = 0
        end
        # update the sprite itself
        @sprite.update
        # update selection animation
        update_select
        # if battler exists and not dead
        if @character.is_a?(Map_Battler) && @character.valid?
          # create health sprite if health sprite doesn't exist yet
          create_health_sprite if @health == nil
          # if Tons of Add-ons is there and using Doom Status with timer
          if $tons_version != nil && $tons_version >= 6.2 &&
              $game_system.DOOM_STATUS && DOOM_TIMER_VISIBLE
            # update doom sprites
            update_doom_sprites
          end
        end
        # update health bar if health bar exists and character is not dead
        update_health if @health != nil && !@character.battler.dead?
      end
    # if sprite exists
    elsif @sprite != nil
      # delete sprite if it exists and not freed yet
      @sprite.dispose unless @sprite.disposed?
      # delete health sprite if it exists and not freed yet
      @health.dispose unless @health == nil || @health.disposed?
      # delete weapon sprite if it exists and not freed yet
      @weapon.dispose unless @weapon == nil || @weapon.disposed?
      # delete doom counter sprite if it exists and not freed yet
      @doom.dispose unless @doom == nil || @doom.disposed?
      # remove sprite from memory
      @sprite = @health = @hp = @weapon = @doom = nil
    end
  end
  #----------------------------------------------------------------------------
  # character_valid?
  #  Checks if this sprite should be displayed and updated.
  #----------------------------------------------------------------------------
  def character_valid?
    return (@character.is_a?(Game_Event) || @character.is_a?(Map_Enemy) &&
        @character.precondition || @character.is_a?(Map_Remote) ||
        @character.dropped?) && @character.update? ||
        !@character.is_a?(Map_Enemy) && !@character.is_a?(Map_Remote) &&
        @character.is_a?(Map_Battler)
  end
  #----------------------------------------------------------------------------
  # update_select
  #  Updates the animation when selecting a map battler.
  #----------------------------------------------------------------------------
  def update_select
    # stop if the enemy is invisible/has not sprite
    return if @sprite == nil
    # if normal blink should be processed
    if @select == 2
      # set blink
      @sprite.blink_on
    # if selected right now
    elsif @select == 1
      # set color with new alpha
      @sprite.color.set(0, 255, 0, (8 - Graphics.frame_count % 16).abs * 24)
    else
      # set to no color
      @sprite.color.set(0, 0, 0, 0)
    end
  end
  #----------------------------------------------------------------------------
  # update_doom_sprites
  #  Updates a counter sprites for the Doom Status Effect.
  #----------------------------------------------------------------------------
  def update_doom_sprites
    # get all doom status effects
    dooms = @character.battler.states.find_all {|i| DOOM_IDS.include?(i)}
    # if at least one exists
    if dooms.size > 0
      # if sprite doesn't exist yet
      if @doom == nil
        # create sprite
        @doom = Sprite.new
        # create bitmap
        @doom.bitmap = Bitmap.new(48, 48)
        # setup font
        @doom.bitmap.font.name = DOOM_FONT
        @doom.bitmap.font.size = DOOM_SIZE
      end
      # setup timer coordinates
      @doom.x, @doom.y = @sprite.x, @sprite.y
      @doom.ox, @doom.oy = 24, 24
      @doom.z = @sprite.z + 100
      # additional coordinate setup
      case DOOM_TIMER_POSITION
      when 1 then @doom.y -= @sprite.bitmap.height/4
      when 2 then @doom.oy /= 2
      end
      # if time counter exists and changed
      if @character.battler.state_time[dooms[0]] != nil &&
          @time_left != (@character.battler.state_time[dooms[0]]+38) / 40
        # update timer counter
        @time_left = (@character.battler.state_time[dooms[0]]+38) / 40
        # delete display
        @doom.bitmap.clear
        # if last turn
        if @time_left == 0
          # kill self
          @character.battler.hp = 0
        else
          # draw new timer count
          @doom.bitmap.draw_text_full(0, 0, 48, 32, @time_left.to_s, 1)
        end
      end
    # if doom sprite exists
    elsif @doom != nil
      # delete it
      @doom.dispose
      @doom = nil
    end
  end
  #----------------------------------------------------------------------------
  # create_health_sprite
  #  Creates a health sprite.
  #----------------------------------------------------------------------------
  def create_health_sprite
    # if health bars active and observing enemy
    if BlizzABS::Config::ENEMY_HEALTH_BARS > 0 &&
        @character.is_a?(Map_Enemy) && !@character.hide_health &&
        @character.opacity > 0
      # create a sprite
      @health = Sprite.new(@viewport)
      # whether ENEMY_HEALTH_BARS_MATCH_WIDTH is active and tile graphic
      if @character.tile_id < 384 &&
          BlizzABS::Config::ENEMY_HEALTH_BARS_MATCH_WIDTH
        # set the width
        width = @sprite.bitmap.width / 4
      else
        # set the width to default
        width = 32
      end
      # x offset
      @health.ox = width / 2
      # create bitmap
      @health.bitmap = Bitmap.new(width, 6)
      # fill bitmap background for better display
      @health.bitmap.fill_rect(0, 0, width, 6, Color.new(0, 26, 0))
      # set health bar z coordinate
      @health.z = 1
      # set health bar opacity
      @health.opacity = BlizzABS::Config::ENEMY_HEALTH_BARS
    end
  end
  #----------------------------------------------------------------------------
  # update_health
  #  Handles health sprite updating.
  #----------------------------------------------------------------------------
  def update_health
    # move health sprite along with sprite
    @health.x = @sprite.x
    @health.y = @sprite.y - @sprite.oy - 6
    @health.z = @sprite.z + 1
    # if enemy HP have changed
    if @hp != @character.battler.hp || @battler_id != @character.battler_id
      # rate of filling
      rate = @character.battler.hp.to_f / @character.battler.maxhp
      # get empty bar bitmap
      bitmaps = [$BlizzABS.cache.image('empty_enemy_bar'),
          $BlizzABS.cache.image('enemy_bar')]
      # change hue of bar bitmap
      bitmaps[1].hue_change((rate / 0.8 - 1.25) * 120)
      # temporary variable
      width = @health.bitmap.width - 2
      # draw empty bar bitmap
      @health.bitmap.stretch_blt(Rect.new(1, 0, width, 6), bitmaps[0],
          Rect.new(0, 0, 1, 6))
      # draw bar bitmap
      @health.bitmap.stretch_blt(Rect.new(1, 0, rate * width, 6), bitmaps[1],
          Rect.new(0, 0, 1, 6))
      # store new values
      @hp, @battler_id = @character.battler.hp, @character.battler_id
    end
  end
  #----------------------------------------------------------------------------
  # in_screen?
  #  Tests the sprite if inside the screen if it exists.
  #----------------------------------------------------------------------------
  def in_screen?
    return (@sprite != nil && @sprite.in_screen?)
  end
  #----------------------------------------------------------------------------
  # x
  #  Returns the sprite's x-coordinate.
  #----------------------------------------------------------------------------
  def x
    return (@sprite != nil ? @sprite.x : 0)
  end
  #----------------------------------------------------------------------------
  # y
  #  Returns the sprite's y-coordinate.
  #----------------------------------------------------------------------------
  def y
    return (@sprite != nil ? @sprite.y : 0)
  end
  #----------------------------------------------------------------------------
  # z
  #  Returns the sprite's z-coordinate.
  #----------------------------------------------------------------------------
  def z
    return (@sprite != nil ? @sprite.z : 0)
  end
  #----------------------------------------------------------------------------
  # z=
  #  Sets the sprite's z-coordinate.
  #----------------------------------------------------------------------------
  def z=(val)
    @sprite.z = val if @sprite != nil
  end
  #----------------------------------------------------------------------------
  # update_die
  #  Emulates a destruction engine using animation for maximum performance and
  #  processes a special 18-frame fading out animation that is used to display
  #  dying enemies if destruction engine isn't being used for a specific enemy.
  #----------------------------------------------------------------------------
  def update_die
    # if summoned
    if $BlizzABS.summoned?(@character)
      # get unsummon ID
      id = BlizzABS::Config::UNSUMMON_ANIMATION_ID
    else
      # get animation ID for destruction engine emulator
      id = BlizzABS::Enemies.destruct(@character.battler_id)
    end
    # if actually existing and dead or already dying
    if @character.battler != nil && @character.battler.dead? &&
        ($BlizzABS.summoned?(@character) || @character.is_a?(Map_Enemy) &&
        !@character.starting) || @destruct != nil
      # remove respawning flag
      @respawning = false
      # if no animation specified, Blizz-ABS default is being used
      if id == 0 || @destruct != nil && @destruct.effect? ||
          $BlizzABS.summoned?(@character)
        # set character loop animation ID to 0
        @character.loop_animation_id = 0
        # if normal blending
        if @character.blend_type == 0 && @character.precondition
          # set blending to positive
          @character.blend_type = 1
          # if health sprite exists and not freed yet
          unless @health == nil || @health.disposed?
            # delete health sprite and data
            @health.dispose
            @health = @hp = nil
          end
          # if not actor
          unless @character.is_a?(Map_Actor)
            # play collapse sound effect
            $game_system.se_play($data_system.enemy_collapse_se)
          end
        end
        # if still fading out
        if @character.opacity > 0
          # decrease opacity
          @character.opacity -= 15
        else
          # set blend type to normal
          @character.blend_type = 0
          # set termination flag
          @character.terminate = true
        end
      # if sprite exists and no animation is being played upon
      elsif @sprite != nil && (@destruct == nil || !@destruct.effect?)
        # if blend flag set
        if @character.blend_type == 1
          # set termination flag
          @character.terminate = true
        else
          # delete health sprite if it exists and not freed yet
          @health.dispose unless @health == nil || @health.disposed?
          @health = @hp = nil
          # set character loop animation ID to 0
          @character.loop_animation_id = 0
          # create a new sprite
          @destruct = Sprite_Character_ABSEAL_ed.new(nil, @character)
          # set new animation ID
          @character.animation_id = id
          # reset action sprite
          @character.character_name = @character.character_name_org
          # reset spriteset extension and weapon sprite
          @character.current_sprite = @character.weapon_sprite = ''
          # set blending type as flag
          @character.blend_type = 1
          # decrease opacity
          @character.opacity -= 15
          # update all sprites
          [@destruct, @weapon, @sprite].each {|s| s.update if s != nil}
          # get source rectangle
          rect = @sprite.src_rect.clone
          # use new bitmap for destruction engine
          @destruct.bitmap = @sprite.bitmap =
              RPG::Cache.character(@character.character_name, 0).clone
          # clear bitmap
          @sprite.bitmap.clear
          # restore source rectangle
          @destruct.src_rect = @sprite.src_rect = rect
        end
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_respawn
  #  Emulates a destruction engine using animation for maximum performance and
  #  processes a special 18-frame fading out animation that is used to display
  #  dying enemies if destruction engine isn't being used for a specific enemy.
  #----------------------------------------------------------------------------
  def update_respawn
    # get animation ID for destruction engine emulator
    id = BlizzABS::Enemies.respawn(@character.battler_id)
    # if no animation specified
    if id == 0
      # set fade in flag and reset respawning flag
      @fade_in, @respawning = true, false
    # if sprite exists
    elsif @sprite != nil
      # if respawning sprite doesn't exist
      if @respawn == nil
        # reset opacity
        @character.opacity = 255
        # create a new sprite
        @respawn = Sprite_Character_ABSEAL_ed.new(nil, @character)
        # set new animation ID
        @character.animation_id = id
        # update all sprites
        [@respawn, @weapon, @sprite].each {|s| s.update if s != nil}
        # use new bitmap for respawning animation
        @respawn.bitmap = @sprite.bitmap.clone
        # clear bitmap
        @respawn.bitmap.clear
        # set source rectangle
        @respawn.src_rect = @sprite.src_rect.clone
      # if no animation is being played
      elsif !@respawn.effect?
        # reset respawning flag
        @respawning = false
        # delete sprite
        @respawn.dispose
        @respawn = nil
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_fade_in
  #  Processes an 18-frame fading in animation.
  #----------------------------------------------------------------------------
  def update_fade_in
    # if still fading in
    if @character.opacity < 255
      # increase opacity
      @character.opacity += 15
    # if opacity is 255
    elsif @character.opacity == 255
      # set fade_in flag
      @fade_in = false
    end
  end
  #----------------------------------------------------------------------------
  # update_fade_out
  #  Processes a 5-frame fading out animation.
  #----------------------------------------------------------------------------
  def update_fade_out
    # if still fading out
    if @character.opacity > 0
      # decrease opacity
      @character.opacity -= 64
    else
      # reset fade_out flag
      @character.fade_out = false
    end
  end
  #----------------------------------------------------------------------------
  # dispose
  #  Deletes and removes sprite from memory.
  #----------------------------------------------------------------------------
  def dispose
    # delete sprite if it and not freed yet
    @sprite.dispose unless @sprite == nil || @sprite.disposed?
    # delete destruction sprite if it exists and not freed yet
    @destruct.dispose unless @destruct == nil || @destruct.disposed?
    # delete respawning sprite if it exists and not freed yet
    @respawn.dispose unless @respawn == nil || @respawn.disposed?
    # delete health sprite if it exists and not freed yet
    @health.dispose unless @health == nil || @health.disposed?
    # delete weapon sprite if it exists and not freed yet
    @weapon.dispose unless @weapon == nil || @weapon.disposed?
    # delete doom counter sprite if it exists and not freed yet
    @doom.dispose unless @doom == nil || @doom.disposed?
    # remove them all
    @sprite = @destruct = @respawn = @health = @hp = @weapon = @doom = nil
  end
  
end

Sprite_Character_ABSEAL_ed = Sprite_Character
Sprite_Character = Control_Sprite_Character

#==============================================================================
# Hud
#------------------------------------------------------------------------------
#  This class was modified to support SR display and modify the number of
#  skills left to use.
#==============================================================================

class Hud < Sprite
  
  #----------------------------------------------------------------------------
  # Initialization
  #  viewport - the viewport for the sprite
  #----------------------------------------------------------------------------
  def initialize(viewport = nil)
    # call superclass method
    super
    # create positions
    create_positions
    # get height
    h = BlizzABS::Config::DIRECT_HOTKEYS ? @hud_height - 28 : @hud_height
    # create bitmap
    self.bitmap = Bitmap.new(@hud_width, h)
    # set font
    self.bitmap.font.name = 'Arial'
    # set font size
    self.bitmap.font.size = 16
    # set font to bold
    self.bitmap.font.bold = true
    # set x, y position depending on which HUD mode
    case BlizzABS::Config::HUD_POSITION
    when 0 then self.x, self.y = 4, 4
    when 1 then self.x, self.y = 640 - self.bitmap.width - 4, 4
    when 2 then self.x, self.y = 4, 364
    end
    # set z coordinate
    self.z = 1000
    # draw basic HUD
    draw_basic
    # update
    update
  end
  #----------------------------------------------------------------------------
  # create_positions
  #  Sets drawing positions. Can be aliased and the positions modified to
  #  create a different HUD.
  #----------------------------------------------------------------------------
  def create_positions
    @original_width = @hud_width = 156
    @original_height = @hud_height = 81
    @name_x, @name_y, @level_x, @level_y = 4, 1, 112, 1
    @hp_x, @hp_y, @sp_x, @sp_y = 4, 17, 4, 33
    @hot_x, @hot_y, @left_x, @left_y = 4, 49, 8, 63
  end
  #----------------------------------------------------------------------------
  # draw_basic
  #  Draws the HUD template.
  #----------------------------------------------------------------------------
  def draw_basic
    # fill with grey rectangle
    self.bitmap.fill_rect(0, 0, self.bitmap.width, self.bitmap.height,
        Color.new(0, 0, 0, 128))
    # determine color depending on HUD style
    color = case BlizzABS::Config::HUD_TYPE
    when 0 then Color.new(255, 255, 255, 192)
    when 1 then Color.new(0, 0, 0, 0)
    end
    # if color exists
    if color.is_a?(Color)
      # draw outline in color
      self.bitmap.fill_rect(@hp_x+32, @hp_y+3, 116, 14, color)
      # draw outline in color
      self.bitmap.fill_rect(@sp_x+32, @sp_y+3, 116, 14, color)
    end
    # set font color
    self.bitmap.font.color = system_color
    # draw "LV"
    self.bitmap.draw_text_full(@level_x, @level_y, 20, 20, 'LV')
    # if direct hotkey option is turned off
    unless BlizzABS::Config::DIRECT_HOTKEYS
      # draw "Skill:"
      self.bitmap.draw_text_full(@hot_x, @hot_y, 48, 20, 'Skill:')
      # draw "Item:"
      self.bitmap.draw_text_full(@hot_x+76, @hot_y, 48, 20, 'Item:')
    end
    # draw "HP"
    self.bitmap.draw_text_full(@hp_x, @hp_y, 32, 20, $data_system.words.hp)
    # draw "SP"
    self.bitmap.draw_text_full(@sp_x, @sp_y, 32, 20, $data_system.words.sp)
  end
  #----------------------------------------------------------------------------
  # draw_empty
  #  Draws the HP and SP display when actor doesn't exist.
  #----------------------------------------------------------------------------
  def draw_empty
    # draw empty bars
    self.bitmap.gradient_bar_hud(@hp_x + 32, @hp_y + 3, 114, 0, 'hud_green_bar', 1)
    # draw empty bars
    self.bitmap.gradient_bar_hud(@sp_x + 32, @sp_y + 3, 114, 0, 'hud_blue_bar', 2)
    # set font color
    self.bitmap.font.color = disabled_color
    # draw empty HP
    self.bitmap.draw_text_full(@hp_x + 38, @hp_y, 48, 20, '0', 2)
    self.bitmap.draw_text_full(@hp_x + 86, @hp_y, 12, 20, '/', 1)
    self.bitmap.draw_text_full(@hp_x + 98, @hp_y, 48, 20, '0')
    # draw empty SP
    self.bitmap.draw_text_full(@sp_x + 38, @sp_y, 48, 20, '0', 2)
    self.bitmap.draw_text_full(@sp_x + 86, @sp_y, 12, 20, '/', 1)
    self.bitmap.draw_text_full(@sp_x + 98, @sp_y, 48, 20, '0')
    # reset all flag variables
    @name = @level = @hp = @sp = @maxhp = @maxsp = @exp = @states = @skill =
        @skills_left = @item = @items_left = @gold = nil
  end
  #----------------------------------------------------------------------------
  # draw_name
  #  Draws the name display.
  #----------------------------------------------------------------------------
  def draw_name
    # set current variable
    @name = actor.name
    # remove old display
    self.bitmap.fill_rect(@name_x, @name_y, 104, 19, Color.new(0, 0, 0, 128))
    # set font color
    self.bitmap.font.color = Color.new(0, 255, 0)
    # draw actor's name
    self.bitmap.draw_text_full(@name_x, @name_y, 104, 20, @name)
  end
  #----------------------------------------------------------------------------
  # draw_level
  #  Draws the level display.
  #----------------------------------------------------------------------------
  def draw_level
    # set current variable
    @level = actor.level
    # remove old display
    self.bitmap.fill_rect(@level_x+20, @level_y, 20, 19, Color.new(0, 0, 0, 128))
    # set font color
    self.bitmap.font.color = normal_color
    # draw actor's level
    self.bitmap.draw_text_full(@level_x+20, @level_y, 20, 20, @level.to_s, 2)
  end
  #----------------------------------------------------------------------------
  # draw_hp
  #  Draws the HP display.
  #----------------------------------------------------------------------------
  def draw_hp
    # set current variables
    @hp, @maxhp = actor.hp, actor.maxhp
    # set fill rate
    rate = (@maxhp > 0 ? @hp.to_f / @maxhp : 0)
    # draw gradient bar
    self.bitmap.gradient_bar_hud(@hp_x+32, @hp_y+3, 114, rate, 'hud_green_bar', 1)
    # set font color depending on how many HP left
    self.bitmap.font.color = @hp == 0 ? knockout_color :
        @hp <= @maxhp / 4 ? crisis_color : normal_color
    # draw HP
    self.bitmap.draw_text_full(@hp_x+38, @hp_y, 48, 20, @hp.to_s, 2)
    # set color
    self.bitmap.font.color = normal_color
    # draw "/"
    self.bitmap.draw_text_full(@hp_x+86, @hp_y, 12, 20, '/', 1)
    # draw max HP
    self.bitmap.draw_text_full(@hp_x+98, @hp_y, 48, 20, @maxhp.to_s)
  end
  #----------------------------------------------------------------------------
  # draw_sp
  #  Draws the SP display.
  #----------------------------------------------------------------------------
  def draw_sp
    # set current variables
    @sp, @maxsp = actor.sp, actor.maxsp
    # set fill rate
    rate = (@maxsp > 0 ? @sp.to_f / @maxsp : 0)
    # draw gradient bar
    self.bitmap.gradient_bar_hud(@sp_x+32, @sp_y+3, 114, rate, 'hud_blue_bar', 2)
    # set font color depending on how many SP left
    self.bitmap.font.color = @sp == 0 ? knockout_color :
        @sp <= @maxsp / 4 ? crisis_color : normal_color
    # draw SP
    self.bitmap.draw_text_full(@sp_x+38, @sp_y, 48, 20, @sp.to_s, 2)
    # set font color
    self.bitmap.font.color = normal_color
    # draw "/"
    self.bitmap.draw_text_full(@sp_x+86, @sp_y, 12, 20, '/', 1)
    # draw max SP
    self.bitmap.draw_text_full(@sp_x+98, @sp_y, 48, 20, @maxsp.to_s)
  end
  #----------------------------------------------------------------------------
  # draw_hskill
  #  Draws the hot skill display.
  #----------------------------------------------------------------------------
  def draw_hskill
    # set current variable
    @skill = actor.skill
    # remove old display
    self.bitmap.fill_rect(@hot_x+48, @hot_y+4, 24, 24, Color.new(0, 0, 0, 128))
    # if skill hot skill exists
    if @skill != 0
      # load bitmap
      bitmap = RPG::Cache.icon($data_skills[@skill].icon_name)
      # draw bitmap
      self.bitmap.blt(@hot_x+48, @hot_y+4, bitmap, Rect.new(0, 0, 24, 24))
    end
    # removes skills left to use display
    draw_lskill
  end
  #----------------------------------------------------------------------------
  # draw_lskill
  #  Draws the skills left to use display.
  #----------------------------------------------------------------------------
  def draw_lskill
    # remove old display
    self.bitmap.fill_rect(@left_x, @left_y+4, 24, 16, Color.new(0, 0, 0, 128))
    # get the number of skills left
    @skills_left = get_skills_left
    # if hot skill exists
    if @skill != nil && @skill > 0
      # if normal SP cost
      if @skills_left >= 0
        # if not enough sp to use
        if @skills_left == 0
          # set font color
          self.bitmap.font.color = Color.new(255, 0, 0)
        # if enough SP for 5 or less skill uses
        elsif @skills_left <= 5
          # set font color
          self.bitmap.font.color = Color.new(255, 255, 0)
        else
          # set font color
          self.bitmap.font.color = normal_color
        end
        # decrease font color
        self.bitmap.font.size -= 2
        # draw number how many skills left to use
        self.bitmap.draw_text_full(@left_x, @left_y, 24, 20, @skills_left.to_s, 1)
        # increase font size
        self.bitmap.font.size += 2
      # if infinite skills left
      elsif @skills_left == -1
        # set font color
        self.bitmap.font.color = Color.new(0, 255, 0)
        # increase font size
        self.bitmap.font.size += 4
        # draw "∞" skill uses left
        self.bitmap.draw_text_full(@left_x, @left_y, 24, 20, '∞', 1)
        # decrease font size
        self.bitmap.font.size -= 4
      end
    end
  end
  #----------------------------------------------------------------------------
  # get_skills_left
  #  Gets the number of skill usages left.
  #----------------------------------------------------------------------------
  def get_skills_left
    # flat if skill is not hot skill or does not exist
    return -2 if @skill == nil || @skill == 0
    # infinite usages if SP cost is zero
    return -1 if $data_skills[@skill].sp_cost == 0
    # get basic SP cost
    sp_cost = $data_skills[@skill].sp_cost
    # if using SP Cost Mod Status
    if $tons_version != nil && $tons_version >= 6.54 &&
        $game_system.SP_COST_MOD
      # get modified cost
      sp_cost = BlizzCFG.get_cost_mod(actor.states, sp_cost)
    end
    # infinite
    return -1 if sp_cost == 0
    # calculate skills left to use
    return (@sp / sp_cost)
  end
  #----------------------------------------------------------------------------
  # draw_hitem
  #  Draws the hot item display.
  #----------------------------------------------------------------------------
  def draw_hitem
    # set current variable
    @item = actor.item
    # remove old display
    self.bitmap.fill_rect(@hot_x+124, @hot_y+4, 24, 24, Color.new(0, 0, 0, 128))
    # if hot item exists
    if @item != 0
      # load bitmap
      bitmap = RPG::Cache.icon($data_items[@item].icon_name)
      # draw bitmap
      self.bitmap.blt(@hot_x+124, @hot_y+4, bitmap, Rect.new(0, 0, 24, 24))
    end
    # removes items left to use display
    draw_litem
  end
  #----------------------------------------------------------------------------
  # draw_litem
  #  Draws the items left to use display.
  #----------------------------------------------------------------------------
  def draw_litem
    # set current variable
    @items_left = $game_party.item_number(@item)
    # remove old display
    self.bitmap.fill_rect(@left_x+76, @left_y+4, 24, 16, Color.new(0, 0, 0, 128))
    # if hot item exists
    if @item != nil && @item > 0
      # if item exists and cannot be consumed
      if $data_items[@item] != nil && !$data_items[@item].consumable
        # set font color
        self.bitmap.font.color = Color.new(0, 255, 0)
        # increase font size
        self.bitmap.font.size += 4
        # draw "∞" items left
        self.bitmap.draw_text_full(@left_x+76, @left_y, 24, 20, '∞', 1)
        # decrease font size
        self.bitmap.font.size -= 4
      else
        # if no items left
        if @items_left == 0
          # set font color
          self.bitmap.font.color = Color.new(255, 0, 0)
        # if equal or less items left
        elsif @items_left <= 10
          # set font color
          self.bitmap.font.color = Color.new(255, 255, 0)
        else
          # set font color
          self.bitmap.font.color = normal_color
        end
        # decrease font color
        self.bitmap.font.size -= 2
        # draw number how many items left to use
        self.bitmap.draw_text_full(@left_x+76, @left_y, 24, 20, @items_left.to_s, 1)
        # increase font size
        self.bitmap.font.size += 2
      end
    end
  end
  #----------------------------------------------------------------------------
  # update
  #  Checks if HUD needs refreshing.
  #----------------------------------------------------------------------------
  def update
    # if actor doesn't exist
    if actor == nil
      # unless already drawn empty HUD
      unless @empty_hud_drawn
        # draw HUD template
        draw_basic
        # draw empty HP, SP and EXP bars
        draw_empty
        # empty HUD was drawn
        @empty_hud_drawn = true
      end
    else
      # if HUD needs refresh
      if $game_temp.hud_refresh
        # draw all data about actor
        draw_name
        draw_level
        draw_hp
        draw_sp
        unless BlizzABS::Config::DIRECT_HOTKEYS
          draw_hskill
          draw_lskill
          draw_hitem
          draw_litem
        end
        # remove flag
        $game_temp.hud_refresh = nil
      else
        # draw data that needs to ve updated
        test_name
        test_level
        test_hp
        test_sp
        unless BlizzABS::Config::DIRECT_HOTKEYS
          test_hskill
          test_lskill
          test_hitem
          test_litem
        end
      end
      # empty HUD wasn't drawn
      @empty_hud_drawn = false
    end
  end
  #----------------------------------------------------------------------------
  # test_name
  #  Tests and draws the name.
  #----------------------------------------------------------------------------
  def test_name
    # draw new name if name has changed
    draw_name if actor.name != @name
  end
  #----------------------------------------------------------------------------
  # test_level
  #  Tests and draws the level.
  #----------------------------------------------------------------------------
  def test_level
    # draw new level if level has changed
    draw_level if actor.level != @level
  end
  #----------------------------------------------------------------------------
  # test_hp
  #  Tests and draws the HP.
  #----------------------------------------------------------------------------
  def test_hp
    # draw new HP if HP or max HP have changed
    draw_hp if actor.hp != @hp || actor.maxhp != @maxhp
  end
  #----------------------------------------------------------------------------
  # test_sp
  #  Tests and draws the SP.
  #----------------------------------------------------------------------------
  def test_sp
    # draw new SP if SP or max SP have changed
    draw_sp if actor.sp != @sp || actor.maxsp != @maxsp
  end
  #----------------------------------------------------------------------------
  # test_hskill
  #  Tests and draws the hskill.
  #----------------------------------------------------------------------------
  def test_hskill
    # draw new skill icon if assigned skill has changed
    draw_hskill if actor.skill != @skill
  end
  #----------------------------------------------------------------------------
  # test_lskill
  #  Tests and draws the lskill.
  #----------------------------------------------------------------------------
  def test_lskill
    # draw how many skills left to use if this number has changed
    draw_lskill if get_skills_left != @skills_left
  end
  #----------------------------------------------------------------------------
  # test_hitem
  #  Tests and draws the hitem.
  #----------------------------------------------------------------------------
  def test_hitem
    # draw new item icon if assigned item has changed
    draw_hitem if actor.item != @item
  end
  #----------------------------------------------------------------------------
  # test_litem
  #  Tests and draws the litem.
  #----------------------------------------------------------------------------
  def test_litem
    # draw how many items left to use if this number has changed
    draw_litem if $game_party.item_number(@item) != @items_left
  end
  #----------------------------------------------------------------------------
  # actor
  #  Returns the party leader's battler for easier reference.
  #----------------------------------------------------------------------------
  def actor
    return $game_player.battler
  end
  
end

#==============================================================================
# Hotkey_Assignment
#------------------------------------------------------------------------------
#  This class creates and display currently assigned hotkeys and is more
#  effiecient than the Window class.
#==============================================================================

class Hotkey_Assignment < Sprite
  
  #----------------------------------------------------------------------------
  # Initialization
  #  viewport - the viewport for the sprite
  #----------------------------------------------------------------------------
  def initialize(viewport = nil)
    # call superclass
    super
    # create bitmap
    self.bitmap = Bitmap.new(320, 32)
    # set font to bold
    self.bitmap.font.bold = true
    # decrease font size
    self.bitmap.font.size -= 8
    # set font color
    self.bitmap.font.color = system_color
    # set x and y position
    self.x, self.y, self.z = 160, 0, 1100
    # skill IDs on hotkeys
    @skills = BlizzABS::Cache::EmptyKeys
    # item IDs on hotkeys
    @items = BlizzABS::Cache::EmptyKeys
    # update display
    update
  end
  #----------------------------------------------------------------------------
  # draw
  #  Draws the hotkey display.
  #----------------------------------------------------------------------------
  def draw(index = nil)
    # iterate through all hotkeys
    (index == nil ? BlizzABS::Cache::HotkeyRange : [index]).each {|i|
        # if hotkey is skill hotkey
        if $game_player.skill_hotkeys[i%10] != 0
          # temporary object
          object = $data_skills[$game_player.skill_hotkeys[i%10]]
        # if hotkey is item hotkey
        elsif $game_player.item_hotkeys[i%10] != 0
          # temporary object
          object = $data_items[$game_player.item_hotkeys[i%10]]
        end
        # if any change applied (10 is used for 0)
        if @items[i%10] != $game_player.item_hotkeys[i%10] ||
            @skills[i%10] != $game_player.skill_hotkeys[i%10]
          # remove this icon
          self.bitmap.fill_rect(32*(i-1), 0, 32, 32, Color.new(0, 0, 0, 0))
          # fill icon bachground
          self.bitmap.fill_rect(32*(i-1)+4, 4, 24, 24, Color.new(0, 0, 0, 128))
          # if object exists
          if object != nil
            # load bitmap
            bitmap = RPG::Cache.icon(object.icon_name)
            # draw bitmap
            self.bitmap.blt(32*(i-1)+4, 4, bitmap, Rect.new(0, 0, 24, 24))
          end
          # draw hotkey number
          self.bitmap.draw_text_full(32*(i-1), 10, 30, 32, (i%10).to_s, 2)
        end}
    # set new items
    @items = $game_player.item_hotkeys.clone
    # set new skills
    @skills = $game_player.skill_hotkeys.clone
  end
  #----------------------------------------------------------------------------
  # update
  #  Updates the hotkey display.
  #----------------------------------------------------------------------------
  def update
    # call superclass method
    super
    # if actor or item hotkeys or skill hotkeys have changed
    if @actor != $game_player.battler || @items != $game_player.item_hotkeys ||
        @skills != $game_player.skill_hotkeys
      # set new actor
      @actor = $game_player.battler
      # redraw
      draw
    end
  end
  
end

#==============================================================================
# Minimap
#------------------------------------------------------------------------------
#  This class creates and handels the minimap/fullscreen map display and is
#  more efficient than the Window class.
#==============================================================================

class Minimap < Sprite
  
  # setting all accessible variables
  attr_reader :map_id
  #----------------------------------------------------------------------------
  # Initialization
  #----------------------------------------------------------------------------
  def initialize
    # call superclass method
    super(Viewport.new(476, 356, 160, 120))
    # get autotile image from Blizz-ABS Cache
    @autotile = $BlizzABS.cache.image('minimap_autotile')
    # creates the passable floor map
    create_passable_floor
    # set x and y position
    self.x = self.y = 0
    # set z position
    viewport.z = 5000
    # store events
    @events, @names = check_events
    # create sprites for events
    create_sevents
    # set all sprites visible
    self.visible = true
    # update
    update
  end
  #----------------------------------------------------------------------------
  # create_passable_floor
  #  Creates the passable floor map on the bitmap.
  #----------------------------------------------------------------------------
  def create_passable_floor
    # delete bitmap if bitmap exists
    self.bitmap.dispose if self.bitmap != nil
    # store new map ID
    @map_id = $game_map.map_id
    # temporary width and height
    w, h = $game_map.width, $game_map.height
    # create bitmap
    self.bitmap = Bitmap.new(8*w, 8*h)
    # fill rectangle
    self.bitmap.fill_rect(0, 0, 8*w, 8*h, Color.new(0, 0, 0, 128))
    # get passability data
    v_map = $game_map.virtual_passability
    # iterate through all tiles
    (0...v_map.xsize).each {|x| (0...v_map.ysize).each {|y|
        # depending on passable direction, draw the path using the autotile
        case v_map[x, y]
        when 0x01 #    D
          self.bitmap.blt(x*8, y*8+4, @autotile, Rect.new(0, 0, 8, 4), 128)
        when 0x02 #   L
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(4, 0, 4, 8), 128)
        when 0x03 #   LD
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(16, 8, 8, 8), 128)
        when 0x04 #  R
          self.bitmap.blt(x*8+4, y*8, @autotile, Rect.new(0, 0, 4, 8), 128)
        when 0x05 #  R D
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(0, 8, 8, 8), 128)
        when 0x06 #  RL
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(8, 8, 8, 4), 128)
          self.bitmap.blt(x*8, y*8+4, @autotile, Rect.new(8, 28, 8, 4), 128)
        when 0x07 #  RLD
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(8, 8, 8, 8), 128)
        when 0x08 # U
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(0, 4, 8, 4), 128)
        when 0x09 # U  D
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(0, 16, 4, 8), 128)
          self.bitmap.blt(x*8+4, y*8, @autotile, Rect.new(20, 16, 4, 8), 128)
        when 0x0A # U L
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(16, 24, 8, 8), 128)
        when 0x0B # U LD
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(16, 16, 8, 8), 128)
        when 0x0C # UR
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(0, 24, 8, 8), 128)
        when 0x0D # UR D
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(0, 16, 8, 8), 128)
        when 0x0E # URL
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(8, 24, 8, 8), 128)
        when 0x0F # URLD
          self.bitmap.blt(x*8, y*8, @autotile, Rect.new(8, 16, 8, 8), 128)
        end}}
  end
  #----------------------------------------------------------------------------
  # update
  #  Updates the minimap and sprite movement on the minimap.
  #----------------------------------------------------------------------------
  def update(override = false)
    # creates the passable floor map if new map entered
    create_passable_floor if @map_id != $game_map.map_id
    # get events
    ev = check_events
    # if events or names changed
    if @events != ev[0] || @names != ev[1]
      # store new events and names
      @events, @names = ev
      # delete sprites of events
      destroy_sevents
      # create sprites of events
      create_sevents
    end
    # if minimap not in fullscreen mode
    if $game_system.minimap < 2
      # set offset display
      self.ox, self.oy = $game_map.display_x / 16, $game_map.display_y / 16
    # if not pressed the turn button to scroll map around
    elsif !($game_system.turn_button && Input.press?(Input::Turn)) || override
      # if map can be scrolled horizontally
      if self.bitmap.width > 640
        # coordinate
        border = $game_player.real_x/16 - 320
        # get right border
        border_x = self.bitmap.width - 640
        # set offset
        if border < 0
          self.ox = 0
        elsif border > border_x
          self.ox = border_x
        else
          self.ox = border
        end
      else
        # center map display horizontally
        self.ox = self.bitmap.width/2 - 320
      end
      # if map can be scrolled vertically
      if self.bitmap.height > 480
        # coordinate
        border = $game_player.real_y/16 - 240
        # get lower border
        border_y = self.bitmap.height - 480
        # set offset
        if border < 0
          self.oy = 0
        elsif border > border_y
          self.oy = border_y
        else
          self.oy = border
        end
      else
        # center map display vertically
        self.oy = self.bitmap.height/2 - 240
      end
    end
    # iterate through all sprites
    @sevents.each_index {|i|
        # if minimap is not in fullscreen mode and within the range of ABSEAL
        if $game_system.minimap == 2 || @events[i].update?
          # set new coordinates
          @sevents[i].x = self.x + @events[i].real_x / 16
          @sevents[i].y = self.y + @events[i].real_y / 16
          # set offsets
          @sevents[i].ox, @sevents[i].oy = self.ox, self.oy
          # if event has a spriteset
          if @names[i] != '' && !@events[i].dropped? &&
              (@events[i].is_a?(Map_Actor) ||
              !@events[i].name.clone.gsub!('\box') {''})
            # depending on the facing direction of the event
            @sevents[i].src_rect.set((@events[i].direction - 2) * 7, 0, 14, 14)
            # change offsets
            @sevents[i].ox += 3
            @sevents[i].oy += 3
          end
        end}
  end
  #----------------------------------------------------------------------------
  # check_events
  #  Checks all events.
  #----------------------------------------------------------------------------
  def check_events
    # events and names arrays
    events, names = [], []
    # iterate through all actors
    $BlizzABS.battlers.each {|actor|
        # if valid actor
        if actor.valid?
          # add event and spriteset name
          events.push(actor)
          names.push(actor.character_name)
        end}
    # iterate through all events
    $game_map.events.each_value {|event|
        # skip if defined to skip
        next if event.name.clone.gsub!('\nomap') {''}
        # if should be displayed
        if defined?(event.valid?) && event.valid? ||
            event.is_a?(Game_Event) && !event.erased && (event.teleport ||
            event.dropped? || event.name.clone.gsub!('\spc') {''})
          # add enemy and spriteset name
          events.push(event)
          names.push(event.character_name)
        end}
    # return result
    return events, names
  end
  #----------------------------------------------------------------------------
  # create_sevents
  #  Creates for each event on the map a sprite on the minimap.
  #----------------------------------------------------------------------------
  def create_sevents
    # set empty array
    @sevents = []
    # ierate through all events on the minimap
    @events.each_index {|i|
        # create sprite
        sprite = Sprite.new(viewport)
        # temporary variable
        rect = Rect.new(0, 0, 56, 14)
        # if event is player
        if @events[i] == $game_player
          # if player has spriteset
          if @names[i] != ''
            # create bitmap
            sprite.bitmap = Bitmap.new(56, 14)
            # get green arrow
            sprite.bitmap.blt(0, 0, $BlizzABS.cache.image('green_arrow'), rect, 128)
          end
          # highest sprite
          sprite.z = 100
        # if event is actor
        elsif @events[i].is_a?(Map_Actor)
          # if actor has spriteset
          if @names[i] != ''
            # create bitmap
            sprite.bitmap = Bitmap.new(56, 14)
            # get blue arrow
            sprite.bitmap.blt(0, 0, $BlizzABS.cache.image('blue_arrow'), rect, 128)
          end
          # 2nd highest sprite
          sprite.z = 80
        # if event is enemy
        elsif @events[i].class == Map_Enemy &&
            @events[i].ai.group == BlizzABS::Alignments::ENEMY_GROUP
          # if event without spriteset or "boxdraw" enforcing
          if @names[i] == '' || @events[i].name.clone.gsub!('\box') {''}
            # create bitmap
            sprite.bitmap = Bitmap.new(8, 8)
            # fill rectangle with black color
            sprite.bitmap.fill_rect(0, 0, 8, 8, Color.new(0, 0, 0, 128))
            # fill rectangle with red color
            sprite.bitmap.fill_rect(1, 1, 6, 6, Color.new(255, 0, 0, 128))
          else
            # create bitmap
            sprite.bitmap = Bitmap.new(56, 14)
            # get red arrow
            sprite.bitmap.blt(0, 0, $BlizzABS.cache.image('red_arrow'), rect, 128)
          end
          # 5th highest sprite
          sprite.z = 50
        # if event is dropped item
        elsif @events[i].dropped?
          # create bitmap
          sprite.bitmap = Bitmap.new(8, 8)
          # fill rectangle with black color
          sprite.bitmap.fill_rect(0, 0, 8, 8, Color.new(0, 0, 0, 128))
          # fill rectangle with cyan color
          sprite.bitmap.fill_rect(1, 1, 6, 6, Color.new(0, 255, 255, 128))
          # 3rd highest sprite
          sprite.z = 70
        # if event is normal event
        elsif @events[i].class == Game_Event
          # if event has spc command
          if @events[i].name.clone.gsub!('\spc') {''}
            # temporary variables, 4th highest sprite
            color, arrow, sprite.z = Color.new(255, 255, 0, 128), 'yellow_arrow', 60
          # if event code exists and te
          elsif @events[i].teleport
            # temporary variables, 6th highest sprite
            color, arrow, sprite.z = Color.new(128, 0, 255, 128), 'violet_arrow', 40
          end
          # if event without spriteset or "boxdraw" enforcing
          if @names[i] == '' || @events[i].name.clone.gsub!('\box') {''}
            # create bitmap
            sprite.bitmap = Bitmap.new(8, 8)
            # fill rectangle with black color
            sprite.bitmap.fill_rect(0, 0, 8, 8, Color.new(0, 0, 0, 128))
            # fill rectangle with yellow color
            sprite.bitmap.fill_rect(1, 1, 6, 6, color)
          else
            # create bitmap
            sprite.bitmap = Bitmap.new(56, 14)
            # get yellow or violet arrow
            sprite.bitmap.blt(0, 0, $BlizzABS.cache.image(arrow), rect, 128)
          end
        # if event without spriteset or "boxdraw" enforcing
        elsif @names[i] == '' || @events[i].name.clone.gsub!('\box') {''}
          # create bitmap
          sprite.bitmap = Bitmap.new(8, 8)
          # fill rectangle with black color
          sprite.bitmap.fill_rect(0, 0, 8, 8, Color.new(0, 0, 0, 128))
          # fill rectangle with default white color
          sprite.bitmap.fill_rect(1, 1, 6, 6, Color.new(255, 255, 255, 128))
        else
          # create bitmap
          sprite.bitmap = Bitmap.new(56, 14)
          # get white arrow
          sprite.bitmap.blt(0, 0, $BlizzABS.cache.image('white_arrow'), Rect.new(0, 0, 56, 14), 128)
        end
        # create a little dummy bitmap in case no bitmap was created before
        sprite.bitmap = Bitmap.new(1, 1) if sprite.bitmap == nil
        # get sprite out of map screen so ABSEAL can work correctly
        sprite.ox = sprite.oy = 64
        # if event has a spriteset
        if sprite.bitmap.width != 8
          # depending on the facing direction of the event
          sprite.src_rect.set((@events[i].direction-2)*7, 0, 14, 14)
        end
        # add sprite to array
        @sevents.push(sprite)}
  end
  #----------------------------------------------------------------------------
  # destroy_sevents
  #  Deletes all sprites.
  #----------------------------------------------------------------------------
  def destroy_sevents
    # if sprites exist
    if @sevents != nil
      # delete them
      @sevents.each {|i| i.dispose}
      @sevents = nil
    end
  end
  #----------------------------------------------------------------------------
  # visible=
  #  expr - true or false
  #  Overriding the original method so the events sprites also get affected.
  #----------------------------------------------------------------------------
  def visible=(expr)
    # call superclass method
    super
    # set each sprite's visiblity
    @sevents.each {|sprite| sprite.visible = expr}
  end
  #----------------------------------------------------------------------------
  # dispose
  #  Removes Minimap from screen and memory.
  #----------------------------------------------------------------------------
  def dispose
    # delete sprites
    destroy_sevents
    # call superclass method
    super
  end
  
end

#==============================================================================
# Spriteset_Map
#------------------------------------------------------------------------------
#  This class was enhanced to create and handle caterpillar characters and to
#  take over and handle damage sprites upon their host's termination.
#==============================================================================

class Spriteset_Map
  
  # setting all accessible variables
  attr_accessor :viewport1
  attr_accessor :character_sprites
  #----------------------------------------------------------------------------
  # override Initialization
  #----------------------------------------------------------------------------
  alias init_blizzabs_later initialize
  def initialize
    # call original method
    init_blizzabs_later
    # iterate through all active remotes, beams and all actors except player
    ($BlizzABS.cache.remotes + $BlizzABS.cache.beams +
        $BlizzABS.battlers - [$game_player]).each {|character|
        # if it's really a character
        if character.is_a?(Game_Character)
          # create sprite
          sprite = Sprite_Character.new(@viewport1, character)
          # update sprite
          sprite.update
          # add sprite to character_sprites
          @character_sprites.push(sprite)
        end}
    # set damage update flag
    @dmg_update = ($scene.is_a?(Scene_Map))
  end
  #----------------------------------------------------------------------------
  # override update
  #----------------------------------------------------------------------------
  alias upd_blizzabs_later update
  def update
    # iterate through all damage sprites
    $BlizzABS.cache.damages.each_index {|i|
        # if request
        if $BlizzABS.cache.damages[i].is_a?(BlizzABS::DamageRequest)
          # create sprite based upon request
          $BlizzABS.cache.damages[i] =
              Sprite_Damage.new($BlizzABS.cache.damages[i])
        # if damage sprite opacity is 0
        elsif $BlizzABS.cache.damages[i].opacity == 0
          # delete damage sprite
          $BlizzABS.cache.damages[i].dispose
          # remove deleted damage sprite
          $BlizzABS.cache.damages[i] = nil
        end}
    # iterate through all beam sprites
    $BlizzABS.cache.beams.each_index {|i|
        # if damage sprite opacity is 0
        if $BlizzABS.cache.beams[i][0].opacity == 0
          # delete damage sprite
          $BlizzABS.cache.beams[i][0].dispose
          # remove deleted damage sprite
          $BlizzABS.cache.beams[i] = nil
        end}
    # remove nil values from both arrays
    $BlizzABS.cache.damages.compact!
    $BlizzABS.cache.beams.compact!
    # if damage sprites allowed to be updated
    if @dmg_update
      # update damage sprites
      $BlizzABS.cache.damages.each {|dmg| dmg.update}
      # iterate through all beam sprites
      $BlizzABS.cache.beams.each {|beam|
          # decrease counter
          beam[1] -= 1
          # set new opacity
          beam[0].opacity = beam[1] * 15}
    end
    # call original method
    upd_blizzabs_later
    # update character sprites additionally
    update_blizzabs_character_sprites
  end
  #----------------------------------------------------------------------------
  # update_blizzabs_character_sprites
  #  Updates the character sprites additionally.
  #----------------------------------------------------------------------------
  def update_blizzabs_character_sprites
    # iterate through all character sprites
    @character_sprites.each_index {|i|
        # temporary variables
        sprite = @character_sprites[i]
        character = sprite.character
        # if character is a dead enemy or an unsummoning pet or monster
        if (character.is_a?(Map_Enemy) || character.is_a?(Map_Actor) &&
            $BlizzABS.summoned?(character)) && character.battler != nil &&
            character.battler.dead?
          # set dying flag
          sprite.dying = true
        # if character which the sprite observes is a projectile
        elsif character.is_a?(Map_Projectile) && character.fade_out
          # set fade out flag
          sprite.fade_out = true
        end
        # if dying
        if sprite.dying
          # update die
          sprite.update_die
        # if respawning
        elsif sprite.respawning
          # update die
          sprite.update_respawn
        # if fading in
        elsif sprite.fade_in
          # update fade in
          sprite.update_fade_in
        # if fading out
        elsif sprite.fade_out
          # update fading out
          sprite.update_fade_out
        end
        # if sprite died and ready for deletion or expired character
        if character.terminate
          # if character is remote and remote expired
          if character.is_a?(Map_Remote)
            # remove projectile from active remotes
            $BlizzABS.cache.remotes.delete(character)
          # if character which the sprite observes is enemy
          elsif character.is_a?(Map_Enemy) && !character.ai.lifeless?
            # find all Respawn Points for this enemy
            tmp = $game_map.respawns.find_all {|event|
                !event.erased && event.respawn_ids != nil &&
                event.respawn_ids.include?(character.battler_id)}
            # if none exists
            if tmp.size == 0
              # normal respawn setting
              time = $game_system.respawn_time
            else
              # get a random Respawn Point and let this enemy know where it is
              character.respawn_point = tmp[rand(tmp.size)]
              # set the Respawn Points respawn time
              time = character.respawn_point.respawn_time
            end
            # add respawn counter for character
            $game_system.killed[character] = time * 40
          end
          # dispose sprite
          sprite.dispose
          # remove sprite from spriteset
          @character_sprites[i] = nil
        end}
    # remove nil values
    @character_sprites.compact!
  end
  
end

#==============================================================================
# Window_Message
#------------------------------------------------------------------------------
#  This class was modified to override Blizz-ABS battle handling for correct
#  window position display.
#==============================================================================

class Window_Message
  
  #----------------------------------------------------------------------------
  # override reset_window
  #----------------------------------------------------------------------------
  alias reset_window_blizzabs_later reset_window
  def reset_window(change_opacity = true)
    # store old in_battle flag and set new in_battle flag
    tmp, $game_temp.in_battle = $game_temp.in_battle, false
    # if ccoa's UMS is being used
    if $game_system.ums_mode != nil
      # call original method with parameter
      reset_window_blizzabs_later(change_opacity)
    else
      # call original method
      reset_window_blizzabs_later
    end
    # restore in_battle flag
    $game_temp.in_battle = tmp
  end
  
end

#==============================================================================
# Scene_Title
#------------------------------------------------------------------------------
#  This class was enhanced to size down the animations upon loading.
#==============================================================================

class Scene_Title
  
  #----------------------------------------------------------------------------
  # override main
  #----------------------------------------------------------------------------
  alias main_blizzabs_later main
  def main
    # call original method
    main_blizzabs_later
    # if SMALL_ANIMATIONS is turned on and scene exists
    if BlizzABS::Config::SMALL_ANIMATIONS && $scene != nil
      # size down animations
      $BlizzABS.util.animations_size_down
    end
  end
  
end

#==============================================================================
# Scene_Map
#------------------------------------------------------------------------------
#  This class was enhanced to support HUD control and creation system and
#  Blizz-ABS battle handling and level up text display.
#==============================================================================

class Scene_Map
  
  # setting all accessible variables
  attr_accessor :spriteset
  #----------------------------------------------------------------------------
  # override main
  #----------------------------------------------------------------------------
  alias main_blizzabs_later main
  def main
    # create HUD if HUD is turned on and HUD active
    @hud = Hud.new if BlizzABS::Config::HUD_ENABLED && $game_system.hud
    # if HOTKEYS is turned on and assignment display active
    if BlizzABS::Config::HOTKEYS && $game_system.hotkeys
      # create assignment display
      @hotkeys = Hotkey_Assignment.new
    end
    # if MINIMAP is turned on and minimap active
    if BlizzABS::Config::MINIMAP && $game_system.minimap > 0
      # create HUD
      @minimap = Minimap.new
    end
    # tests and sets the in_battle flag
    test_in_battle
    # call original method
    main_blizzabs_later
    # set in_battle flag
    $game_temp.in_battle = false
    # delete HUD elements that exist
    [@hud, @hotkeys, @minimap].each {|s| s.dispose if s != nil}
  end
  #----------------------------------------------------------------------------
  # override transfer_player
  #----------------------------------------------------------------------------
  alias transfer_player_blizzabs_later transfer_player
  def transfer_player
    # call original method
    transfer_player_blizzabs_later
    # test and set the in_battle flag
    test_in_battle
  end
  #----------------------------------------------------------------------------
  # test_in_battle
  #  Sets the in_battle flag to control game flow.
  #----------------------------------------------------------------------------
  def test_in_battle
    # if master override is being used
    if $game_system.blizzabs != nil
      # enforce user's setting
      $game_temp.in_battle = $game_system.blizzabs
    # if event code is being executed or message window is being displayed
    elsif $game_system.map_interpreter.running? || $game_temp.message_window_showing
      # disable Blizz-ABS controls
      $game_temp.in_battle = false
    else
      # depending on chosen DISABLE_ABS_MODE in battle or not in battle
      $game_temp.in_battle = case BlizzABS::Config::DISABLE_ABS_MODE
      when 0 then true
      when 1 then ($game_system.battlers_number > 0)
      when 2 then ($game_map.battlers.size > 0)
      when 3 then ($game_map.battlers_in_range.size > 0)
      end
    end
  end
  #----------------------------------------------------------------------------
  # judge
  #  Checks whether Game Over should be initiated.
  #----------------------------------------------------------------------------
  def judge
    return $game_party.all_dead?
  end
  #----------------------------------------------------------------------------
  # setup_gameover
  #  Processes the Game Over.
  #----------------------------------------------------------------------------
  def setup_gameover
    # set game over
    $game_temp.gameover = judge
    # if game over
    if $game_temp.gameover
      # play collapse sound effect
      $game_system.se_play($data_system.actor_collapse_se)
      # call original method
      upd_blizzabs_later
      # reset remotes and damage sprites
      $BlizzABS.cache.clean
      # update the HUD
      hud_update
      # confirm game over
      return true
    end
    # no game over
    return false
  end
  #----------------------------------------------------------------------------
  # override update
  #----------------------------------------------------------------------------
  alias upd_blizzabs_later update
  def update
    # update path finder
    $BlizzABS.AI.update
    # if temporary character selection exists
    if $game_temp.select_data != nil
      # call selection update
      update_selection
      # abort rest of the scene
      return
    end
    # test and set the in_battle flag
    test_in_battle
    # needed to prevent a glitch
    $game_temp.battle_turn = 1
    # abort if game over process confirms it
    return if $game_system.auto_gameover && setup_gameover
    # update level ups
    update_lvlup
    # call original method
    upd_blizzabs_later
    # update the HUD
    hud_update
  end
  #----------------------------------------------------------------------------
  # update_lvlup
  #  Updates level up displays.
  #----------------------------------------------------------------------------
  def update_lvlup
    # iterate through all map actors and pets
    ($BlizzABS.actors + $BlizzABS.pets).each {|actor|
        # if leveled up
        if actor.valid? && actor.battler != nil && actor.battler.level_up?
          # recover if RECOVER_ON_LEVEL_UP is turned on
          actor.battler.recover_all if BlizzABS::Config::RECOVER_ON_LEVEL_UP
          # if DISPLAY_LEVEL_UP is turned on
          if BlizzABS::Config::DISPLAY_LEVEL_UP
            # create level up display
            $BlizzABS.util.display_levelup(actor)
          end
          # if ANIMATIONS is turned on
          if BlizzABS::Config::ANIMATIONS
            # if first actor
            if actor.battler.index == 0
              # set animation ID if LEVEL_UP_ANIMATION_ID is turned on
              $game_player.animation_id = BlizzABS::Config::LEVEL_UP_ANIMATION_ID
            # if caterpillar is turned on
            elsif $game_system.caterpillar
              # set animation ID
              $BlizzABS.battlers[actor.index].animation_id =
                    BlizzABS::Config::LEVEL_UP_ANIMATION_ID
            end
          end
        end}
  end
  #----------------------------------------------------------------------------
  # hud_update
  #  Contains a couple of routine calls to handle with the HUD.
  #----------------------------------------------------------------------------
  def hud_update
    # check activation of HUD parts
    check_huds
    # update minimap
    update_minimap
    # update hotkey assignment display
    update_hotkeys
    # iterate through all the HUD sprites
    [@hud, @minimap, @hotkeys].each {|s|
        # if sprite exists
        if s != nil
          # update sprite
          s.update
          # if player is on the same position as one of the sprites on the screen
          if $game_player.screen_x < s.vx + s.vw + 16 &&
              $game_player.screen_y < s.vy + s.vh + 48 &&
              $game_player.screen_x > s.vx && $game_player.screen_y > s.vy &&
              (s != @minimap || $game_system.minimap < 2)
            # decrease opacity quickly if critical opacity not reached
            s.opacity -= 25 if s.opacity > 80
          # if not full opacity
          elsif s.opacity <= 255
            # increase opacity quickly if critical opacity not reached
            s.opacity += 25
          end
        end}
  end
  #----------------------------------------------------------------------------
  # check_huds
  #  Handles enabling and disabling the HUD parts on the map.
  #----------------------------------------------------------------------------
  def check_huds
    # if minimap button is enabled and pressed
    if $game_system.minimap_button && Input.trigger?(Input::Minimap)
      # trigger minimap active
      $game_system.minimap = ($game_system.minimap + 1) % 3
    end
    # if hotkey display button is enabled and pressed
    if $game_system.hotkey_button && Input.trigger?(Input::Hotkey)
      # trigger hotkey display active
      $game_system.hotkeys = (!$game_system.hotkeys)
    end
    # if HUD button is enabled and pressed
    if $game_system.hud_button && Input.trigger?(Input::Hud)
      # trigger it active
      $game_system.hud = (!$game_system.hud)
    end
    # if minimap not active and minimap exists
    if $game_system.minimap == 0 && @minimap != nil
      # delete it
      @minimap.dispose
      @minimap = nil
    # if minimap is turned on and active and doesn't exist
    elsif BlizzABS::Config::MINIMAP && $game_system.minimap > 0
      # create it
      @minimap = Minimap.new if @minimap == nil
    end
    # if assignment display not active and exists
    if !$game_system.hotkeys && @hotkeys != nil
      # delete it
      @hotkeys.dispose
      @hotkeys = nil
    # if HOTKEYS is turned on and active and doesn't exist
    elsif BlizzABS::Config::HOTKEYS && $game_system.hotkeys
      # create it
      @hotkeys = Hotkey_Assignment.new if @hotkeys == nil
    end
    # if HUD not active and HUD exists
    if !$game_system.hud && @hud != nil
      # delete it
      @hud.dispose
      @hud = nil
    # if HUD is turned on and HUD active and HUD doesn't exist
    elsif BlizzABS::Config::HUD_ENABLED && $game_system.hud
      # create it
      @hud = Hud.new if @hud == nil
    end
  end
  #----------------------------------------------------------------------------
  # update_minimap
  #  Updates the minimap.
  #----------------------------------------------------------------------------
  def update_minimap
    # stop if minimap doesn't exist or not in fullscreen mode
    return if @minimap == nil
    # if not in fullscreen mode
    if $game_system.minimap < 2
      # update the minimap
      @minimap.update
      # stop
      return
    end
    # unless fullscreen already initialized and no new map
    unless @minimap.viewport.rect.width == 640 &&
        @minimap.map_id == $game_map.map_id
      # set display rectangle
      @minimap.viewport.rect.set(0, 0, 640, 480)
      # update the offset
      @minimap.update(true)
    else
      # update the minimap
      @minimap.update
    end
    # if pressed turning button
    if $game_system.turn_button && Input.press?(Input::Turn) &&
        !$game_system.map_interpreter.running? && !@move_route_forcing &&
        !$game_temp.message_window_showing
      # if map width out of screen width
      if @minimap.bitmap.width > 640
        # if holding right
        if Input.repeat?(Input::RIGHT)
          # if map not out of screen yet
          if @minimap.ox + 640 < @minimap.bitmap.width
            # play cursor sound
            $game_system.se_play($data_system.cursor_se)
            # move minimap
            @minimap.ox += 32
            # move minimap
          else
            # play buzzer sound
            $game_system.se_play($data_system.buzzer_se)
          end
        elsif Input.repeat?(Input::LEFT)
          if @minimap.ox > 0
            # play cursor sound
            $game_system.se_play($data_system.cursor_se)
            # move minimap
            @minimap.ox -= 32
          else
            # play buzzer sound
            $game_system.se_play($data_system.buzzer_se)
          end
        end
      end
      if @minimap.bitmap.height > 480
        if Input.repeat?(Input::DOWN)
          if @minimap.oy + 480 < @minimap.bitmap.height
            # play cursor sound
            $game_system.se_play($data_system.cursor_se)
            # move minimap
            @minimap.oy += 32
          else
            # play buzzer sound
            $game_system.se_play($data_system.buzzer_se)
          end
        elsif Input.repeat?(Input::UP)
          if @minimap.oy > 0
            # play cursor sound
            $game_system.se_play($data_system.cursor_se)
            # move minimap
            @minimap.oy -= 32
          else
            # play buzzer sound
            $game_system.se_play($data_system.buzzer_se)
          end
        end
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_hotkeys
  #  Updates hotkey assignment display.
  #----------------------------------------------------------------------------
  def update_hotkeys
    # update hotkey assignment display if existing
    @hotkeys.update if @hotkeys != nil
    # no hotkey linking if direct keys are being used
    return if BlizzABS::Config::DIRECT_HOTKEYS
    # iterate through all number keys
    BlizzABS::Cache::Keys.each {|i|
        # if number key i was triggered
        if Input.trigger?(Input::Key[i.to_s])
          # if hotkey is valid for this skill
          if $game_player.skill_hotkeys[i] != 0
            # set this skill as the hot skill
            $game_player.battler.skill = $game_player.skill_hotkeys[i]
          # if hotkey is valid for this item
          elsif $game_player.item_hotkeys[i] != 0
            # set this item as hot item
            $game_player.battler.item = $game_player.item_hotkeys[i]
          else
            # reset hot skill and hot item
            $game_player.battler.skill = $game_player.battler.item = 0
          end
        end}
  end
  #----------------------------------------------------------------------------
  # update_selection
  #  Overrides everything else in the map scene to allow the player to select
  #  an opponent to be attacked.
  #----------------------------------------------------------------------------
  def update_selection
    # initialize select interruption if not initialized
    initialize_selection if @index == nil
    # update selection input
    targets = process_selection
    # execute selection if target exists or cancelled
    execute_selection(targets) if targets != nil
  end
  #----------------------------------------------------------------------------
  # initialize_selection
  #  Sets up everything used in the selection override.
  #----------------------------------------------------------------------------
  def initialize_selection
    # temporary variables
    object, r, type, sprites = $game_temp.select_data
    # check scope and determine target alignment, dead flag and all flag
    enemy, dead, all = $BlizzABS.util.get_scope_data(object.scope)
    # if Tons is there and targeting all
    if $tons_version != nil && object.is_a?(RPG::Skill) &&
        ($tons_version >= 6.02 && $game_system.TARGET_EM_ALL &&
        FULL_TARGET_IDS.include?(object.id))
      # forces all flag
      target_all = all = true
    end
    # increase z coordinate of all targets
    sprites.each {|sprite| sprite.z += 1000000}
    # initialized select interruption
    @index = 0
    # freeze screen display
    Graphics.freeze
    # temporary variable
    tone = $game_screen.tone
    # make screen slightly darker
    @spriteset.viewport1.tone = Tone.new(tone.red - 32, tone.green - 32,
        tone.blue - 32, tone.gray)
    # play decision sound
    $game_system.se_play($data_system.decision_se)
    # create help window
    @win = Window_Help.new
    # make partially transparent and set z coordinate
    @win.z, @win.opacity = 10000, 192
    # create 2 sprites
    @ranges = [Sprite.new(@spriteset.viewport1),
               Sprite.new(@spriteset.viewport1)]
    # set z coordinate
    @ranges[0].z = @ranges[1].z = 950000
    # color for selection rectangle
    color = (target_all ? Color.new(255, 255, 255, 96) : enemy ?
        Color.new(255, 0, 0, 96) : Color.new(0, 128, 255, 96))
    # if fullscreen skill
    if type == BlizzABS::BEAM && all
      # create 2 bitmaps for the sprites
      @ranges[0].bitmap = Bitmap.new(640, 480)
      @ranges[1].bitmap = Bitmap.new(638, 478)
      # draw big yellow rectangle
      @ranges[0].bitmap.fill_rect(0, 0, 640, 480, Color.new(255, 255, 0, 160))
      # remove inner rectangle area
      @ranges[0].bitmap.fill_rect(1, 1, 638, 478, Color.new(0, 0, 0, 0))
      # set x, y position
      @ranges[1].x = @ranges[1].y = 1
      # draw slightly smaller rectangle
      @ranges[1].bitmap.fill_rect(0, 0, 638, 478, color)
    else
      # create 2 bitmaps for the sprites
      @ranges[0].bitmap = Bitmap.new(r * 2 + 32, r * 2 + 32)
      @ranges[1].bitmap = Bitmap.new(r * 2 + 32, r * 2 + 32)
      # set sprite position
      @ranges[0].x, @ranges[0].y = $game_player.screen_x, $game_player.screen_y
      @ranges[1].x, @ranges[1].y = $game_player.screen_x, $game_player.screen_y
      # set sprite position offset
      @ranges[0].ox, @ranges[0].oy = r + 16, r + 32
      @ranges[1].ox, @ranges[1].oy = r + 16, r + 32
      # draw big yellow circle
      @ranges[0].bitmap.draw_circle(0, 0, r.to_i + 16, Color.new(255, 255, 0, 160))
      # remove area that is smaller by radius of 1
      @ranges[0].bitmap.draw_circle(1, 1, r.to_i + 15, Color.new(0, 0, 0, 0))
      # draw slightly smaller circle
      @ranges[1].bitmap.draw_circle(1, 1, r.to_i + 15, color)
    end
    # if targeting all targets
    if all
      # all targets are selected
      sprites.each {|sprite| sprite.select = 1}
      # display "All" in help window
      @win.set_text(BlizzABS::Cache::WORDAll, 1)
    else
      # first target is selected
      sprites[0].select = 1
      # display target's name in help window
      @win.set_text(sprites[0].character.battler.name, 1)
    end
    # set current yellow blinking of sprite
    @ranges[1].color.set(255, 255, 0, (16 - Graphics.frame_count % 32).abs * 8)
    # make screen transition
    Graphics.transition
  end
  #----------------------------------------------------------------------------
  # process_selection
  #  Updates the input during the selection interruption.
  #----------------------------------------------------------------------------
  def process_selection
    # temporary variables
    object, r, type, sprites = $game_temp.select_data
    # if Tons is there and targeting all
    if $tons_version != nil && object.is_a?(RPG::Skill) &&
        ($tons_version >= 6.02 && $game_system.TARGET_EM_ALL &&
        FULL_TARGET_IDS.include?(object.id))
      # forces all flag
      all = true
    else
      # check scope and determine all flag
      all = $BlizzABS.util.get_scope_data(object.scope)[2]
    end
    # animate yellow blinking of sprite
    @ranges[1].color.set(255, 255, 0, (16 - Graphics.frame_count % 32).abs * 8)
    # update select animation for all selectable sprites
    sprites.each {|sprite| sprite.update_select}
    # if not targeting all enemies
    if !all
      # display target's name in help window
      @win.set_text(sprites[@index].character.battler.name, 1)
      # if pressed left or up
      if Input.repeat?(Input::LEFT) || Input.repeat?(Input::UP)
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # deselect currently selected sprite
        sprites[@index].select = 0
        # change selection index
        @index = (@index + 1) % sprites.size
        # select currently selected sprite
        sprites[@index].select = 1
      # if pressed right or down
      elsif Input.repeat?(Input::RIGHT) || Input.repeat?(Input::DOWN)
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # deselect currently selected sprite
        sprites[@index].select = 0
        # change selection index
        @index = (@index + sprites.size - 1) % sprites.size
        # select currently selected sprite
        sprites[@index].select = 1
      end
    end
    # if cancel button pressed
    if Input.repeat?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # cancelled
      targets = false
    # if confirm button pressed
    elsif Input.repeat?(Input::C)
      # play decision sound
      $game_system.se_play($data_system.decision_se)
      # if targeting all enemies
      if all
        # initialize array
        targets = []
        # add all targets
        sprites.each {|sprite| targets.push(sprite.character)}
      else
        # decided target
        targets = [sprites[@index].character]
      end
    end
    # result
    return targets
  end
  #----------------------------------------------------------------------------
  # execute_selection
  #  Executes the selection.
  #----------------------------------------------------------------------------
  def execute_selection(targets)
    # freeze screen display
    Graphics.freeze
    # iterate through all target sprites
    $game_temp.select_data[3].each {|sprite|
        # deselect sprite
        sprite.select = 0
        # remove selection animation completely
        sprite.update_select
        # reset z coordinate
        sprite.z -= 1000000}
    # reset screen tint
    @spriteset.viewport1.tone = $game_screen.tone
    # if not cancelled
    if targets != false
      # set the target
      $game_player.ai.target = targets[0]
      # use skill or item
      case $game_temp.select_data[0]
      when RPG::Skill then $game_player.use_skill($game_temp.select_data[0])
      when RPG::Item then $game_player.use_item($game_temp.select_data[0])
      end
    end
    # delete range sprites and help window
    (@ranges + [@win]).each {|object| object.dispose}
    # remove all temporary select interuption data from memory
    @ranges = @index = @tone = @win = $game_temp.select_data = nil
    # make screen transition
    Graphics.transition
  end
  #----------------------------------------------------------------------------
  # override call_menu
  #----------------------------------------------------------------------------
  alias call_menu_blizzabs_later call_menu
  def call_menu
    # call original method if player is idle
    call_menu_blizzabs_later if $game_player.idle?
  end
  
end

#==============================================================================
# Scene_Menu
#------------------------------------------------------------------------------
#  This class was modified to infilitrate the real menu with the Blizz-ABS
#  Pre-Menu.
#==============================================================================

class Scene_Menu
  
  #----------------------------------------------------------------------------
  # override Initialization
  #  index - the cursor index
  #----------------------------------------------------------------------------
  alias init_blizzabs_later initialize
  def initialize(index = nil)
    # set index flag
    @index_flag = index
    # call original method with either 0 or the current index
    init_blizzabs_later(index == nil ? 0 : index)
  end
  #----------------------------------------------------------------------------
  # override main
  #----------------------------------------------------------------------------
  alias main_blizzabs_later main
  def main
    # if index flag does not exist
    if @index_flag == nil
      # set in_battle flag
      $game_temp.in_battle = true
      # create HUD if HUD is turned on and HUD active
      @hud = Hud.new if BlizzABS::Config::HUD_ENABLED && $game_system.hud
      # if ASSIGNMENT is turned on and assignment display active
      if BlizzABS::Config::HOTKEYS && $game_system.hotkeys
        # create assignment display
        @hotkeys = Hotkey_Assignment.new
      end
      # if MINIMAP is turned on and minimap active
      if BlizzABS::Config::MINIMAP && $game_system.minimap > 0
        # create HUD
        @minimap = Minimap.new
        # create HUD
        @minimap.update
      end
      # create options window
      @window = Window_Command.new(192, BlizzABS::Cache::CommandsPreMenu)
      # if no actors in the party
      if $game_party.actors.size == 0
        # disable options
        @window.disable_item(1)
        @window.disable_item(2)
        @window.disable_item(3)
      end
      # set x and y position
      @window.x, @window.y = 320 - @window.width/2, 240 - @window.height/2
      # set z position
      @window.z = 21000
      # set back opacity
      @window.back_opacity = 160
      # create spriteset
      @spriteset = Spriteset_Map.new
      # create viewport
      @view = Viewport.new(0, 0, 640, 480)
      # if using a fixed tint
      if BlizzABS::Config::MENU_COLOR_TINT > 0
        # get tint
        tint = BlizzABS::Config::MENU_COLOR_TINT
      else
        # randomize tint
        tint = rand(8) + 1
      end
      # tint viewport
      case tint
      # black-white tint
      when 1 then @view.tone = Tone.new(-40, -40, -40, 255)
      # blue tint
      when 2 then @view.tone = Tone.new(-255, -255, 0, 255)
      # green tint
      when 3 then @view.tone = Tone.new(-255, 0, -255, 255)
      # red tint
      when 4 then @view.tone = Tone.new(0, -255, -255, 255)
      # yellow tint
      when 5 then @view.tone = Tone.new(0, 0, -255, 255)
      # mangenta tint
      when 6 then @view.tone = Tone.new(0, -255, 0, 255)
      # cyan tint
      when 7 then @view.tone = Tone.new(-255, 0, 0, 255)
      # darker tint
      when 8 then @view.tone = Tone.new(-60, -60, -60, 0)
      end
      # transition
      Graphics.transition
      # loop
      loop do
        # update game screen
        Graphics.update
        # update input
        Input.update
        # stop if frame update
        break if update_before_main
      end
      # freeze screen
      Graphics.freeze
      # delete HUD elements that exist
      [@hud, @hotkeys, @minimap].each {|s| s.dispose if s != nil}
      # delete window
      @window.dispose
      @window = nil
      # delete spriteset
      @spriteset.dispose
      @spriteset = nil
      # delete viewport (screen tint) if new scene is still the menu or map
      @view.dispose if $scene.is_a?(Scene_Menu) || $scene.is_a?(Scene_Map)
      @view = nil
    end
    # call original method if scene is still the menu
    main_blizzabs_later if $scene.is_a?(Scene_Menu)
  end
  #----------------------------------------------------------------------------
  # update_before_main
  #  Processes the pre-menu.
  #----------------------------------------------------------------------------
  def update_before_main
    # updates path finder
    $BlizzABS.AI.update
    # update window
    @window.update
    # if window is active
    if @window.active
      # if B is pressed
      if Input.trigger?(Input::B)
        # play cancel sound
        $game_system.se_play($data_system.cancel_se)
        # create map scene
        $scene = Scene_Map.new
        # exit this scene
        return true
      # if C is pressed
      elsif Input.trigger?(Input::C)
        # which option
        case @window.index
        when 0
          # play sound
          $game_system.se_play($data_system.decision_se)
          # set in_battle flag
          $game_temp.in_battle = false
        when 1
          # if not actors in the party
          if $game_party.actors.size == 0
            # play buzzer sound effect
            $game_system.se_play($data_system.buzzer_se)
            # exit method
            return
          end
          # play sound
          $game_system.se_play($data_system.decision_se)
          # create hotkey assignment scene with the current screen tint
          $scene = Scene_Hotkeys.new(@view.tone)
        when 2
          # if not actors in the party
          if $game_party.actors.size == 0
            # play buzzer sound effect
            $game_system.se_play($data_system.buzzer_se)
            # exit method
            return
          end
          # play sound
          $game_system.se_play($data_system.decision_se)
          # create AI setup scene with the current screen tint
          $scene = Scene_AI_Behavior.new(@view.tone)
        when 3
          # if not actors in the party
          if $game_party.actors.size == 0
            # play buzzer sound effect
            $game_system.se_play($data_system.buzzer_se)
            # exit method
            return
          end
          # play sound
          $game_system.se_play($data_system.decision_se)
          # create AI setup scene with the current screen tint
          $scene = Scene_AI_Triggers.new(@view.tone)
        when 4
          # play sound
          $game_system.se_play($data_system.decision_se)
          # create map scene
          $scene = Scene_Map.new
        end
        # exit this scene
        return true
      end
    end
    # don't exit this scene
    return false
  end
  
end

#==============================================================================
# Window_Base
#------------------------------------------------------------------------------
#  This window was enhanced with utility methods for drawing triggers.
#==============================================================================

class Window_Base
  
  #----------------------------------------------------------------------------
  # draw_trigger
  #  trigger - the trigger
  #  i       - index of offset
  #  Draws one trigger.
  #----------------------------------------------------------------------------
  def draw_trigger(trigger, i = nil)
    # if index is a number
    if i.is_a?(Numeric)
      # clear field
      self.contents.fill_rect(0, i * 64, 448, 64, Color.new(0, 0, 0, 0))
      # draw index
      self.contents.draw_text(4, i * 64, 36, 32, "#{i+1}.", 2)
    else
      # index is 0
      i = 0
      # clear field
      self.contents.fill_rect(0, i * 64, 448, 64, Color.new(0, 0, 0, 0))
    end
    # get condition target name
    target = BlizzABS::Cache::TRGActivators[trigger.activator]
    # draw condition target name
    self.contents.draw_text(48, i * 64, 128, 32, target + ':')
    # if not probability activator
    if trigger.activator != BlizzABS::TRGProbability
      # get condition name
      condition = case trigger.condition
      when BlizzABS::TRGHP then $data_system.words.hp
      when BlizzABS::TRGSP then $data_system.words.sp
      when BlizzABS::TRGState then BlizzABS::Cache::WORDState
      when BlizzABS::TRGLocation then BlizzABS::Cache::WORDLocation
      end
      # draw condition name
      self.contents.draw_text(224, i * 64, 96, 32, "[#{condition}")
      # get comparison sign
      comparator = BlizzABS::Cache::TRGComparators[trigger.comparator]
      # draw comparison sign
      self.contents.draw_text(320, i * 64, 32, 32, comparator, 1)
      # if state condition
      if trigger.condition == BlizzABS::TRGState
        # if no state
        if $data_states[trigger.value] == nil
          # get normal state name
          value = BlizzABS::Cache::WORDNormalState
        else
          # get state name
          value = $data_states[trigger.value].name
        end
      # if location condition
      elsif trigger.condition == BlizzABS::TRGLocation
        # get condition value
        value = BlizzABS::Cache::TRGLocations[trigger.value]
      else
        # get condition value
        value = "#{trigger.value}%"
      end
      # draw condition value
      self.contents.draw_text(352, i * 64, 128, 32, "#{value}]")
    else
      # draw condition value
      self.contents.draw_text(224, i * 64, 64, 32, "[#{trigger.value}%]")
    end
    # draw target word
    self.contents.draw_text(48, i * 64 + 32, 80, 32, "#{BlizzABS::Cache::WORDTarget}:")
    # get action target
    text = BlizzABS::Cache::TRGTargets[trigger.target]
    # draw action target
    self.contents.draw_text(128, i * 64 + 32, 88, 32, text)
    # get action name
    name = case trigger.action_type
    when BlizzABS::TRGAttack then $data_system.words.attack
    when BlizzABS::TRGDefend then $data_system.words.guard
    when BlizzABS::TRGSkill then $data_skills[trigger.action_data].name
    when BlizzABS::TRGItem then $data_items[trigger.action_data].name
    else
      ''
    end
    # draw action name if it exists
    self.contents.draw_text(224, i * 64 + 32, 220, 32, "- #{name}") if name != ''
  end
  
end

#==============================================================================
# Window_Skill_Hotkey
#------------------------------------------------------------------------------
#  This class serves as display for skills that can be hotkeyed.
#==============================================================================

class Window_Skill_Hotkey < Window_Skill
  
  # setting all accessible variables
  attr_reader :item_max
  #----------------------------------------------------------------------------
  # Initialization
  #  actor - actor
  #----------------------------------------------------------------------------
  def initialize(actor)
    # call superclass method
    super
    # set max column number
    @column_max = 1
    # set width and height
    self.width, self.height = 320, 416
    # set y and z position
    self.y, self.z = 64, 21000
    # remove cursor display
    self.cursor_rect.empty
    # set to not active
    self.active = false
    # refresh display
    refresh
  end
  #----------------------------------------------------------------------------
  # update
  #  Updates only if window is active.
  #----------------------------------------------------------------------------
  def update
    super if self.active
  end
  #----------------------------------------------------------------------------
  # switch_actor
  #  Switch to next actor.
  #----------------------------------------------------------------------------
  def switch_actor
    # get next actor in line
    @actor = $game_party.actors[(@actor.index + 1) % $game_party.actors.size]
    # refresh display
    refresh
    # if previous actor had more skills than the current one
    if @index >= @item_max
      # set cursor to last skill
      @index = @item_max - 1
      # update cursor
      update_cursor_rect
    end
  end
  #----------------------------------------------------------------------------
  # refresh
  #  Draws the data on the window.
  #----------------------------------------------------------------------------
  def refresh
    # if bitmap exists
    if self.contents != nil
      # delete bitmap
      self.contents.dispose
      self.contents = nil
    end
    # set up all skills for display
    setup_skills
    # create bitmap
    self.contents = Bitmap.new(width - 32, @item_max * 32)
    # if using Dyna Edition scripts
    if $fontface != nil
      # set font name and size
      self.contents.font.name = $fontface
      self.contents.font.size = $fontsize
    # if using PK Edition 2
    elsif $defaultfonttype != nil
      # set font name and size
      self.contents.font.name = $defaultfonttype
      self.contents.font.size = $defaultfontsize
    end
    # draw all skills
    draw_skills
  end
  #----------------------------------------------------------------------------
  # setup_skills
  #  Sets up all skills displayed.
  #----------------------------------------------------------------------------
  def setup_skills
    # empty data
    @data = []
    # add all learned skills
    @actor.skills.each {|id| @data.push($data_skills[id])}
    # add nil
    @data.push(nil)
    # set size
    @item_max = @data.size
  end
  #----------------------------------------------------------------------------
  # setup_skills
  #  Draws all skills.
  #----------------------------------------------------------------------------
  def draw_skills
    # draw each skill
    (0...@item_max).each {|i| draw_item(i)}
  end  
  #----------------------------------------------------------------------------
  # draw_item
  #  i - skill index
  #  Draws one complete skill.
  #----------------------------------------------------------------------------
  def draw_item(i)
    # if skill is nil
    if @data[i] == nil
      # set font color
      self.contents.font.color = normal_color
      # draw "<Remove>"
      self.contents.draw_text(32, i*32, 204, 32, '<Remove>')
    else
      # if skill can be used
      if @actor.skill_can_use?(@data[i].id)
        # set font color
        self.contents.font.color = normal_color
      else
        # set font color
        self.contents.font.color = disabled_color
      end
      # clean this display
      self.contents.fill_rect(Rect.new(4, i*32, 288, 32), Color.new(0, 0, 0, 0))
      # get icon bitmap
      bitmap = RPG::Cache.icon(@data[i].icon_name)
      # get opacity
      opacity = self.contents.font.color == normal_color ? 255 : 128
      # draw icon bitmap
      self.contents.blt(4, 4+i*32, bitmap, Rect.new(0, 0, 24, 24), opacity)
      # skill name
      text = @data[i].name
      # if normal skill, using Tons of Add-ons and EQUAP Skills with AP display
      if @actor.skills.include?(@data[i].id) &&
          $tons_version != nil && $tons_version >= 7.32 &&
          TONS_OF_ADDONS::EQUAP_SKILLS && DISPLAY_AP_REQ
        # get AP for this skill
        aps = BlizzCFG.maxap(@data[i].id)
        # add to text if skill has AP
        text = "#{text} (#{@actor.ap(@data[i].id)}/#{aps})" if aps != 0
      end
      # draw text with name
      self.contents.draw_text(32, i*32, 204, 32, text)
      # get basic SP cost
      sp_cost = @data[i].sp_cost
      # if using Tons of Add-ons and SP Cost Mod Status
      if $tons_version != nil && $tons_version >= 6.54 &&
          $game_system.SP_COST_MOD
        # get cost modified cost
        sp_cost = BlizzCFG.get_cost_mod(@actor.states, sp_cost)
      end
      # draw skill SP cost
      self.contents.draw_text(236, i*32, 48, 32, sp_cost.to_s, 2)
    end
  end
  
end

#==============================================================================
# Window_Item_Hotkey
#------------------------------------------------------------------------------
#  This class serves as display for items that can be hotkeyed.
#==============================================================================

class Window_Item_Hotkey < Window_Item
  
  # setting all accessible variables
  attr_reader :item_max
  #----------------------------------------------------------------------------
  # Initialization
  #  actor - actor
  #----------------------------------------------------------------------------
  def initialize
    # call superclass method
    super
    # set max column number
    @column_max = 1
    # set width and height
    self.width, self.height = 320, 416
    # set x, y and z position
    self.x, self.y, self.z = 320, 64, 21000
    # remove cursor display
    self.cursor_rect.empty
    # set to not active
    self.active = false
    # refresh display
    refresh
  end
  #----------------------------------------------------------------------------
  # update
  #  Updates only if window is active
  #----------------------------------------------------------------------------
  def update
    # update only if actove
    super if self.active
  end
  #----------------------------------------------------------------------------
  # refresh
  #  Draws the data on the window.
  #----------------------------------------------------------------------------
  def refresh
    # if bitmap exists
    if self.contents != nil
      # delete bitmap
      self.contents.dispose
      self.contents = nil
    end
    # set up all items for display
    setup_items
    # create bitmap
    self.contents = Bitmap.new(width - 32, @item_max * 32)
    # if using Dyna Edition scripts
    if $fontface != nil
      # set font name and size
      self.contents.font.name = $fontface
      self.contents.font.size = $fontsize
    # if using PK Edition 2
    elsif $defaultfonttype != nil
      # set font name and size
      self.contents.font.name = $defaultfonttype
      self.contents.font.size = $defaultfontsize
    end
    # draws all items
    draw_items
  end
  #----------------------------------------------------------------------------
  # setup_items
  #  Sets up all items displayed.
  #----------------------------------------------------------------------------
  def setup_items
    # empty data
    @data = []
    # iterate through all items
    (1...$data_items.size).each {|i|
        # add item if number of items in possesion greater than 0
        @data.push($data_items[i]) if $game_party.item_number(i) > 0}
    # add nil
    @data.push(nil)
    # set size
    @item_max = @data.size
  end
  #----------------------------------------------------------------------------
  # setup_items
  #  Draws all items.
  #----------------------------------------------------------------------------
  def draw_items
    # draw each item
    (0...@item_max).each {|i| draw_item(i)}
  end  
  #----------------------------------------------------------------------------
  # draw_item
  #  i - item index
  #  Draws one complete item.
  #----------------------------------------------------------------------------
  def draw_item(i)
    # if item is nil
    if @data[i] == nil
      # set font color
      self.contents.font.color = normal_color
      # draw "<Remove>"
      self.contents.draw_text(32, i*32, 212, 32, '<Remove>')
    else
      # get number of items
      number = $game_party.item_number(@data[i].id)
      # if item can be used
      if $game_party.item_can_use?(@data[i].id)
        # set font color
        self.contents.font.color = normal_color
      else
        # set font color
        self.contents.font.color = disabled_color
      end
      # clean this display
      self.contents.fill_rect(Rect.new(4, i*32, 288, 32), Color.new(0, 0, 0, 0))
      # get icon bitmap
      bitmap = RPG::Cache.icon(@data[i].icon_name)
      # get opacity
      opacity = self.contents.font.color == normal_color ? 255 : 128
      # draw icon bitmap
      self.contents.blt(4, 4+i*32, bitmap, Rect.new(0, 0, 24, 24), opacity)
      # draw item name
      self.contents.draw_text(32, i*32, 212, 32, @data[i].name)
      # draw ":"
      self.contents.draw_text(244, i*32, 16, 32, ':', 1)
      # draw number of items left
      self.contents.draw_text(260, i*32, 24, 32, number.to_s, 2)
    end
  end
  
end

#==============================================================================
# Window_Behavior
#------------------------------------------------------------------------------
#  This window displays an aggressive - offensive grid for AI setup.
#==============================================================================

class Window_Behavior < Window_Base
  
  #----------------------------------------------------------------------------
  # Initialization
  #  actor - the actor
  #----------------------------------------------------------------------------
  def initialize(actor, map_actor)
    # call superclass method
    super(0, 0, 480, 480)
    # create bitmap
    self.contents = Bitmap.new(width - 32, height - 32)
    # if using Dyna Edition scripts
    if $fontface != nil
      # set font name and size
      self.contents.font.name = $fontface
      self.contents.font.size = $fontsize
    # if using PK Edition 2
    elsif $defaultfonttype != nil
      # set font name and size
      self.contents.font.name = $defaultfonttype
      self.contents.font.size = $defaultfontsize
    end
    # store variables
    @actor = actor
    # create cursor sprite
    @actor_sprite = RPG::Sprite.new
    # get bitmap
    @actor_sprite.bitmap = RPG::Cache.character(actor.character_name,
        actor.character_hue)
    # set sprite z coordinate
    @actor_sprite.z = 1000
    # set bitmap source rectangle
    @actor_sprite.src_rect.set(0, 0, @actor_sprite.bitmap.width / 4,
        @actor_sprite.bitmap.height / 4)
    # set coordinate offsets
    @actor_sprite.ox = @actor_sprite.bitmap.width / 8
    @actor_sprite.oy = @actor_sprite.bitmap.height / 4
    # set indices
    @aggressive, @offensive = 15 - @actor.aggressive, @actor.offensive - 1
    # not active
    self.active = false
    # refresh display
    refresh
    # update sprite position
    update_sprite
  end
  #----------------------------------------------------------------------------
  # override visible=
  #----------------------------------------------------------------------------
  alias visible_is_later visible=
  def visible=(val)
    # process value to sprite
    @actor_sprite.visible = val
    # call original method
    visible_is_later(val)
  end
  #----------------------------------------------------------------------------
  # override active=
  #----------------------------------------------------------------------------
  alias active_is_later active=
  def active=(val)
    # if setting to active
    if val
      # restore settings
      @aggressive, @offensive = 15 - @actor.aggressive, @actor.offensive - 1
      # update sprite position
      update_sprite
      # start sprite blinking
      @actor_sprite.blink_on
    else
      # save settings
      @actor.aggressive, @actor.offensive = 15 - @aggressive, @offensive + 1
      # stop sprite blinking
      @actor_sprite.blink_off
    end
    # call original method
    active_is_later(val)
  end
  #----------------------------------------------------------------------------
  # refresh
  #  Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    # delete old display
    self.contents.clear
    # draw actor name
    self.contents.draw_text(4, 0, 160, 32, @actor.name)
    # get grid image
    bitmap = $BlizzABS.cache.image('grid')
    # put grid on background
    self.contents.blt(44, 44, bitmap, Rect.new(0, 0, 360, 360))
    # draw normal text indicators on grid
    self.contents.draw_text(0, 12, 448, 32, BlizzABS::Cache::WORDAggressive, 1)
    self.contents.draw_text(0, 404, 448, 32, BlizzABS::Cache::WORDPassive, 1)
    # create new bitmap
    b = Bitmap.new(128, 32)
    # set font name and size from window
    b.font.name = self.contents.font.name
    b.font.size = self.contents.font.size
    # draw text on bitmap
    b.draw_text(0, 0, 128, 32, BlizzABS::Cache::WORDOffensive, 1)
    # draw rotated text indicator on grid
    self.contents.blt(404, 160, $BlizzABS.util.rotate(b), Rect.new(0, 0, 32, 128))
    # clear bitmap
    b.clear
    # draw text on bitmap
    b.draw_text(0, 0, 128, 32, BlizzABS::Cache::WORDDefensive, 1)
    # draw rotated text indicator on grid
    self.contents.blt(12, 160, $BlizzABS.util.rotate(b), Rect.new(0, 0, 32, 128))
  end
  #----------------------------------------------------------------------------
  # update_sprite
  #  Sets the position of the sprite on the grid
  #----------------------------------------------------------------------------
  def update_sprite
    @actor_sprite.x = self.x + 72 + @offensive * 24
    @actor_sprite.y = self.y + 76 + @aggressive * 24
  end
  #----------------------------------------------------------------------------
  # update
  #  Updates the window's behavior
  #----------------------------------------------------------------------------
  def update
    # update the blinking animation
    @actor_sprite.update
    # if pressed cancel
    if Input.trigger?(Input::B)
      # reset settings
      @aggressive, @offensive = 15 - @actor.aggressive, @actor.offensive - 1
      # abort update
      return
    end
    # if pressed right
    if Input.repeat?(Input::RIGHT)
      # if actor forced offensive
      if @actor.force_offensive > 0
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      else
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # change setting
        @offensive = (@offensive + 1) % 15
        # update sprite position
        update_sprite
      end
    # if pressed rleft
    elsif Input.repeat?(Input::LEFT)
      # if actor forced offensive
      if @actor.force_offensive > 0
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      else
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # change setting
        @offensive = (@offensive + 14) % 15
        # update sprite position
        update_sprite
      end
    end
    # if pressed up
    if Input.repeat?(Input::UP)
      # if actor forced aggressive
      if @actor.force_aggressive > 0
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      else
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # change setting
        @aggressive = (@aggressive + 14) % 15
        # update sprite position
        update_sprite
      end
    # if pressed down
    elsif Input.repeat?(Input::DOWN)
      # if actor forced aggressive
      if @actor.force_aggressive > 0
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      else
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # change setting
        @aggressive = (@aggressive + 1) % 15
        # update sprite position
        update_sprite
      end
    end
  end
  #----------------------------------------------------------------------------
  # dispose
  #  Enhanced to remove the actor sprite as well.
  #----------------------------------------------------------------------------
  def dispose
    @actor_sprite.dispose if @actor_sprite != nil && !@actor_sprite.disposed?
    super
  end
  
end

#==============================================================================
# Window_EditTrigger
#------------------------------------------------------------------------------
#  This window displays a Trigger editing window.
#==============================================================================

class Window_EditTrigger < Window_Base
  
  # setting all accessible variables
  attr_reader :trigger
  #----------------------------------------------------------------------------
  # Initialization
  #  actor - the actor
  #----------------------------------------------------------------------------
  def initialize(trigger = BlizzABS::Trigger.new)
    # call superclass method
    super(0, 0, 480, 96)
    # create bitmap
    self.contents = Bitmap.new(width - 32, height - 32)
    # if using Dyna Edition scripts
    if $fontface != nil
      # set font name and size
      self.contents.font.name = $fontface
      self.contents.font.size = $fontsize
    # if using PK Edition 2
    elsif $defaultfonttype != nil
      # set font name and size
      self.contents.font.name = $defaultfonttype
      self.contents.font.size = $defaultfontsize
    end
    # set y-coordinate
    self.y = 240 - self.height / 2
    # change z coordinate
    self.z += 100
    # the trigger to edit
    @trigger = trigger
    # refresh display
    refresh
  end
  #----------------------------------------------------------------------------
  # refresh
  #  Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    draw_trigger(@trigger)
  end
  
end

#==============================================================================
# Window_Triggers
#------------------------------------------------------------------------------
#  This window displays the Trigger AI setup.
#==============================================================================

class Window_Triggers < Window_Selectable
  
  #----------------------------------------------------------------------------
  # Initialization
  #  actor - the actor
  #----------------------------------------------------------------------------
  def initialize(actor)
    # call superclass method
    super(0, 0, 480, 480)
    # store variables
    @actor = actor
    # not active
    self.active = false
    # refresh display
    refresh
  end
  #----------------------------------------------------------------------------
  # refresh
  #  Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    # delete old display
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    # set max number of items
    @item_max = @actor.triggers.size
    # if any items exist
    if @item_max > 0
      # create bitmap
      self.contents = Bitmap.new(width - 32, row_max * 64)
      # if using Dyna Edition scripts
      if $fontface != nil
        # set font name and size
        self.contents.font.name = $fontface
        self.contents.font.size = $fontsize
      # if using PK Edition 2
      elsif $defaultfonttype != nil
        # set font name and size
        self.contents.font.name = $defaultfonttype
        self.contents.font.size = $defaultfontsize
      end
      # draw the items
      (0...@item_max).each {|i| draw_item(i)}
    end
  end
  #----------------------------------------------------------------------------
  # draw_item
  #  i - index
  #  Refreshes the display.
  #----------------------------------------------------------------------------
  def draw_item(i)
    draw_trigger(@actor.triggers[i], i)
  end
  #--------------------------------------------------------------------------
  # top_row
  #  Gets top row.
  #--------------------------------------------------------------------------
  def top_row
    return self.oy / 64
  end
  #--------------------------------------------------------------------------
  # top_row=
  #  row - the row
  #  Sets the row shown on top.
  #--------------------------------------------------------------------------
  def top_row=(row)
    # if row is less than 0
    if row < 0
      # change it to 0
      row = 0
    # if row exceeds row_max - 1
    elsif row > row_max - 1
      # change it to row_max - 1
      row = row_max - 1
    end
    # row height offset
    self.oy = row * 64
  end
  #--------------------------------------------------------------------------
  # page_row_max
  #  Gets number of rows displayable on one page.
  #--------------------------------------------------------------------------
  def page_row_max
    return (self.height - 32) / 64
  end
  #----------------------------------------------------------------------------
  # update_cursor_rect
  #  Updates the window's cursor.
  #----------------------------------------------------------------------------
  def update_cursor_rect
    # if cursor position is less than 0
    if @index < 0
      self.cursor_rect.empty
      return
    end
    # get current row
    row = @index / @column_max
    # scroll so current row becomes top row if current row is before top row
    self.top_row = row if row < self.top_row
    # if current row is more to back than back row
    if row > self.top_row + (self.page_row_max - 1)
      # scroll so that current row becomes back row
      self.top_row = row - (self.page_row_max - 1)
    end
    # calculate cursor width
    cursor_width = self.width / @column_max - 32
    # calculate cursor coordinates
    x = @index % @column_max * (cursor_width + 32)
    y = @index / @column_max * 64 - self.oy
    # update cursor rectangle
    self.cursor_rect.set(x, y, cursor_width, 64)
  end
  
end

#==============================================================================
# Window_TriggerValue
#------------------------------------------------------------------------------
#  This class serves for a number input for the trigger value.
#==============================================================================

class Window_TriggerValue < Window_Base
  
  # setting all accessible variables
  attr_reader :number
  #----------------------------------------------------------------------------
  # Initialization
  #  min_val - minimum value
  #  max_val - maximum value
  #  current - current value
  #----------------------------------------------------------------------------
  def initialize(min_val, max_val, current)
    # call superclass method
    super(0, 0, 108, 64)
    # set position
    self.x, self.y, self.z = 320 - self.width / 2, 240 - self.height / 2, 2000
    # create bitmap
    self.contents = Bitmap.new(width - 32, height - 32)
    # if using Dyna Edition scripts
    if $fontface != nil
      # set font name and size
      self.contents.font.name = $fontface
      self.contents.font.size = $fontsize
    # if using PK Edition 2
    elsif $defaultfonttype != nil
      # set font name and size
      self.contents.font.name = $defaultfonttype
      self.contents.font.size = $defaultfontsize
    end
    # store variables
    @number, @min_val, @max_val = current, min_val, max_val
    # display cursor
    self.cursor_rect.set(0, 0, 48, 32)
    # refresh display
    refresh
  end
  #----------------------------------------------------------------------------
  # Refresh
  #  Refreshes the display.
  #----------------------------------------------------------------------------
  def refresh
    # clear bitmap
    self.contents.clear
    # set to system color
    self.contents.font.color = system_color
    # draw "%"
    self.contents.draw_text(48, 0, 24, 32, '%')
    # draw the value
    draw_value
  end
  #----------------------------------------------------------------------------
  # draw_value
  #  Draws the current value.
  #----------------------------------------------------------------------------
  def draw_value
    # set to normal font color
    self.contents.font.color = normal_color
    # clear field
    self.contents.fill_rect(4, 0, 40, 32, Color.new(0, 0, 0, 0))
    # draw the number
    self.contents.draw_text(4, 0, 40, 32, @number.to_s, 2)
  end
  #----------------------------------------------------------------------------
  # Refresh
  #  Updates the input.
  #----------------------------------------------------------------------------
  def update
    # call superclass method
    super
    # stop if not active
    return unless self.active
    # if pressed right
    if Input.repeat?(Input::RIGHT)
      # if not maximum
      if @number < @max_val
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # increase value
        @number += 1
        # redraw value
        draw_value
      else
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      end
    # if pressed left
    elsif Input.repeat?(Input::LEFT)
      # if not minimum
      if @number > @min_val
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # decrease value
        @number -= 1
        # redraw value
        draw_value
      else
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      end
    # if pressed up
    elsif Input.repeat?(Input::UP)
      # if not maximum
      if @number < @max_val
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # increase value by 10
        @number += 10
        # limit to upper border
        @number = @max_val if @number > @max_val
        # redraw value
        draw_value
      else
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      end
    # if pressed down
    elsif Input.repeat?(Input::DOWN)
      # if not minimum
      if @number > @min_val
        # play cursor sound
        $game_system.se_play($data_system.cursor_se)
        # decrease value by 10
        @number -= 10
        # limit to lower border
        @number = @min_val if @number < @min_val
        # redraw value
        draw_value
      else
        # play buzzer sound
        $game_system.se_play($data_system.buzzer_se)
      end
    end
  end
  
end

#==============================================================================
# Scene_Hotkeys
#------------------------------------------------------------------------------
#  This class handles the skill/item hotkey processing.
#==============================================================================

class Scene_Hotkeys
  
  #----------------------------------------------------------------------------
  # Initialization
  #  tone - screen background tone
  #----------------------------------------------------------------------------
  def initialize(tone = Tone.new(0, 0, 0, 0), index = 0)
    # store current screen tint
    @tone = tone
    # store current party leader
    @party_leader = $game_party.actors[index]
  end
  #----------------------------------------------------------------------------
  # main
  #  The main processing method.
  #----------------------------------------------------------------------------
  def main
    # create spriteset
    @spriteset = Spriteset_Map.new
    # create viewport
    @view = Viewport.new(0, 0, 640, 480)
    # set tone to current screen tone
    @view.tone = @tone.clone
    # create HUD if HUD is turned on and HUD active
    @hud = Hud.new if BlizzABS::Config::HUD_ENABLED && $game_system.hud
    # if ASSIGNMENT is turned
    if BlizzABS::Config::HOTKEYS
      # create assignment display
      @hotkeys = Hotkey_Assignment.new
      # set z position
      @hotkeys.z = 5000
    end
    # if MINIMAP is turned on and minimap active
    if BlizzABS::Config::MINIMAP && $game_system.minimap > 0
      # create minimap
      @minimap = Minimap.new
    end
    # create sprite
    @choice = Sprite.new
    # create bitmap
    @choice.bitmap = $BlizzABS.cache.image('menu_arrow')
    # set x, y and z positions
    @choice.x, @choice.y, @choice.z, @choice.opacity = 160, 40, 500, 128
    # set x position offset
    @choice.ox = -8
    # set active flag
    @active = true
    # set index
    @index = 0
    # set up mode flag
    @up_mode = true
    # create modified skill window
    @skill_window = Window_Skill_Hotkey.new($game_player.battler)
    # create modified item window
    @item_window = Window_Item_Hotkey.new
    # set last active
    @last_active = true
    # transtition
    Graphics.transition
    # loop
    loop do
      # update game screen
      Graphics.update
      # update input
      Input.update
      # frame update
      update
      # stop if chosen an option
      break if $scene != self
    end
    # freeze screen
    Graphics.freeze
    # delete spriteset
    @spriteset.dispose
    # delete HUD elements that exist
    [@hud, @hotkeys, @minimap].each {|s| s.dispose if s != nil}
    # delete choice sprite
    @choice.dispose
    # delete skill window
    @skill_window.dispose
    # delete item window
    @item_window.dispose
    # delete viewport
    @view.dispose
    # while real leader is not first actor in party
    while @party_leader != $game_party.actors[0]
      # switch to next actor
      $BlizzABS.player.switch_leader
    end
  end
  #----------------------------------------------------------------------------
  # update
  #  The update processing method.
  #----------------------------------------------------------------------------
  def update
    # update choice sprite
    @choice.update
    # update skill window
    @skill_window.update
    # update item window
    @item_window.update
    # update hotkey assignment display if existing
    @hotkeys.update if @hotkeys != nil
    # move by 2 or 1 whether active in direction depending on @up_mode
    @choice.oy += (@up_mode ? (@active ? 2 : 1) : (@active ? -2 : -1))
    # set new @up_mode if necesseray depending on @up_mode
    @up_mode = (@up_mode ? (@choice.oy < 8) : (@choice.oy <= -8))
    # if select button pressed
    if $game_system.select_button && Input.trigger?(Input::Select)
      # play sound
      $game_system.se_play($data_system.cursor_se)
      # switch to next actor
      $BlizzABS.player.switch_leader
      # switch to next actor
      @skill_window.switch_actor
      # update HUD if existing
      @hud.update if @hud != nil
      # update hotkey assignment display if existing
      @hotkeys.update if @hotkeys != nil
    # if active
    elsif @active
      # set choice offset always to a number divisable with 2
      @choice.oy = @choice.oy / 2 * 2
      # update hotkey selection
      update_choice
    # if skill window is active
    elsif @skill_window.active
      # update skill selection
      update_skill
    # if item window is active
    elsif @item_window.active
      # update item selection
      update_item
    end
  end
  #----------------------------------------------------------------------------
  # update_choice
  #  Updates input during the hotkey selection.
  #----------------------------------------------------------------------------
  def update_choice
    # set x position
    @choice.x = 160 + @index * 32
    # if pressed B
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # create map scene
      $scene = Scene_Map.new
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # not active
      @active = false
      # the one that was active the last time is now active
      @skill_window.active = @last_active
      @item_window.active = (!@last_active)
    # if RIGHT is being pressed
    elsif Input.repeat?(Input::RIGHT)
      # if RIGHT is pressed or index is less than 9
      if Input.trigger?(Input::RIGHT) || @index < 9
        # play sound
        $game_system.se_play($data_system.cursor_se)
        # set new index
        @index = (@index + 1) % 10
      end
    # if LEFT is being pressed
    elsif Input.repeat?(Input::LEFT)
      # if LEFT is pressed or index is equal or greater than 1
      if Input.trigger?(Input::LEFT) || @index >= 1
        # play sound
        $game_system.se_play($data_system.cursor_se)
        # set new index
        @index = (@index + 9) % 10
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_skill
  #  Updates input during the skill selection.
  #----------------------------------------------------------------------------
  def update_skill
    # set last active
    @last_active = true
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # set active
      @active = true
      # skill window is not active
      @skill_window.active = false
      # delete cursor
      @skill_window.cursor_rect.empty
    # if C is pressd
    elsif Input.trigger?(Input::C)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # if last position
      if @skill_window.index == @skill_window.item_max - 1
        # remove hotkey assigmnent from skill
        $game_player.skill_hotkeys[(@index+1)%10] = 0
      else
        # set skill to hotkey
        $game_player.skill_hotkeys[(@index+1)%10] = @skill_window.skill.id
      end
      # remove hotkey assigmnent from item
      $game_player.item_hotkeys[(@index+1)%10] = 0
      # draw hotkey display if hotkey display exists
      @hotkeys.draw(@index+1) if @hotkeys != nil
      # set active
      @active = true
      # skill window is not active
      @skill_window.active = false
      # delete cursor
      @skill_window.cursor_rect.empty
    # if RIGHT or LEFT is pressed
    elsif Input.trigger?(Input::RIGHT) || Input.trigger?(Input::LEFT)
      # play sound
      $game_system.se_play($data_system.cursor_se)
      # item window is active
      @item_window.active = true
      # skill window is not active
      @skill_window.active = false
      # delete cursor
      @skill_window.cursor_rect.empty
    end
  end
  #----------------------------------------------------------------------------
  # update_item
  #  Updates input during the item selection.
  #----------------------------------------------------------------------------
  def update_item
    # set last active
    @last_active = false
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # set active
      @active = true
      # item window is not active
      @item_window.active = false
      # delete cursor
      @item_window.cursor_rect.empty
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # if last position
      if @item_window.index == @item_window.item_max - 1
        # remove hotkey assigmnent from item
        $game_player.item_hotkeys[(@index+1)%10] = 0
      else
        # set item to hotkey
        $game_player.item_hotkeys[(@index+1)%10] = @item_window.item.id
      end
      # remove hotkey assigmnent from skill
      $game_player.skill_hotkeys[(@index+1)%10] = 0
      # draw hotkey display if hotkey display exists
      @hotkeys.draw(@index+1) if @hotkeys != nil
      # set active
      @active = true
      # item window is not active
      @item_window.active = false
      # delete cursor
      @item_window.cursor_rect.empty
    # if RIGHT or LEFT is pressed
    elsif Input.trigger?(Input::RIGHT) || Input.trigger?(Input::LEFT)
      # play sound
      $game_system.se_play($data_system.cursor_se)
      # skill window is active
      @skill_window.active = true
      # item window is not active
      @item_window.active = false
      # delete cursor
      @item_window.cursor_rect.empty
    end
  end
  
end

#==============================================================================
# Scene_AI_Behavior
#------------------------------------------------------------------------------
#  This class processes handling of the scene where ally behavior can be set
#  up which is used by the Ally Combat AI.
#==============================================================================

class Scene_AI_Behavior
  
  #----------------------------------------------------------------------------
  # Initialization
  #  tone  - screen background tone
  #  index - actor party index
  #----------------------------------------------------------------------------
  def initialize(tone = Tone.new(0, 0, 0, 0), index = 0, command_index = 0)
    # base data
    @tone, @index = tone, index
    # get battler
    @actor = $BlizzABS.battlers[index].battler
    # command window index
    @command_index = command_index
  end
  #----------------------------------------------------------------------------
  # main
  #  The main processing method.
  #----------------------------------------------------------------------------
  def main
    # create spriteset
    @spriteset = Spriteset_Map.new
    # create viewport
    @view = Viewport.new(0, 0, 640, 480)
    # set screen tint
    @view.tone = @tone
    # create command window
    @command_window = Window_Command.new(160, BlizzABS::Cache::CommandsAIBehavior)
    # command window coordinates
    @command_window.x = 480
    # command window initial index
    @command_window.index = @command_index
    # get map actor
    map_actor = $BlizzABS.battlers[@index]
    # create behavior window
    @behavior_window = Window_Behavior.new(@actor, map_actor)
    # transition
    Graphics.transition
    # loop
    loop do
      # update game screen
      Graphics.update
      # update input
      Input.update
      # update the scene
      update
      # stop if frame update
      break if $scene != self
    end
    # freeze screen
    Graphics.freeze
    # delete command window
    @command_window.dispose
    # delete behavior window
    @behavior_window.dispose
    # delete spriteset
    @spriteset.dispose
    # delete viewport
    @view.dispose
  end
  #----------------------------------------------------------------------------
  # update
  #  The update processing method.
  #----------------------------------------------------------------------------
  def update
    # updates path finder
    $BlizzABS.AI.update
    # if command window is active
    if @command_window.active
      # update command
      update_command
    # if behavior window is active
    elsif @behavior_window.active
      # update behavior
      update_behavior
    end
  end
  #----------------------------------------------------------------------------
  # update_command
  #  The command window update processing method.
  #----------------------------------------------------------------------------
  def update_command
    # update command window
    @command_window.update
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # create map scene
      $scene = Scene_Map.new
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # which option
      case @command_window.index
      when 0
        # play sound
        $game_system.se_play($data_system.decision_se)
        # deactivate command window
        @command_window.active = false
        # activate behavior window
        @behavior_window.active = true
      when 1
        # play sound
        $game_system.se_play($data_system.decision_se)
        # get all AI actors
        battlers = $BlizzABS.battlers
        # set next index
        @index = (@index + 1) % battlers.size
        # if battler not valid
        while battlers[@index].battler == nil
          # try to find one that is
          @index = (@index + 1) % battlers.size
        end
        # create hotkey assignment scene with the current screen tint
        $scene = Scene_AI_Behavior.new(@view.tone, @index, @command_window.index)
      when 2
        # play sound
        $game_system.se_play($data_system.decision_se)
        # get all AI actors
        battlers = $BlizzABS.battlers
        # set previous index
        @index = (@index + battlers.size - 1) % battlers.size
        # if battler not valid
        while battlers[@index].battler == nil
          # try to find one that is
          @index = (@index + battlers.size - 1) % battlers.size
        end
        # create hotkey assignment scene with the current screen tint
        $scene = Scene_AI_Behavior.new(@view.tone, @index, @command_window.index)
      when 3
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create map scene
        $scene = Scene_Map.new
      end
    # if R is pressed
    elsif Input.trigger?(Input::R)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # get all AI actors
      battlers = $BlizzABS.battlers
      # set next index
      @index = (@index + 1) % battlers.size
      # if battler not valid
      while battlers[@index].battler == nil
        # try to find one that is
        @index = (@index + 1) % battlers.size
      end
      # create hotkey assignment scene with the current screen tint
      $scene = Scene_AI_Behavior.new(@view.tone, @index, @command_window.index)
    # if L is pressed
    elsif Input.trigger?(Input::L)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # get all AI actors
      battlers = $BlizzABS.battlers
      # set previous index
      @index = (@index + battlers.size - 1) % battlers.size
      # if battler not valid
      while battlers[@index].battler == nil
        # try to find one that is
        @index = (@index + battlers.size - 1) % battlers.size
      end
      # create hotkey assignment scene with the current screen tint
      $scene = Scene_AI_Behavior.new(@view.tone, @index, @command_window.index)
    end
  end
  #----------------------------------------------------------------------------
  # update_behavior
  #  The bahavior window update processing method.
  #----------------------------------------------------------------------------
  def update_behavior
    # update behavior window
    @behavior_window.update
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # deactivate behavior window
      @behavior_window.active = false
      # activate command window
      @command_window.active = true
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # deactivate behavior window
      @behavior_window.active = false
      # activate command window
      @command_window.active = true
    end
  end
  
end

#==============================================================================
# Scene_AI_Triggers
#------------------------------------------------------------------------------
#  This class processes handling of the scene where ally action triggers can be
#  set up which is used by the Ally Trigger AI.
#==============================================================================

class Scene_AI_Triggers
  
  #----------------------------------------------------------------------------
  # Initialization
  #  tone  - screen background tone
  #  index - actor party index
  #----------------------------------------------------------------------------
  def initialize(tone = Tone.new(0, 0, 0, 0), index = 0, command_index = 0)
    # data
    @tone, @index, @actor = tone, index, $BlizzABS.battlers[index].battler
    # command window index
    @command_index = command_index
    # status effect names
    @states = [BlizzABS::Cache::WORDNormalState]
    (1...$data_states.size).each {|id| @states.push($data_states[id].name)}
  end
  #----------------------------------------------------------------------------
  # main
  #  The main processing method.
  #----------------------------------------------------------------------------
  def main
    # create spriteset
    @spriteset = Spriteset_Map.new
    # create viewport
    @view = Viewport.new(0, 0, 640, 480)
    # set screen tint
    @view.tone = @tone
    # create command window
    @command_window = Window_Command.new(160, BlizzABS::Cache::CommandsAITrigger)
    # command window coordinates
    @command_window.x = 480
    # command window initial index
    @command_window.index = @command_index
    # create trigger command window
    @tcommand_window = Window_Command.new(160, BlizzABS::Cache::CommandsTrigger)
    # trigger command window coordinates
    @tcommand_window.x = 480
    @tcommand_window.y = @command_window.height
    # trigger command window no cursor
    @tcommand_window.index = -1
    # trigger command window not active
    @tcommand_window.active = false
    # create name window
    @name_window = Window_Base.new(480, 416, 160, 64)
    # create bitmap
    @name_window.contents = Bitmap.new(@name_window.width - 32,
        @name_window.height - 32)
    # if using Dyna Edition scripts
    if $fontface != nil
      # set font name and size
      @name_window.contents.font.name = $fontface
      @name_window.contents.font.size = $fontsize
    # if using PK Edition 2
    elsif $defaultfonttype != nil
      # set font name and size
      @name_window.contents.font.name = $defaultfonttype
      @name_window.contents.font.size = $defaultfontsize
    end
    # draw actor name
    @name_window.draw_actor_name(@actor, 4, 0)
    # update trigger command display
    check_triggers
    # creat triggers window
    @triggers_window = Window_Triggers.new(@actor)
    # transition
    Graphics.transition
    # loop
    loop do
      # update game screen
      Graphics.update
      # update input
      Input.update
      # update the scene
      update
      # stop if frame update
      break if $scene != self
    end
    # freeze screen
    Graphics.freeze
    # delete command window
    @command_window.dispose
    # delete trigger command window
    @tcommand_window.dispose
    # delete triggers window
    @triggers_window.dispose
    # delete name window
    @name_window.dispose
    # delete spriteset
    @spriteset.dispose
    # delete viewport
    @view.dispose
  end
  #----------------------------------------------------------------------------
  # check_triggers
  #  Checks unusable commands in the trigger command window.
  #----------------------------------------------------------------------------
  def check_triggers
    # refresh commands
    @tcommand_window.refresh
    # if ordering cannot be done
    if @actor.triggers.size < 2
      # disable ordering commands
      @tcommand_window.disable_item(4)
      @tcommand_window.disable_item(5)
      # if no triggers
      if @actor.triggers.size == 0
        # disable edit and delete
        @tcommand_window.disable_item(0)
        @tcommand_window.disable_item(2)
        @tcommand_window.disable_item(3)
      end
    end
  end
  #----------------------------------------------------------------------------
  # check_edits
  #  Checks unusable commands in the edit trigger command window.
  #----------------------------------------------------------------------------
  def check_edits
    # refresh commands
    @ecommand_window.refresh
    # if ordering cannot be done
    if @edit_window.trigger.action_type != BlizzABS::TRGSkill &&
        @edit_window.trigger.action_type != BlizzABS::TRGItem
      # disable skill/item selection command
      @ecommand_window.disable_item(5)
    end
    # if probability activator
    if @edit_window.trigger.activator == BlizzABS::TRGProbability
      # disable condition selection command
      @ecommand_window.disable_item(1)
      # disable comparison operator selection command
      @ecommand_window.disable_item(2)
      # disable target selection command
      @ecommand_window.disable_item(6)
    end
    # if state condition or location condition
    if @edit_window.trigger.condition == BlizzABS::TRGState ||
        @edit_window.trigger.condition == BlizzABS::TRGLocation
      # disable comparison operator selection command
      @ecommand_window.disable_item(2)
    end
  end
  #----------------------------------------------------------------------------
  # update
  #  The update processing method.
  #----------------------------------------------------------------------------
  def update
    # updates path finder
    $BlizzABS.AI.update
    # if command window is active
    if @command_window.active
      # update command
      update_command
    # if trigger command window is active
    elsif @tcommand_window.active
      # update trigger command
      update_trigger_command
    # if triggers window is active
    elsif @triggers_window.active
      # update triggers
      update_triggers
    # if edit command window exists
    elsif @edit_trigger_window != nil
      # update edit trigger
      update_edit_trigger
    # if edit command window exists
    elsif @ecommand_window != nil
      # update edit command
      update_edit_command
    end
  end
  #----------------------------------------------------------------------------
  # update_command
  #  The command window update processing method.
  #----------------------------------------------------------------------------
  def update_command
    # update command window
    @command_window.update
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # create map scene
      $scene = Scene_Map.new
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # which option
      case @command_window.index
      when 0
        # play sound
        $game_system.se_play($data_system.decision_se)
        # deactivate command window
        @command_window.active = false
        # activate trigger command window
        @tcommand_window.active = true
        # set cursor
        @tcommand_window.index = 0
      when 1
        # play sound
        $game_system.se_play($data_system.decision_se)
        # get all AI actors
        battlers = $BlizzABS.battlers
        # set next index
        @index = (@index + 1) % battlers.size
        # if battler not valid
        while battlers[@index].battler == nil
          # try to find one that is
          @index = (@index + 1) % battlers.size
        end
        # create hotkey assignment scene with the current screen tint
        $scene = Scene_AI_Triggers.new(@view.tone, @index, @command_window.index)
      when 2
        # play sound
        $game_system.se_play($data_system.decision_se)
        # get all AI actors
        battlers = $BlizzABS.battlers
        # set next index
        @index = (@index + battlers.size - 1) % battlers.size
        # if battler not valid
        while battlers[@index].battler == nil
          # try to find one that is
          @index = (@index + battlers.size - 1) % battlers.size
        end
        # create hotkey assignment scene with the current screen tint
        $scene = Scene_AI_Triggers.new(@view.tone, @index, @command_window.index)
      when 3
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create map scene
        $scene = Scene_Map.new
      end
    # if R is pressed
    elsif Input.trigger?(Input::R)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # get all AI actors
      battlers = $BlizzABS.battlers
      # set next index
      @index = (@index + 1) % battlers.size
      # if battler not valid
      while battlers[@index].battler == nil
        # try to find one that is
        @index = (@index + 1) % battlers.size
      end
      # create hotkey assignment scene with the current screen tint
      $scene = Scene_AI_Triggers.new(@view.tone, @index, @command_window.index)
    # if L is pressed
    elsif Input.trigger?(Input::L)
      # play sound
      $game_system.se_play($data_system.decision_se)
      # get all AI actors
      battlers = $BlizzABS.battlers
      # set next index
      @index = (@index + battlers.size - 1) % battlers.size
      # if battler not valid
      while battlers[@index].battler == nil
        # try to find one that is
        @index = (@index + battlers.size - 1) % battlers.size
      end
      # create hotkey assignment scene with the current screen tint
      $scene = Scene_AI_Triggers.new(@view.tone, @index, @command_window.index)
    end
  end
  #----------------------------------------------------------------------------
  # update_trigger_command
  #  The trigger command window update processing method.
  #----------------------------------------------------------------------------
  def update_trigger_command
    # update command window
    @tcommand_window.update
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # deactivate command window
      @command_window.active = true
      # activate behavior window
      @tcommand_window.active = false
      # set triggers index
      @tcommand_window.index = -1
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # which option
      case @tcommand_window.index
      when 0, 2, 3
        # if no triggers
        if @actor.triggers.size == 0
          # play buzzer sound
          $game_system.se_play($data_system.buzzer_se)
          # exit method
          return
        end
        # play sound
        $game_system.se_play($data_system.decision_se)
        # deactivate trigger command window
        @tcommand_window.active = false
        # activate triggers window
        @triggers_window.active = true
        # set cursor
        @triggers_window.index = 0
      when 1
        # play sound
        $game_system.se_play($data_system.decision_se)
        # deactivate trigger command window
        @tcommand_window.active = false
        # create edit command window
        @ecommand_window = Window_Command.new(160, BlizzABS::Cache::CommandsEdit)
        # set coordinates
        @ecommand_window.x = @tcommand_window.x
        @ecommand_window.y = @tcommand_window.y
        @ecommand_window.z += 100
        # set cursor
        @ecommand_window.index = 0
        # set active
        @ecommand_window.active = true
        # create editing window
        @edit_window = Window_EditTrigger.new
        # check edit window display
        check_edits
      when 4, 5
        # if not enough triggers for ordering
        if @actor.triggers.size < 2
          # play buzzer sound
          $game_system.se_play($data_system.buzzer_se)
          # exit method
          return
        end
        # play sound
        $game_system.se_play($data_system.decision_se)
        # deactivate trigger command window
        @tcommand_window.active = false
        # activate triggers window
        @triggers_window.active = true
        # set cursor
        @triggers_window.index = 0
      when 6
        # play sound
        $game_system.se_play($data_system.decision_se)
        # deactivate trigger command window
        @tcommand_window.active = false
        # activate command window
        @command_window.active = true
        # set triggers index
        @tcommand_window.index = -1
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_triggers
  #  The triggers window update processing method.
  #----------------------------------------------------------------------------
  def update_triggers
    # update triggers window
    @triggers_window.update
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # activate trigger command window
      @tcommand_window.active = true
      # deactivate triggers window
      @triggers_window.active = false
      # remove cursor
      @triggers_window.index = -1
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # update specific action
      case @tcommand_window.index
      when 0
        # play sound
        $game_system.se_play($data_system.decision_se)
        # deactivate trigger command window
        @triggers_window.active = false
        # create edit command window
        @ecommand_window = Window_Command.new(160, BlizzABS::Cache::CommandsEdit)
        # set coordinates
        @ecommand_window.x = @tcommand_window.x
        @ecommand_window.y = @tcommand_window.y
        @ecommand_window.z = @tcommand_window.z + 100
        # set cursor
        @ecommand_window.index = 0
        # set active
        @ecommand_window.active = true
        # create editing window
        @edit_window = Window_EditTrigger.new(
            @actor.triggers[@triggers_window.index].clone)
        # check edit window display
        check_edits
      when 2
        # play sound
        $game_system.se_play($data_system.decision_se)
        # delete that trigger
        @actor.triggers.delete_at(@triggers_window.index)
        # refresh the display
        @triggers_window.refresh
        # refresh trigger command window display
        check_triggers
        # if no more triggers
        if @actor.triggers.size == 0
          # activate trigger command window
          @tcommand_window.active = true
          # deactivate triggers window
          @triggers_window.active = false
          # set cursor
          @triggers_window.index = -1
        # if last item in the list was deleted
        elsif @triggers_window.index == @actor.triggers.size
          # set to new last item
          @triggers_window.index -= 1
        end
      when 3
        # play sound
        $game_system.se_play($data_system.decision_se)
        # copy that trigger
        @actor.triggers.insert(@triggers_window.index,
            @actor.triggers[@triggers_window.index])
        # refresh the display
        @triggers_window.refresh
        # refresh trigger command window display
        check_triggers
      when 4
        # if first item selected
        if @triggers_window.index == 0
          # play buzzer sound
          $game_system.se_play($data_system.buzzer_se)
        else
          # play sound
          $game_system.se_play($data_system.decision_se)
          # swap those triggers
          @actor.triggers[@triggers_window.index],
              @actor.triggers[@triggers_window.index - 1] =
              @actor.triggers[@triggers_window.index - 1],
              @actor.triggers[@triggers_window.index]
          # refresh display
          @triggers_window.draw_item(@triggers_window.index)
          @triggers_window.index -= 1
          @triggers_window.draw_item(@triggers_window.index)
        end
      when 5
        # if last item selected
        if @triggers_window.index == @actor.triggers.size - 1
          # play buzzer sound
          $game_system.se_play($data_system.buzzer_se)
        else
          # play sound
          $game_system.se_play($data_system.decision_se)
          # swap those triggers
          @actor.triggers[@triggers_window.index],
              @actor.triggers[@triggers_window.index + 1] =
              @actor.triggers[@triggers_window.index + 1],
              @actor.triggers[@triggers_window.index]
          # refresh display
          @triggers_window.draw_item(@triggers_window.index)
          @triggers_window.index += 1
          @triggers_window.draw_item(@triggers_window.index)
        end
      end
    end
  end
  #----------------------------------------------------------------------------
  # update_edit_command
  #  The edit command window update processing method.
  #----------------------------------------------------------------------------
  def update_edit_command
    # update triggers window
    @ecommand_window.update
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # if adding a new trigger
      if @tcommand_window.index == 1
        # activate trigger command window
        @tcommand_window.active = true
      else
        # activate triggers window
        @triggers_window.active = true
      end
      # delete edit command window
      @ecommand_window.dispose
      # delete edit window
      @edit_window.dispose
      # clear variables
      @ecommand_window = @edit_window = nil
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # update specific action
      case @ecommand_window.index
      when 0
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create edit trigger window
        create_edit_trigger_window(BlizzABS::Cache::TRGActivators,
            @edit_window.trigger.activator)
      when 1
        # if probability activator
        if @edit_window.trigger.activator == BlizzABS::TRGProbability
          # play sound
          $game_system.se_play($data_system.buzzer_se)
          # exit method
          return
        end
        # possible commands
        commands = [$data_system.words.hp, $data_system.words.sp,
            BlizzABS::Cache::WORDState]
        # if not activated by party leader
        if @edit_window.trigger.activator != BlizzABS::TRGLeader
          # add location
          commands.push(BlizzABS::Cache::WORDLocation)
        end
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create edit trigger window
        create_edit_trigger_window(commands,
            @edit_window.trigger.condition)
      when 2
        # if probability activator or state condition or location condition
        if @edit_window.trigger.activator == BlizzABS::TRGProbability ||
            @edit_window.trigger.condition == BlizzABS::TRGState ||
            @edit_window.trigger.condition == BlizzABS::TRGLocation
          # play sound
          $game_system.se_play($data_system.buzzer_se)
          # exit method
          return
        end
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create edit trigger window
        create_edit_trigger_window(BlizzABS::Cache::TRGComparators,
            @edit_window.trigger.comparator)
      when 3
        # play sound
        $game_system.se_play($data_system.decision_se)
        # if condition is state
        if @edit_window.trigger.condition == BlizzABS::TRGState
          # create edit trigger window
          create_edit_trigger_window(@states, @edit_window.trigger.value)
        # if location condition
        elsif @edit_window.trigger.condition == BlizzABS::TRGLocation
          # create edit trigger window
          create_edit_trigger_window(BlizzABS::Cache::TRGLocations,
              @edit_window.trigger.value)
        else
          # create a list of states
          @edit_trigger_window = Window_TriggerValue.new(0, 100,
              @edit_window.trigger.value)
        end
      when 4
        # attack and defend commands by default
        commands = [$data_system.words.attack, $data_system.words.guard]
        # get all skill possible IDs
        @skills = $BlizzABS.util.get_actor_skills(@actor)
        # add skill command if any skills available
        commands.push($data_system.words.skill) if @skills.size > 0
        # get all items possible IDs
        @items = (1...$data_items.size).find_all {|id|
            $game_party.item_number(id) > 0 && $data_items[id].occasion < 2}
        # add item command if any items available
        commands.push($data_system.words.item) if @items.size > 0
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create edit trigger window
        create_edit_trigger_window(commands,
            @edit_window.trigger.action_type)
      when 5
        commands = []
        # if skill action
        if @edit_window.trigger.action_type == BlizzABS::TRGSkill
          # get all skill possible IDs
          @skills = $BlizzABS.util.get_actor_skills(@actor)
          # get all skill names
          @skills.each {|id| commands.push($data_skills[id].name)}
          # index for selection
          index = @skills.index(@edit_window.trigger.action_data)
        # if item action
        elsif @edit_window.trigger.action_type == BlizzABS::TRGItem
          # get all items possible IDs
          @items = (1...$data_items.size).find_all {|id|
              $game_party.item_number(id) > 0 && $data_items[id].occasion < 2}
          # get all item names
          @items.each {|id| commands.push($data_items[id].name)}
          # index for selection
          index = @items.index(@edit_window.trigger.action_data)
        else
          # play sound
          $game_system.se_play($data_system.buzzer_se)
          # exit method
          return
        end
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create edit trigger window
        create_edit_trigger_window(commands, index)
      when 6
        # if probability activator
        if @edit_window.trigger.activator == BlizzABS::TRGProbability
          # play sound
          $game_system.se_play($data_system.buzzer_se)
          # exit method
          return
        end
        # play sound
        $game_system.se_play($data_system.decision_se)
        # create edit trigger window
        create_edit_trigger_window(BlizzABS::Cache::TRGTargets,
            @edit_window.trigger.target)
      when 7
        # play sound
        $game_system.se_play($data_system.decision_se)
        # if adding new trigger
        if @tcommand_window.index == 1
          # add new trigger
          @actor.triggers.push(@edit_window.trigger)
          # refresh display
          @triggers_window.refresh
          # set index to last position
          @triggers_window.index = @actor.triggers.size - 1
          # set mode to edit
          @tcommand_window.index = 0
          # refresh triggers command window
          check_triggers
        else
          # replace old trigger
          @actor.triggers[@triggers_window.index] = @edit_window.trigger
          # redraw display
          @triggers_window.draw_item(@triggers_window.index)
        end
        # set triggers window active
        @triggers_window.active = true
        # delete edit command window
        @ecommand_window.dispose
        # delete edit window
        @edit_window.dispose
        # clear variables
        @ecommand_window = @edit_window = nil
      when 8
        # play sound
        $game_system.se_play($data_system.decision_se)
        # if adding a new trigger
        if @tcommand_window.index == 1
          # activate trigger command window
          @tcommand_window.active = true
        else
          # activate triggers window
          @triggers_window.active = true
        end
        # delete edit command window
        @ecommand_window.dispose
        # delete edit window
        @edit_window.dispose
        # clear variables
        @ecommand_window = @edit_window = nil
      end
    end
  end
  #----------------------------------------------------------------------------
  # create_edit_trigger_window
  #  commands - window command list
  #  index    - selection index
  #  Creates and sets up an edit trigger window.
  #----------------------------------------------------------------------------
  def create_edit_trigger_window(commands, index = 0)
    # deactivate trigger command window
    @ecommand_window.active = false
    # create edit trigger window
    @edit_trigger_window = Window_Command.new(320, commands)
    # set edit trigger coordinates
    @edit_trigger_window.height = 480 if @edit_trigger_window.height > 480
    @edit_trigger_window.x = 160
    @edit_trigger_window.y = 240 - @edit_trigger_window.height / 2
    @edit_trigger_window.z = @ecommand_window.z + 100
    # set edit trigger window active
    @edit_trigger_window.active = true
    # set edit trigger window cursor
    @edit_trigger_window.index = index
  end
  #----------------------------------------------------------------------------
  # update_edit_trigger
  #  The edit trigger window update processing method.
  #----------------------------------------------------------------------------
  def update_edit_trigger
    # update triggers window
    @edit_trigger_window.update
    # if B is pressed
    if Input.trigger?(Input::B)
      # play cancel sound
      $game_system.se_play($data_system.cancel_se)
      # return to edit command window
      return_to_edit_command_window
    # if C is pressed
    elsif Input.trigger?(Input::C)
      # update specific action
      case @ecommand_window.index
      when 0
        # play sound
        $game_system.se_play($data_system.decision_se)
        # store old activator value
        old = @edit_window.trigger.activator
        # set new value for activator
        @edit_window.trigger.activator = @edit_trigger_window.index
        # refresh trigger display
        @edit_window.refresh
        # if probability activator
        if @edit_window.trigger.activator == BlizzABS::TRGProbability
          # set condition to HP
          @edit_window.trigger.condition = BlizzABS::TRGHP
          # set comparison operator to equal
          @edit_window.trigger.comparator = BlizzABS::TRGEqual
          # set target to default
          @edit_window.trigger.target = BlizzABS::TRGTargetDefault
        # if party leader activator and location condition
        elsif @edit_window.trigger.activator == BlizzABS::TRGLeader &&
            @edit_window.trigger.condition == BlizzABS::TRGLocation
          # set condition to HP
          @edit_window.trigger.condition = BlizzABS::TRGHP
        end
        # return to edit command window
        return_to_edit_command_window
      when 1
        # if state condition
        if @edit_window.trigger.condition == BlizzABS::TRGState
          # set comparison operator to equal
          @edit_window.trigger.comparator = BlizzABS::TRGEqual
          # set state to normal
          @edit_window.trigger.value = 0
        # if location condition
        elsif @edit_window.trigger.condition == BlizzABS::TRGLocation
          # set comparison operator to equal
          @edit_window.trigger.comparator = BlizzABS::TRGEqual
        end
        # play sound
        $game_system.se_play($data_system.decision_se)
        # set new value for trigger
        @edit_window.trigger.condition = @edit_trigger_window.index
        # refresh trigger display
        @edit_window.refresh
        # return to edit command window
        return_to_edit_command_window
      when 2
        # play sound
        $game_system.se_play($data_system.decision_se)
        # set new value for trigger
        @edit_window.trigger.comparator = @edit_trigger_window.index
        # refresh trigger display
        @edit_window.refresh
        # return to edit command window
        return_to_edit_command_window
      when 3
        # play sound
        $game_system.se_play($data_system.decision_se)
        # if condition is state or location
        if @edit_window.trigger.condition == BlizzABS::TRGState ||
            @edit_window.trigger.condition == BlizzABS::TRGLocation
          # set to index
          @edit_window.trigger.value = @edit_trigger_window.index
        else
          # set to selected value
          @edit_window.trigger.value = @edit_trigger_window.number
        end
        # refresh trigger display
        @edit_window.refresh
        # return to edit command window
        return_to_edit_command_window
      when 4
        # play sound
        $game_system.se_play($data_system.decision_se)
        # temporary variables
        old, new = @edit_window.trigger.action_type, @edit_trigger_window.index
        # if not skills availabled and selected skill action type
        if @skills.size == 0 && new == BlizzABS::TRGSkill
          # it is actually item action type
          new == BlizzABS::TRGItem
        end
        # if wasn't skill action type until now
        if old != BlizzABS::TRGSkill && new == BlizzABS::TRGSkill
          # set first available skill
          @edit_window.trigger.action_data = @skills[0]
        # if wasn't item action type until now
        elsif old != BlizzABS::TRGItem && new == BlizzABS::TRGItem
          # set first available item
          @edit_window.trigger.action_data = @items[0]
        end
        # set new value for trigger
        @edit_window.trigger.action_type = @edit_trigger_window.index
        # refresh trigger display
        @edit_window.refresh
        # return to edit command window
        return_to_edit_command_window
      when 6
        # play sound
        $game_system.se_play($data_system.decision_se)
        # set new value for trigger
        @edit_window.trigger.target = @edit_trigger_window.index
        # refresh trigger display
        @edit_window.refresh
        # return to edit command window
        return_to_edit_command_window
      when 5
        # play sound
        $game_system.se_play($data_system.decision_se)
        # if skill action type
        if @edit_window.trigger.action_type == BlizzABS::TRGSkill
          # set skill ID
          @edit_window.trigger.action_data = @skills[@edit_trigger_window.index]
        # if item action type
        elsif @edit_window.trigger.action_type == BlizzABS::TRGItem
          # set item ID
          @edit_window.trigger.action_data = @items[@edit_trigger_window.index]
        end
        # refresh trigger display
        @edit_window.refresh
        # return to edit command window
        return_to_edit_command_window
      end
    end
  end
  #----------------------------------------------------------------------------
  # return_to_edit_command_window
  #  Sets everything up so the edit command window is active again.
  #----------------------------------------------------------------------------
  def return_to_edit_command_window
    # activate trigger command window
    @ecommand_window.active = true
    # delete edit trigger window
    @edit_trigger_window.dispose
    # clear variables
    @edit_trigger_window = nil
    # check edit window display
    check_edits
  end
  
end
