=begin

Update of Blizz-ABS 2 Game_Map class, to solve issues with events using tilesets
not being able to block the player.

The change is that a character_name isn't required for the event, making valid 
tiles blocking by default, unless tile passage is set, or event set to through.

=end
class Game_Map
  #----------------------------------------------------------------------------
  # event_check
  #  x          - x-coordinate
  #  y          - y-coordinate
  #  d          - direction
  #  self_event - self event
  #  Checks if passable events. (pixel movement)
  #----------------------------------------------------------------------------
  def event_check(x, y, d, self_event = nil)
    # get pixel movement rate and set bit
    pix, bit = $BlizzABS.pixel, (1 << (d / 2 - 1)) & 0x0F
    # iterate trough all events except self
    (self.events_only - [self_event]).each {|event|
        # if there's an event that's not through and has a graphic
        if (event.character_name != "" || event.tile_id >= 384) && 
           event.x == x / pix && 
           event.y == y / pix && !event.through &&
           !self_event.is_a?(Map_Battler)
          # if obstacle bit is set
          if @passages[event.tile_id] & bit != 0
            # get x and y of next tile
            case d
            when 2 then nx, ny = x / pix, (y + 1) / pix
            when 4 then nx, ny = (x - 1) / pix, y / pix
            when 6 then nx, ny = (x + 1) / pix, y / pix
            when 8 then nx, ny = x / pix, (y - 1) / pix
            else
              nx = ny = nil
            end
            # impassable if not on the same tile anymore
            return false if x / pix != nx || y / pix != ny
          # if obstacle bit is set in all directions
          elsif @passages[event.tile_id] & 0x0F == 0x0F
            # impassable in the given direction
            return false
          # if priority is 0
          elsif @priorities[event.tile_id] == 0
            # passable in the given direction
            return true
          # if event is not a tile and not through
          elsif !event.through
            # impassable in any direction
            return false
          end
        end}
    # passable
    return true
  end
end