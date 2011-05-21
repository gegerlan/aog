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
end