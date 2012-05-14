#
# Set the graphics for a game character
#
# This is a fix for what otherwise requires
# the usage of move commands to modify this
# value.
class Game_Character
  def set_graphics(character_name, character_hue, direction = nil, pattern = nil)
      @tile_id = 0
      @character_name = character_name
      @character_hue = character_hue
      if direction != nil
        @direction = direction
        @original_direction = @direction
        @prelock_direction = 0
      end
      if pattern != nil
        @pattern = pattern
        @original_pattern = @pattern
      end
  end
end