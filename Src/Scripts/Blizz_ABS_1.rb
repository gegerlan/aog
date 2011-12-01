#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Blizz-ABS by Blizzard and winkio
# Version: 2.79
# Auto-Generated Configuration Script
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# 
#                                    PART 1
# 
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
# Copy-paste this auto-generated script into the script slot instead of Part 1
# of the default Blizz-ABS script.
# 
# If you find any bugs, please report them here:
# http://forum.chaos-project.com
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=

#==============================================================================
# BlizzABS
#------------------------------------------------------------------------------
#  This is the master control, configuration, utility and battle process
#  module for Blizz-ABS.
#==============================================================================

module BlizzABS
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Control
  #----------------------------------------------------------------------------
  #  This module provides in-game control configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
  module Control
    
    CUSTOM_CONTROLS = true
    DISABLE_DEFAULT = true
    UP = "Key['W'], Key['Arrow Up']"
    LEFT = "Key['A'], Key['Arrow Left']"
    DOWN = "Key['S'], Key['Arrow Down']"
    RIGHT = "Key['D'], Key['Arrow Right']"
    PREVPAGE = "Key['Q']"
    NEXTPAGE = "Key['E']"
    CONFIRM = "Key['K'], Key['Enter'], Key['Z']"
    CANCEL = "Key['F'], Key['X'], Key['Esc'], Key['End'],  Key['NumberPad 0']"
    ATTACK = "Key['K'], Key['Z'], Key['Enter']"
    DEFEND = "Key['L']"
    SKILL = "Key['C'], Key['Ctrl']" 
    ITEM = "Key['I'], Key['V']"
    SELECT = "Key['O']"
    HUD = "Key['=']"
    HOTKEY = "Key['Tab']"
    MINIMAP = "Key['-']"
    RUN = "Key['M'],Key['Shift']"
    SNEAK = "Key['.']"
    JUMP = "Key[',']"
    TURN = "Key['U'], Key['V']"
    
  end
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Config
  #----------------------------------------------------------------------------
  #  This module provides Blizz-ABS configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
  module Config
    
    # 2.1. # Basic Configuration
    MAX_PARTY = 4
    MAX_PETS = 1
    MAX_MONSTERS = 1
    MAX_SUMMONS = 2
    CATERPILLAR = true
    CORPSES = false
    EMPTY_CORPSES = false
    RECOVER_ON_LEVEL_UP = false
    FULL_DEFEND = false
    DIRECT_HOTKEYS = false
    AUTO_GAMEOVER = false
    DROP_AMMO = true
    MENU_COLOR_TINT = 0
    DISABLE_ABS_MODE = 0
    ITEM_DROP = true
    ITEM_PICKUP_SOUND_FILE = RPG::AudioFile.new('056-Right02', 80, 100)
    GOLD_DROP = ''
    GOLD_PICKUP_SOUND_FILE = RPG::AudioFile.new('', 80, 100)
    DROP_TIME = 60
    EVENT_LOCK = 40
    ANIMATED_IDS = []
    
    # 2.2. # Movement Configuration
    PIXEL_MOVEMENT_RATE = 0
    REPAIR_MOVEMENT = true
    EIGHT_WAY_MOVEMENT = true
    SNEAK_ON_CHARGE = false
    NORMAL_SPEED = 4
    RUN_SPEED = 5
    SNEAK_SPEED = 3
    #JUMPING = 2
    JUMPING = 0
    NO_JUMP_TAGS = []
    ALLOW_JUMP_TAGS = []
    NO_FLOOR_TAGS = []
    
    # 2.3. # Lag Prevention Configuration
    INTELLIGENT_PASSABILITY = true
    ABSEAL_AUTOKILL = true
    ABSEAL_FACTOR = 4
    DISABLE_ANTILAG_IDS = []
    
    # 2.4. # Game Info Configuration
    HUD_ENABLED = true
    HUD_POSITION = 0
    HUD_TYPE = 0
    MINIMAP = true
    HOTKEYS = true
    ENEMY_HEALTH_BARS = 0
    ENEMY_HEALTH_BARS_MATCH_WIDTH = false
    BOUNCING_DAMAGE = false
    WEAPON_DATA_MODE = [0, 0]
    SKILL_DATA_MODE = [0, 0, 0]
    ITEM_DATA_MODE = [0, 0, 0]
    
    # 2.5. # Enemy Behavior Configuration
    AI_DEFAULT_ATTRIBUTES = '00000000'
    AI_DELAY_TIME = 120
    VIEW_RANGE = 5
    HEARING_RANGE_RATIO = 40
    RESPAWN_TIME = 0
    WALL_TAGS = []
    NO_ENEMY_TAGS = []
    
    # 2.6. # Animation Configuration
    ANIMATIONS = true
    SMALL_ANIMATIONS = true
    DISPLAY_LEVEL_UP = true
    LEVEL_UP_ANIMATION_ID = 0
    FLEE_ANIMATION_ID = 0
    CALL_HELP_ANIMATION_ID = 0
    DEFEND_ANIMATION_ID = 0
    UNSUMMON_ANIMATION_ID = 0
    
    # 2.7. # Sprite Control Configuration
    A_ACTION_SPRITES = true
    A_WEAPON_SPRITES = false
    A_DEFEND_SPRITES = false
    A_SKILL_SPRITES = false
    A_ITEM_SPRITES = false
    A_IDLE_SPRITES = true
    A_CHARGE_SPRITES = true
    A_CHARGE_WEAPON_SPRITES = false
    A_CHARGE_SKILL_SPRITES = false
    A_CHARGE_ITEM_SPRITES = false
    E_ACTION_SPRITES = false
    E_SKILL_SPRITES = false
    E_IDLE_SPRITES = false
    E_CHARGE_SPRITES = true
    E_CHARGE_SKILL_SPRITES = false
    RUNNING_SPRITES = true
    SNEAKING_SPRITES = true
    JUMPING_SPRITES = true
    
  end
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Alignments
  #----------------------------------------------------------------------------
  #  This module provides alignment configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
  module Alignments
    
    GROUPS = [1, 2, 3, 4, 5, 6, 7]
    LIFELESS_GROUPS = [4]
    LINKED_GROUPS = [5, 6]
    PERMANENT_GROUPS = [5, 6]
    ACTOR_GROUP = 1
    ENEMY_GROUP = 2
    
    def self.enemies(id)
      case id
      when 1 then return [2]
      when 2 then return [1, 3, 5, 6]
      when 5 then return [2]
      when 7 then return [2, 3]
      end
      return []
    end
    
    def self.allies(id)
      case id
      when 1 then return [1]
      when 2 then return [2]
      when 5 then return [5, 6]
      when 6 then return [5, 6]
      when 7 then return [1]
      end
      return []
    end
    
    def self.neutral(id)
      return []
    end
    
  end
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Weapons
  #----------------------------------------------------------------------------
  #  This module provides weapon configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
  module Weapons
    
    def self.type(id)
      case id
      when 12 then return BOW # Bronze Gun
      when 13 then return BOW # Mythril Gun
      end
      return SWORD
    end
    
    def self.combo(id)
      return 0
    end
    
    def self.projectile_speed(id)
      case id
      when 12 then return 6 # Bronze Gun
      when 13 then return 6 # Mythril Gun
      end
      return 5
    end
    
    def self.range(id)
      case id
      when 11 then return 8.0 # Steel Bow
      when 12 then return 8.0 # Bronze Gun
      when 13 then return 8.0 # Mythril Gun
      end
      return 1.5
    end
    
    def self.penalty(id)
      case id
      when 12 then return 32 # Bronze Gun
      when 13 then return 32 # Mythril Gun
      end
      return 16
    end
    
    def self.frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.charge(id)
      return [CHARGENone, 0]
    end
    
    def self.charge_frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.consume(id)
      return []
    end
    
  end
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Skills
  #----------------------------------------------------------------------------
  #  This module provides skill configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
   module Skills
    
    def self.type(id)
      case id
      when 7 then return [SHOOT, EXPLAny, 2.0, 11] # Burning Passion
      when 8 then return [DIRECT, EXPLAny, 3.0, 11] # Blazing Passion
      when 9 then return [DIRECT, EXPLAny, 3.0, 11] # Passion Inferno
      when 10 then return [HOMING, EXPLNone] # Frigid Glance
      when 11 then return [HOMING, EXPLNone] # Frigid Glare
      when 12 then return [HOMING, EXPLNone] # Ice Queen
      when 13 then return [DIRECT, EXPLTarget, 1.0, 7] # Shocking Rumor
      when 14 then return [DIRECT, EXPLTarget, 1.0, 7] # Shocking Revealation
      when 15 then return [BEAM, EXPLAny, 20.0, 7] # Shocking Truth
      when 19 then return [TRAP, EXPLAny, 1.0, 40] # Dirty Hole
      when 20 then return [TRAP, EXPLAny, 3.0, 42] # Gaping Hole
      when 21 then return [DIRECT, EXPLAny, 5.0, 42] # Open Hole
      end
      return [DIRECT, EXPLNone]
    end
    
    def self.combo(id)
      return 0
    end
    
    def self.projectile_speed(id)
      case id
      when 10 then return 6 # Frigid Glance
      when 11 then return 6 # Frigid Glare
      end
      return 5
    end
    
    def self.range(id)
      case id
      when 1 then return 5.0 # Heal
      when 2 then return 7.0 # Greater Heal
      when 3 then return 5.0 # Mass Heal
      when 4 then return 4.0 # Remedy
      when 7 then return 8.0 # Burning Passion
      when 8 then return 8.5 # Blazing Passion
      when 9 then return 7.0 # Passion Inferno
      when 10 then return 10.0 # Frigid Glance
      when 11 then return 12.0 # Frigid Glare
      when 12 then return 10.0 # Ice Queen
      when 13 then return 7.0 # Shocking Rumor
      when 14 then return 8.0 # Shocking Revealation
      when 15 then return 20.0 # Shocking Truth
      when 21 then return 15.0 # Open Hole
      when 88 then return 10.0
      end
      return 1.0
    end
    
    def self.penalty(id)
      case id
      when 8 then return 30 # Blazing Passion
      when 9 then return 35 # Passion Inferno
      when 10 then return 5 # Frigid Glance
      when 11 then return 8 # Frigid Glare
      when 13 then return 20 # Shocking Rumor
      when 15 then return 36 # Shocking Truth
      end
      return 24
    end
    
    def self.frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.charge(id)
      return [CHARGENone, 0]
    end
    
    def self.charge_frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.trap(id)
      case id
      when 19 then return 60 # Dirty Hole
      when 20 then return 60 # Gaping Hole
      end
      return 10
    end
    
    def self.summon(id)
      return [SUMMONPet, 0, 0]
    end
    
  end
  
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Items
  #----------------------------------------------------------------------------
  #  This module provides item configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
  module Items
    
    def self.type(id)
      return [DIRECT, EXPLNone]
    end
    
    def self.combo(id)
      return 0
    end
    
    def self.projectile_speed(id)
      return 5
    end
    
    def self.range(id)
      return 5.5
    end
    
    def self.penalty(id)
      return 24
    end
    
    def self.frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.charge(id)
      return [CHARGENone, 0]
    end
    
    def self.charge_frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.trap(id)
      return 10
    end
    
    def self.summon(id)
      return [SUMMONPet, 0, 0]
    end
    
    def self.drop_sprite(id)
      return false
    end
    
  end
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Enemies
  #----------------------------------------------------------------------------
  #  This module provides enemy configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
  module Enemies
    
    def self.type(id)
      return SWORD
    end
    
    def self.combo(id)
      return 0
    end
    
    def self.projectile_speed(id)
      return 5
    end
    
    def self.range(id)
      return 1.5
    end
    
    def self.penalty(id)
      return 16
    end
    
    def self.frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.charge(id)
      return [CHARGENone, 0]
    end
    
    def self.charge_frames(id)
      return [3, 3, 3, 3]
    end
    
    def self.delay(id)
      return nil
    end
    
    def self.perception(id)
      case id
      when 34 then return [30, 60] # Cult Leader
      end
      return nil
    end
    
    def self.ai(id)
      case id
      when 34 then return '00001110' # Cult Leader
      end
      return nil
    end
    
    def self.destruct(id)
      return 0
    end
    
    def self.respawn(id)
      return 0
    end
    
  end
  
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  # BlizzABS::Combos
  #----------------------------------------------------------------------------
  #  This module provides combo configurations.
  #:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
  
  module Combos
    
    def self.total_actions(com)
      return 1
    end
    
    def self.commands(com)
      return []
    end
    
    def self.anim_data(com)
      return [0, [3, 3, 3, 3], '', false]
    end
    
  end
  
end
