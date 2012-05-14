=begin
Removes use of map_data.abs
=end
module BlizzABS
  class Processor
    def initialize
      # load player controller
      @player = Controller.new
      # create Blizz-ABS Cache
      @cache = Cache.new
      # utilities
      @util = Utility.new
      # refresh passability data
      # @util.check_map_data if $DEBUG
      # create handler for player battle input
      @controls = Controls.new
      # AI instance
      @AI = AI.new
      # map actors, summoned pets and summoned monsters
      @actors, @pets, @monsters = [], [], []
      # counters for pets and monsters
      @summon_time = {}
    end
  end
end
class Game_Map
  def setup(map_id)
    # array of Respawn Points
    @respawns = []
    # call original method
    setup_blizzabs_later(map_id)
    # setup enemies on the map
    $BlizzABS.battlers_refresh
    # create virtual passability map
    @virtual_passability = $BlizzABS.util.setup_passability(@map)
    # reset remotes, damage and beam sprites and clear observation data
    $BlizzABS.cache.clean
  end
end 