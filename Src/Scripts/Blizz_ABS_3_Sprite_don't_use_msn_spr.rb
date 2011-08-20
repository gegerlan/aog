=begin
Makes sure we want to use the weapon sprites before using them
=end
class Map_Battler < Game_Character
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
        setup_sprites(BlizzABS::SPRAttack) if weapon_sprites?
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
        set_sprite_animation(BlizzABS::SPRSkill, skill_sprites?, skill) if skill_sprites?
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
end