class Condition_Item
  attr_accessor :modifiers
end

# Define modifiers for weapon and armors if none exists.
class Scene_Load
  alias equip_mod_read_save_data read_save_data
  def read_save_data(file)
    equip_mod_read_save_data(file)
    for i in 1..999
      actor = $game_actors[i]
      break if actor == nil
      weapon = actor.weapon
      if weapon != nil
        weapon.modifiers = Hash.new(1) if weapon.modifiers == nil
      end

      actor.armors.each do |armor|
        if armor != nil
          armor.modifiers = Hash.new(1) if armor.modifiers == nil
        end
      end
    end
    $game_party.armors.each do |armor|
      armor.modifiers = Hash.new(1) if armor.modifiers == nil
    end
    $game_party.weapons.each do |weapon|
      weapon.modifiers = Hash.new(1) if weapon.modifiers == nil
    end
  end
end