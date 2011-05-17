=begin
A quick fix for the loot bug, where loot wouldn't spawn properly (sprite, but
not event).
The deletion of the event is moved to the end of the method, making sure the
id of the loot is always at least one id higher than the item destroyed.
=end
module BlizzABS
  class Processor
    def remove_enemy(enemy)
      # stop except if enemy event code is to be executed or enemy is erased
      return if enemy.execute || enemy.erased
      # start event code if there is some
      enemy.start if enemy.trigger == BlizzABS::CETDeath
      # get all dropped items on the map
      items = drop_items(enemy)
      # if not dropping
      if !BlizzABS::Config::ITEM_DROP
        # add items into inventory
        items.each {|item|
            case item
            when RPG::Weapon then $game_party.gain_weapon(item.id, 1)
            when RPG::Armor then $game_party.gain_armor(item.id, 1)
            when RPG::Item then $game_party.gain_item(item.id, 1)
            end}
        # clear items
        items = []
      end
      # experience result
      exp_result(enemy)
      # gold result
      gold = gold_result(enemy)
      # if not using drop gold mode
      if BlizzABS::Config::GOLD_DROP == ''
        # just increase gold
        $game_party.gain_gold(gold)
      # if dropping any gold
      elsif gold > 0
        # add gold to items
        items = [gold] + items
      end
      # execute all additional enemy results
      additional_result(enemy)
      # if using corpses
      if BlizzABS::Config::CORPSES
        # if using empty corpses or any drop exists
        if BlizzABS::Config::EMPTY_CORPSES || items.size > 0
          # create a corpse dropped items
          drop_event(items, enemy.real_x, enemy.real_y, enemy)
        end
      else
        # create all necessary dropped items
        items.each {|item| drop_event([item], enemy.real_x, enemy.real_y)}
      end
      # remove except if code needs to be executed
      $game_map.events.delete(enemy.id) unless enemy.execute
    end
  end
end