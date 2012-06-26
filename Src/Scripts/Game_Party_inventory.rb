class Game_Party
  # The worth of surpless inventory, and what's in use.
  def worth
    @gold + party_worth
  end
  # The current gold and surpless inventory (i.e. what you have, but isn't forced to use)
  def wealth
    @gold + inventory_worth
  end
  # Get the total value of what's worn, and the worth of what's in the inventory
  def party_worth
    get_worth_of( shared_inventory + actors_inventory )
  end
  # Get what the surpless inventory is worth
  def inventory_worth
    get_worth_of( shared_inventory )
  end
  # Get the value of the current shared inventory
  def get_worth_of(inventory)
    inventory.inject(0) { |sum, inv| (inv.respond_to? :price) ? (sum + inv.price) : (sum) } 
  end
  # Returns the shared inventory (not equipped)
  def shared_inventory
    @weapons + @armors + items_to_obj
  end
  # Get the equipped inventory of an actor in the party
  def actor_inventory(actor)
    actor = actors[actor] if actor.is_a?(Numeric)
    [actor.weapon] + actor.armors
  end
  # Get all the equipped items of the actors in the party
  def actors_inventory
    actors.map { |actor| actor_inventory(actor) }.flatten
  end
  # Can anything be sold in the inventory?
  def can_sell?
    inventory.any? { |inv| inv.price > 0 }
  end
  # Turns all items into item objects  
  def items_to_obj
    item_basket = []
    @items.each do |id, nbr|
      nbr.times do |i|
        item_basket << $data_items[id]
      end
    end
    item_basket
  end
end