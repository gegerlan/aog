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
#                                    PART 2
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
# BlizzABS
#------------------------------------------------------------------------------
#  This is the master control, configuration, utility and battle process
#  module for Blizz-ABS.
#==============================================================================

module BlizzABS
  
  # version of Blizz-ABS
  VERSION = 2.7
  # edition of Blizz-ABS
  EDITION = 'Normal'
  # constants to help the user when using the special commands
  PARTY = false
  TROOP = false
  INCREASE = 0
  DECREASE = 1
  CONSTANT = 0
  VARIABLE = 1
  KILL = true
  NO_KILL = false
  ADD = true
  REMOVE = false
  ATTACK = 0
  DEFEND = 1
  ESCAPE = 2
  SKILL = 3
  ITEM = 4
  ENEMIES = true
  ACTORS = false
  NONE = nil
  
  # attack types
  SWORD = 1
  SPEAR = 2
  FLAIL = 3
  BOOMERANG = 4
  BOW = 5
  BOW_ARROW = 6
  SHURIKEN = 7
  
  # special types
  SHOOT = 1
  HOMING = 2
  DIRECT = 3
  BEAM = 4
  TRAP = 5
  TIMED = 6
  SUMMON = 7
  
  # explode types
  EXPLNone = 1
  EXPLTarget = 2
  EXPLEnd = 3
  EXPLAny = 4
  
  # remote types
  REMReturning = 0
  REMOnReturn = 1
  REMNormal = 2
  REMShotItem = 3
  REMShotWeapon = 4
  REMNormalSkill = 5
  REMBreakSkill = 6
  REMInitSkill = 7
  REMHomingSkill = 8
  REMNormalItem = 9
  REMBreakItem = 10
  REMInitItem = 11
  REMHomingItem = 12
  REMTrapSkill = 13
  REMTrapItem = 14
  REMTimedSkill = 15
  REMTimedItem = 16
  
  # remote groups
  REMRequest = [REMReturning, REMNormalSkill, REMBreakSkill, REMInitSkill,
                REMTrapSkill, REMNormalItem, REMBreakItem, REMHomingItem,
                REMTrapItem, REMTimedSkill, REMTimedItem]
  REMSkills = [REMNormalSkill, REMBreakSkill, REMInitSkill, REMHomingSkill,
               REMTrapSkill, REMTimedSkill]
  REMItems = [REMNormalItem, REMBreakItem, REMInitItem, REMHomingItem,
              REMTrapItem, REMTimedItem]
  REMPersistent = [REMReturning, REMOnReturn, REMBreakSkill, REMBreakItem]
  REMHomingBase = [REMInitSkill, REMHomingSkill, REMInitItem,
                   REMHomingItem]
  REMHomingExtend = [REMOnReturn, REMInitSkill, REMHomingSkill,
                     REMInitItem, REMHomingItem]                
  
  # charge types
  CHARGENone = 1
  CHARGEFreeze = 2
  CHARGEMove = 3
  CHARGETrigger = 4
  
  # charge data
  CHARGEAttack = 0
  CHARGESkill = 1
  CHARGEItem = 2
  
  # summon data
  SUMMONNone = 1
  SUMMONPet = 2
  SUMMONMonster = 3
  
  # command types
  COMScript = 1
  COMWait = 2
  COMMove = 3
  COMTurn = 4
  COMJump = 5
  COMAttack = 6
  COMSkill = 7
  COMItem = 8
  COMDefend = 9
  COMCharacter = 10
  COMBattler = 11
  COMInput = 12
  COMVariable = 13
  COMCondition = 14
  COMFreeze = 15
  COMCompletion = 16
  COMGoTo = 17
  COMAbort = 18
  
  # direction command types
  DIR90Right = 11
  DIR90Left = 12
  DIRForward = 13
  DIRBackward = 14
  DIRTowardPlayer = 15
  DIRAwayPlayer = 16
  DIRRandom4 = 17
  DIRRandom8 = 18
  DIR45Right = 19
  DIR45Left = 20
  
  # character command types
  CHSpeed = 1
  CHFrequency = 2
  CHSprite = 3
  CHAnimation = 4
  CHFix = 5
  CHThrough = 6
  CHOnTop = 7
  CHOpacity = 8
  
  # variable command types
  VARGame = 1
  VARCombo = 2
  VARCharacter = 3
  VARParty = 4
  VARInput = 5
  VARConstant = 6
  VARScript = 7
  
  # input trigger types
  INPress = 1
  INTrigger = 2
  INRelease = 3
  
  # value command types
  VALHp = 1
  VALSp = 2
  VALMaxHp = 3
  VALMaxSp = 4
  VALState = 5
  VALExp = 6
  VALLevel = 7
  VALTile = 8
  VALDirection = 9
  
  # trigger data
  TRGLeader = 0
  TRGAlly = 1
  TRGSelf = 2
  TRGEnemy = 3
  TRGProbability = 4
  
  # trigger target data
  TRGTargetDefault = 0
  TRGTargetActivator = 1
  
  # trigger condition data
  TRGHP = 0
  TRGSP = 1
  TRGState = 2
  TRGLocation = 3
  
  # trigger comparison data
  TRGEqual = 0
  TRGNotEqual = 1
  TRGGreater = 2
  TRGGreaterEqual = 3
  TRGLess = 4
  TRGLessEqual = 5
  
  # trigger action data
  TRGAttack = 0
  TRGDefend = 1
  TRGSkill = 2
  TRGItem = 3
  
  # trigger location data
  TRGClosest = 0
  TRGFarthest = 1
  
  # action data
  ACTNone = 0
  ACTAttack = 1
  ACTDefend = 2
  ACTEscape = 3
  ACTSkill = 4
  ACTItem = 5
  
  # AI update data
  UPDLight = 1
  UPDMedium = 2
  UPDHeavy = 3
  UPDFull = 4
  
  # custom event triggers
  CETNone = -1
  CETActionButton = 0
  CETPlayerTouch = 1
  CETEventTouch = 2
  CETDeath = 9
  CETWeapon = 21
  CETSkill = 22
  CETItem = 23
  CETEnemy = 24
  CETDefault = CETDeath
  CETSpecial = [CETWeapon, CETSkill, CETItem, CETEnemy]
  
  # spriteset filenames
  SPRProjWeapon = 'projectile_weapon_'
  SPRProjSkill = 'projectile_skill_'
  SPRProjItem = 'projectile_item_'
  SPRProjEnemy = 'projectile_enemy_'
  SPRAttack = '_atk'
  SPRWeapon = '_wpn'
  SPRWeaponID = '_wpn_'
  SPRDefend = '_def'
  SPRSkill = '_skl'
  SPRItem = '_itm'
  SPRCharge = '_chr'
  SPRJumping = '_jmp'
  SPRRunning = '_run'
  SPRSneaking = '_snk'
  SPRIdle = '_idl'
  SPRCorpse = '_crp'
  
  #============================================================================
  # BlizzABS::Cache
  #----------------------------------------------------------------------------
  #  This class holds a few bitmaps so they don't need to be drawn each time
  #  which improves speed and reduces lag. It also holds damage sprites and
  #  remote characters. It also holds constant data that is used in Blizz-ABS
  #  to improve the performance (i.e. creating arrays of data for processing).
  #============================================================================
  
  class Cache
    
    # constant cache
    LoopDir8 = [1, 2, 3, 6, 9, 8, 7, 4]
    Dir8 = [1, 2, 3, 4, 6, 7, 8, 9]
    Dir4 = [2, 4, 6, 8]
    NoDirsUpLeft = [1, 4, 7, 8, 9]
    NoDirsDownLeft = [1, 2, 3, 4, 7]
    NoDirsUpRight = [3, 6, 7, 8, 9]
    NoDirsDownRight = [1, 2, 3, 6, 9]
    NoDirsRight = [2, 3, 6, 8, 9]
    NoDirsLeft = [1, 2, 4, 8, 7]
    NoDirsDown = [1, 2, 3, 4, 6]
    NoDirsUp = [4, 6, 7, 8, 9]
    TDirs = [[0, true], [1, true], [2, true], [3, true], [4, true], [5, true],
        [6, true], [7, true], [8, true], [9, true]]
    FDirs = [[0, false], [1, false], [2, false], [3, false], [4, false],
        [5, false], [6, false], [7, false], [8, false], [9, false]]
    DirDownLeft = [2, 4]
    DirLeftDown = [4, 2]
    DirDownRight = [2, 6]
    DirRightDown = [6, 2]
    DirLeftUp = [4, 8]
    DirUpLeft = [8, 4]
    DirRightUp = [6, 8]
    DirUpRight = [8, 6]
    DirOffsets = [[0, 0], [-1, 1], [0, 1], [1, 1], [-1, 0], [0, 0], [1, 0],
                  [-1, -1], [0, -1], [1, -1]]
    PathDirs = [[0, 1, 2], [-1, 0, 4], [1, 0, 6], [0, -1, 8]]
    Keys = 0..9
    HotkeyRange = 1..10
    PressTrigger = [0]
    TouchTrigger = [1, 2]
    BasicTrigger = [0, 1, 2]
    MapLayers = [2, 1, 0]
    ScopeOne = [1, 3, 5]
    HotKeys = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    EmptyKeys = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
    FramesDefault = [3, 3, 3, 3]
    
    CommandsAIBehavior = ['Behavior', 'Next', 'Previous', 'Exit']
    CommandsAITrigger = ['Triggers', 'Next', 'Previous', 'Exit']
    CommandsTrigger = ['Edit', 'Add new', 'Delete', 'Copy', 'Move up',
        'Move down', 'Exit']
    CommandsPreMenu = ['Menu', 'Hotkeys', 'AI Behavior', 'AI Triggers', 'Cancel']
    CommandsEdit = ['Activator', 'Condition', 'Comparison', 'Value',
        'Action Type', 'Action', 'Target Type', 'Done', 'Cancel']
        
    WORDAll = 'All'
    WORDState = 'State'
    WORDTarget = 'Target'
    WORDNormalState = 'Normal'
    WORDLocation = 'Location'
    WORDAggressive = 'Aggressive'
    WORDPassive = 'Passive'
    WORDOffensive = 'Offensive'
    WORDDefensive = 'Defensive'
    
    TRGActivators = ['Leader', 'Ally', 'Self', 'Enemy', 'Probability']
    TRGTargets = ['Default', 'Activator']
    TRGComparators = ['==', '!=', '>', '>=', '<', '<=']
    TRGLocations = ['Closest', 'Farthest']
    
    FontNameDamage = 'Arial Black'
    FontSizeDamage = 24
    FontItalicDamage = true
    FontBoldDamage = false
    TXTLvlUp = 'LvUp'
    TXTMiss = 'Miss'
    TXTDefend = load_data('Data/System.rxdata').words.guard
    
    DMGColors = {}
    DMGColors[TXTLvlUp] = Color.new(192, 96, 255)
    DMGColors[TXTMiss] = Color.new(192, 192, 192)
    DMGColors[TXTDefend] = Color.new(192, 192, 192)
    DMGColors[0] = Color.new(192, 192, 192)
    DMGColors['Critical'] = Color.new(255, 0, 0)
    DMGColors['HP-A'] = Color.new(255, 192, 64)
    DMGColors['HP-E'] = Color.new(255, 0, 0)
    DMGColors['HP+A'] = Color.new(0, 192, 255)
    DMGColors['HP+E'] = Color.new(0, 192, 255)
    DMGColors['SP-A'] = Color.new(255, 255, 0)
    DMGColors['SP-E'] = Color.new(255, 255, 0)
    DMGColors['SP+A'] = Color.new(0, 255, 0)
    DMGColors['SP+E'] = Color.new(0, 255, 0)
    DMGColors['Default'] = Color.new(255, 255, 255)
    DMGColors['Shadow'] = Color.new(0, 0, 0)
        
    # setting all accessible variables
    attr_reader :damages
    attr_reader :remotes
    attr_reader :beams
    #--------------------------------------------------------------------------
    # Initialization
    #-------------------------------------------------------------------------- 
    def initialize
      # initialize image, damage sprite, beam sprite and projectile buffers
      @data, @damages, @remotes, @beams = {}, [], [], []
      # add image
      @data['minimap_autotile'] = _minimap_autotile
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['menu_arrow'] = _menu_arrow
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['white_arrow'] = _white_arrow
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['green_arrow'] = _green_arrow
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['blue_arrow'] = @data['green_arrow'].clone
      # change color
      @data['blue_arrow'].hue_change(120)
      # add image
      @data['red_arrow'] = @data['green_arrow'].clone
      # change color
      @data['red_arrow'].hue_change(-120)
      # add image
      @data['yellow_arrow'] = @data['green_arrow'].clone
      # change color
      @data['yellow_arrow'].hue_change(-60)
      # add image
      @data['violet_arrow'] = @data['green_arrow'].clone
      # change color
      @data['violet_arrow'].hue_change(150)
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['empty_hud_white_bar'] = _empty_hud_white_bar
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['empty_hud_green_bar'] = _empty_hud_green_bar
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['empty_hud_blue_bar'] = @data['empty_hud_green_bar'].clone
      # change color
      @data['empty_hud_blue_bar'].hue_change(120)
      # add image
      @data['empty_hud_red_bar'] = @data['empty_hud_green_bar'].clone
      # change color
      @data['empty_hud_red_bar'].hue_change(-120)
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['hud_white_bar'] = _hud_white_bar
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['hud_green_bar'] = _hud_green_bar
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['hud_blue_bar'] = @data['hud_green_bar'].clone
      # change color
      @data['hud_blue_bar'].hue_change(120)
      # add image
      @data['hud_red_bar'] = @data['hud_green_bar'].clone
      # change color
      @data['hud_red_bar'].hue_change(-120)
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['empty_enemy_bar'] = _empty_enemy_bar
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['enemy_bar'] = _enemy_bar
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['beam1'] = _beam1
      # prevent "Script is hanging" error
      Graphics.update
      # add image
      @data['grid'] = _grid
      # prevent "Script is hanging" error
      Graphics.update
    end
    #--------------------------------------------------------------------------
    # clean
    #  Cleans the cache from remotes and damage sprites.
    #--------------------------------------------------------------------------
    def clean
      # dispose all damage sprites
      @damages.each {|sprite| sprite.dispose if sprite.is_a?(Sprite)}
      # dispose all beam sprites
      @beams.each {|ary| ary[0].dispose}
      # create new damage sprite buffer and new projectile buffer
      @damages, @remotes, @beams = [], [], []
      # unfreeze all actor's actions
      $BlizzABS.battlers.each {|actor| actor.freeze_action = false}
      # clear observation and path request data
      $BlizzABS.AI = BlizzABS::AI.new
    end
    #--------------------------------------------------------------------------
    # image
    #  key - hash key for the image
    #  Returns a copy of the image.
    #--------------------------------------------------------------------------
    def image(key)
      return @data[key].clone
    end
    #--------------------------------------------------------------------------
    # _white_arrow
    #  Creates the minimap icon for other events.
    #--------------------------------------------------------------------------
    def _white_arrow
      b = Bitmap.new(56, 14)
      c1 = Color.new(0, 0, 0)
      c2 = Color.new(255, 255, 255)
      b.set_pixel(23, 0, c1)
      b.set_pixel(32, 0, c1)
      b.set_pixel(22, 1, c1)
      b.fill_rect(23, 1, 1, 12, c2)
      b.fill_rect(24, 1, 1, 12, c1)
      b.fill_rect(31, 1, 1, 12, c1)
      b.fill_rect(32, 1, 1, 12, c2)
      b.set_pixel(33, 1, c1)
      b.set_pixel(21, 2, c1)
      b.fill_rect(22, 2, 1, 10, c2)
      b.fill_rect(33, 2, 1, 10, c2)
      b.set_pixel(34, 2, c1)
      b.fill_rect(1, 3, 12, 1, c1)
      b.set_pixel(20, 3, c1)
      b.fill_rect(21, 3, 1, 8, c2)
      b.fill_rect(34, 3, 1, 8, c2)
      b.set_pixel(35, 3, c1)
      b.fill_rect(48, 3, 2, 1, c1)
      b.set_pixel(0, 4, c1)
      b.fill_rect(1, 4, 12, 1, c2)
      b.set_pixel(13, 4, c1)
      b.set_pixel(19, 4, c1)
      b.fill_rect(20, 4, 1, 6, c2)
      b.fill_rect(35, 4, 1, 6, c2)
      b.set_pixel(36, 4, c1)
      b.set_pixel(47, 4, c1)
      b.fill_rect(48, 4, 2, 6, c2)
      b.set_pixel(50, 4, c1)
      b.set_pixel(1, 5, c1)
      b.fill_rect(2, 5, 10, 1, c2)
      b.set_pixel(12, 5, c1)
      b.set_pixel(18, 5, c1)
      b.fill_rect(19, 5, 1, 4, c2)
      b.fill_rect(36, 5, 1, 4, c2)
      b.set_pixel(37, 5, c1)
      b.set_pixel(46, 5, c1)
      b.fill_rect(47, 5, 1, 5, c2)
      b.fill_rect(50, 5, 1, 5, c2)
      b.set_pixel(51, 5, c1)
      b.set_pixel(2, 6, c1)
      b.fill_rect(3, 6, 8, 1, c2)
      b.set_pixel(11, 6, c1)
      b.fill_rect(17, 6, 1, 2, c1)
      b.fill_rect(18, 6, 1, 2, c2)
      b.fill_rect(37, 6, 1, 2, c2)
      b.fill_rect(38, 6, 1, 2, c1)
      b.set_pixel(45, 6, c1)
      b.fill_rect(46, 6, 1, 4, c2)
      b.fill_rect(51, 6, 1, 4, c2)
      b.set_pixel(52, 6, c1)
      b.set_pixel(3, 7, c1)
      b.fill_rect(4, 7, 6, 1, c2)
      b.set_pixel(10, 7, c1)
      b.set_pixel(44, 7, c1)
      b.fill_rect(45, 7, 1, 3, c2)
      b.fill_rect(52, 7, 1, 3, c2)
      b.set_pixel(53, 7, c1)
      b.set_pixel(4, 8, c1)
      b.fill_rect(5, 8, 4, 1, c2)
      b.set_pixel(9, 8, c1)
      b.set_pixel(18, 8, c1)
      b.set_pixel(37, 8, c1)
      b.set_pixel(43, 8, c1)
      b.fill_rect(44, 8, 1, 2, c2)
      b.fill_rect(53, 8, 1, 2, c2)
      b.set_pixel(54, 8, c1)
      b.set_pixel(5, 9, c1)
      b.fill_rect(6, 9, 2, 1, c2)
      b.set_pixel(8, 9, c1)
      b.set_pixel(19, 9, c1)
      b.set_pixel(36, 9, c1)
      b.set_pixel(42, 9, c1)
      b.set_pixel(43, 9, c2)
      b.set_pixel(54, 9, c2)
      b.set_pixel(55, 9, c1)
      b.fill_rect(6, 10, 2, 1, c1)
      b.set_pixel(20, 10, c1)
      b.set_pixel(35, 10, c1)
      b.fill_rect(43, 10, 12, 1, c1)
      b.set_pixel(21, 11, c1)
      b.set_pixel(34, 11, c1)
      b.set_pixel(22, 12, c1)
      b.set_pixel(33, 12, c1)
      b.set_pixel(23, 13, c1)
      b.set_pixel(32, 13, c1)
      return b
    end
    #--------------------------------------------------------------------------
    # _green_arrow
    #  Creates the minimap icon for events.
    #--------------------------------------------------------------------------
    def _green_arrow
      b = Bitmap.new(56, 14)
      c1 = Color.new(0, 0, 0)
      c2 = Color.new(255, 255, 255)
      c3 = Color.new(0, 255, 0)
      b.set_pixel(23, 0, c1)
      b.set_pixel(32, 0, c1)
      b.set_pixel(22, 1, c1)
      b.fill_rect(23, 1, 1, 12, c3)
      b.fill_rect(24, 1, 1, 12, c1)
      b.fill_rect(31, 1, 1, 12, c1)
      b.fill_rect(32, 1, 1, 12, c3)
      b.set_pixel(33, 1, c1)
      b.set_pixel(21, 2, c1)
      b.fill_rect(22, 2, 1, 10, c3)
      b.fill_rect(33, 2, 1, 10, c3)
      b.set_pixel(34, 2, c1)
      b.fill_rect(1, 3, 12, 1, c1)
      b.set_pixel(20, 3, c1)
      b.fill_rect(21, 3, 1, 8, c3)
      b.fill_rect(34, 3, 1, 8, c3)
      b.set_pixel(35, 3, c1)
      b.fill_rect(48, 3, 2, 1, c1)
      b.set_pixel(0, 4, c1)
      b.fill_rect(1, 4, 12, 1, c3)
      b.set_pixel(13, 4, c1)
      b.set_pixel(19, 4, c1)
      b.fill_rect(20, 4, 1, 6, c3)
      b.fill_rect(35, 4, 1, 6, c3)
      b.set_pixel(36, 4, c1)
      b.set_pixel(47, 4, c1)
      b.fill_rect(48, 4, 2, 6, c3)
      b.set_pixel(50, 4, c1)
      b.set_pixel(1, 5, c1)
      b.fill_rect(2, 5, 10, 1, c3)
      b.set_pixel(12, 5, c1)
      b.set_pixel(18, 5, c1)
      b.fill_rect(19, 5, 1, 4, c3)
      b.fill_rect(36, 5, 1, 4, c3)
      b.set_pixel(37, 5, c1)
      b.set_pixel(46, 5, c1)
      b.fill_rect(47, 5, 1, 5, c3)
      b.fill_rect(50, 5, 1, 5, c3)
      b.set_pixel(51, 5, c1)
      b.set_pixel(2, 6, c1)
      b.fill_rect(3, 6, 8, 1, c3)
      b.set_pixel(11, 6, c1)
      b.fill_rect(17, 6, 1, 2, c1)
      b.fill_rect(18, 6, 1, 2, c3)
      b.fill_rect(37, 6, 1, 2, c3)
      b.fill_rect(38, 6, 1, 2, c1)
      b.set_pixel(45, 6, c1)
      b.fill_rect(46, 6, 1, 4, c3)
      b.fill_rect(51, 6, 1, 4, c3)
      b.set_pixel(52, 6, c1)
      b.set_pixel(3, 7, c1)
      b.fill_rect(4, 7, 6, 1, c3)
      b.set_pixel(10, 7, c1)
      b.set_pixel(44, 7, c1)
      b.fill_rect(45, 7, 1, 3, c3)
      b.fill_rect(52, 7, 1, 3, c3)
      b.set_pixel(53, 7, c1)
      b.set_pixel(4, 8, c1)
      b.fill_rect(5, 8, 4, 1, c3)
      b.set_pixel(9, 8, c1)
      b.set_pixel(18, 8, c1)
      b.set_pixel(37, 8, c1)
      b.set_pixel(43, 8, c1)
      b.fill_rect(44, 8, 1, 2, c3)
      b.fill_rect(53, 8, 1, 2, c3)
      b.set_pixel(54, 8, c1)
      b.set_pixel(5, 9, c1)
      b.fill_rect(6, 9, 2, 1, c3)
      b.set_pixel(8, 9, c1)
      b.set_pixel(19, 9, c1)
      b.set_pixel(36, 9, c1)
      b.set_pixel(42, 9, c1)
      b.set_pixel(43, 9, c3)
      b.set_pixel(54, 9, c3)
      b.set_pixel(55, 9, c1)
      b.fill_rect(6, 10, 2, 1, c1)
      b.set_pixel(20, 10, c1)
      b.set_pixel(35, 10, c1)
      b.fill_rect(43, 10, 12, 1, c1)
      b.set_pixel(21, 11, c1)
      b.set_pixel(34, 11, c1)
      b.set_pixel(22, 12, c1)
      b.set_pixel(33, 12, c1)
      b.set_pixel(23, 13, c1)
      b.set_pixel(32, 13, c1)
      return b
    end
    #--------------------------------------------------------------------------
    # _menu_arrow
    #  Creates the arrow displayed in the hotkey assignment menu.
    #--------------------------------------------------------------------------
    def _menu_arrow
      b = Bitmap.new(16, 9)
      c1 = Color.new(0, 0, 0)
      c2 = Color.new(255, 255, 255)
      c3 = Color.new(127, 127, 127)
      b.fill_rect(7, 0, 2, 1, c2)
      b.set_pixel(6, 1, c2)
      b.fill_rect(7, 1, 1, 7, c3)
      b.fill_rect(8, 1, 1, 7, c1)
      b.set_pixel(9, 1, c2)
      b.set_pixel(5, 2, c2)
      b.fill_rect(6, 2, 1, 6, c3)
      b.fill_rect(9, 2, 1, 6, c1)
      b.set_pixel(10, 2, c2)
      b.set_pixel(4, 3, c2)
      b.fill_rect(5, 3, 1, 5, c3)
      b.fill_rect(10, 3, 1, 5, c1)
      b.set_pixel(11, 3, c2)
      b.set_pixel(3, 4, c2)
      b.fill_rect(4, 4, 1, 4, c3)
      b.fill_rect(11, 4, 1, 4, c1)
      b.set_pixel(12, 4, c2)
      b.set_pixel(2, 5, c2)
      b.fill_rect(3, 5, 1, 3, c3)
      b.fill_rect(12, 5, 1, 3, c1)
      b.set_pixel(13, 5, c2)
      b.set_pixel(1, 6, c2)
      b.fill_rect(2, 6, 1, 2, c3)
      b.fill_rect(13, 6, 1, 2, c1)
      b.set_pixel(14, 6, c2)
      b.set_pixel(0, 7, c2)
      b.set_pixel(1, 7, c3)
      b.set_pixel(14, 7, c1)
      b.set_pixel(15, 7, c2)
      b.fill_rect(1, 8, 14, 1, c2)
      return b
    end
    #--------------------------------------------------------------------------
    # _minimap_autotile
    #  Creates the minimap autotile for passability.
    #--------------------------------------------------------------------------
    def _minimap_autotile
      b = Bitmap.new(24, 32)
      c1 = Color.new(191, 191, 191)
      c2 = Color.new(255, 255, 255)
      b.fill_rect(2, 0, 4, 1, c2)
      b.set_pixel(1, 1, c2)
      b.fill_rect(2, 1, 4, 6, c1)
      b.set_pixel(6, 1, c2)
      b.fill_rect(0, 2, 1, 4, c2)
      b.fill_rect(1, 2, 1, 4, c1)
      b.fill_rect(6, 2, 1, 4, c1)
      b.fill_rect(7, 2, 1, 4, c2)
      b.set_pixel(1, 6, c2)
      b.set_pixel(6, 6, c2)
      b.fill_rect(2, 7, 4, 1, c2)
      b.fill_rect(7, 8, 10, 1, c2)
      b.set_pixel(6, 9, c2)
      b.fill_rect(7, 9, 10, 22, c1)
      b.set_pixel(17, 9, c2)
      b.set_pixel(5, 10, c2)
      b.fill_rect(6, 10, 1, 20, c1)
      b.fill_rect(17, 10, 1, 20, c1)
      b.set_pixel(18, 10, c2)
      b.set_pixel(4, 11, c2)
      b.fill_rect(5, 11, 1, 18, c1)
      b.fill_rect(18, 11, 1, 18, c1)
      b.set_pixel(19, 11, c2)
      b.set_pixel(3, 12, c2)
      b.fill_rect(4, 12, 1, 16, c1)
      b.fill_rect(19, 12, 1, 16, c1)
      b.set_pixel(20, 12, c2)
      b.set_pixel(2, 13, c2)
      b.fill_rect(3, 13, 1, 14, c1)
      b.fill_rect(20, 13, 1, 14, c1)
      b.set_pixel(21, 13, c2)
      b.set_pixel(1, 14, c2)
      b.fill_rect(2, 14, 1, 12, c1)
      b.fill_rect(21, 14, 1, 12, c1)
      b.set_pixel(22, 14, c2)
      b.fill_rect(0, 15, 1, 10, c2)
      b.fill_rect(1, 15, 1, 10, c1)
      b.fill_rect(22, 15, 1, 10, c1)
      b.fill_rect(23, 15, 1, 10, c2)
      b.set_pixel(1, 25, c2)
      b.set_pixel(22, 25, c2)
      b.set_pixel(2, 26, c2)
      b.set_pixel(21, 26, c2)
      b.set_pixel(3, 27, c2)
      b.set_pixel(20, 27, c2)
      b.set_pixel(4, 28, c2)
      b.set_pixel(19, 28, c2)
      b.set_pixel(5, 29, c2)
      b.set_pixel(18, 29, c2)
      b.set_pixel(6, 30, c2)
      b.set_pixel(17, 30, c2)
      b.fill_rect(7, 31, 10, 1, c2)
      return b
    end
    #--------------------------------------------------------------------------
    # _empty_hud_white_bar
    #  Creates the bitmap used for the empty HUD bars.
    #--------------------------------------------------------------------------
    def _empty_hud_white_bar
      b = Bitmap.new(1, 12)
      (1..6).each {|i| b.fill_rect(0, i-1, 1, 14-i*2, Color.new(40*i/3, 40*i/3, 40*i/3))}
      return b
    end
    #--------------------------------------------------------------------------
    # _empty_hud_green_bar
    #  Creates the bitmap used for the empty HUD bars.
    #--------------------------------------------------------------------------
    def _empty_hud_green_bar
      b = Bitmap.new(1, 12)
      (1..6).each {|i| b.fill_rect(0, i-1, 1, 14-i*2, Color.new(0, 40*i/3, 0))}
      return b
    end
    #--------------------------------------------------------------------------
    # _hud_white_bar
    #  Creates the bitmap used for the HUD bars.
    #--------------------------------------------------------------------------
    def _hud_white_bar
      b = Bitmap.new(1, 12)
      (1..6).each {|i| b.fill_rect(0, i-1, 1, 14-i*2, Color.new(40*i, 40*i, 40*i))}
      return b
    end
    #--------------------------------------------------------------------------
    # _hud_green_bar
    #  Creates the bitmap used for the HUD bars.
    #--------------------------------------------------------------------------
    def _hud_green_bar
      b = Bitmap.new(1, 12)
      (1..6).each {|i| b.fill_rect(0, i-1, 1, 14-i*2, Color.new(0, 40*i, 0))}
      return b
    end
    #--------------------------------------------------------------------------
    # _empty_enemy_bar
    #  Creates the bitmap used for the empty enemy bars.
    #--------------------------------------------------------------------------
    def _empty_enemy_bar
      b = Bitmap.new(1, 6)
      (1..3).each {|i| b.fill_rect(0, i-1, 1, 8-i*2, Color.new(0, 80*i/3, 0))}
      return b
    end
    #--------------------------------------------------------------------------
    # _enemy_bar
    #  Creates the bitmap used for the enemy bars.
    #--------------------------------------------------------------------------
    def _enemy_bar
      b = Bitmap.new(1, 6)
      (1..3).each {|i| b.fill_rect(0, i-1, 1, 8-i*2, Color.new(0, 80*i, 0))}
      return b
    end
    #--------------------------------------------------------------------------
    # _beam1
    #  Creates the bitmap used for the beam animation.
    #--------------------------------------------------------------------------
    def _beam1
      b = Bitmap.new(24, 1)
      (1...12).each {|i|
          b.fill_rect(i, 0, 1, 1, Color.new(255, 255, 255, i**2*3))
          b.fill_rect(23-i, 0, 1, 1, Color.new(255, 255, 255, i**2*3))}
      return b
    end
    #--------------------------------------------------------------------------
    # _grid
    #  Creates the bitmap used for the AI behavior grid.
    #--------------------------------------------------------------------------
    def _grid
      b = Bitmap.new(360, 360)
      c1, c2 = Color.new(255, 255, 255), Color.new(0, 0, 0)
      b.fill_rect(0, 0, 48, 48, c1)
      b.fill_rect(24, 0, 24, 24, c2)
      b.fill_rect(0, 24, 24, 24, c2)
      c1.alpha = c2.alpha = 128
      b.fill_rect(1, 25, 22, 22, c1)
      b.fill_rect(25, 1, 22, 22, c1)
      b.fill_rect(1, 1, 22, 22, c2)
      b.fill_rect(25, 25, 22, 22, c2)
      b.blt(48, 0, b, Rect.new(0, 0, 48, 48))
      b.blt(0, 48, b, Rect.new(0, 0, 96, 48))
      b.blt(96, 0, b, Rect.new(0, 0, 96, 96))
      b.blt(0, 96, b, Rect.new(0, 0, 192, 96))
      b.blt(192, 0, b, Rect.new(0, 0, 192, 192))
      b.blt(0, 192, b, Rect.new(0, 0, 384, 192))
      return b
    end
  end
  
end

module BlizzABS
  
  #============================================================================
  # BlizzABS::Combo
  #----------------------------------------------------------------------------
  #  This class represents a Blizz-ABS combo and provides methods for handling.
  #============================================================================
  
  class Combo
    
    attr_accessor :id # combo ID
    attr_accessor :aid # current action ID
    attr_accessor :ch # character using the combo
    
    attr_accessor :time # current time of the current action
    
    attr_accessor :player # is the player performing this combo
    attr_accessor :actor # is an actor performing this combo
    attr_accessor :enemy # is an enemy performing this combo
    
    attr_accessor :commands # stores commands for this combo
    attr_accessor :moves # stores move commands for this combo
    attr_accessor :inputs # stores input windows for this combo
    attr_accessor :variables # stores variables for this combo
    
    attr_accessor :total_actions # total number of actions
    attr_accessor :animation # animation id of the current action
    attr_accessor :sprite # sprite extension for overlay of the current action
    attr_accessor :extension # is the sprite name an extension of the character
    attr_accessor :animation_frames # sprite animation frames
    
    attr_accessor :freeze_character # flag to freeze external input on character 
    attr_accessor :ended # has the combo ended
    
    #--------------------------------------------------------------------------
    # Initialization
    #--------------------------------------------------------------------------
    def initialize(id, ch)
      # id of the combo
      @id = id
      # id of the current action
      @aid = 0
      # character performing combo
      @ch = nil
      # initialize variables
      @variables = []
      # 10 variables
      10.times {@variables.push(0)}
      # initialize inputs
      @inputs = []
      # 10 inputs
      10.times {@inputs.push([[0], 0, 0, true])}
      # set total number of actions
      @total_actions = Combos.total_actions(self)
      # set flag if combo performed by player
      @player = true#@ch.is_a?(Game_Player)
      # set flag if combo performed by actor
      @actor = @ch.is_a?(Game_Actor)
      # set flag if combo performed by enemy
      @enemy = @ch.is_a?(Game_Enemy)
      # begin combo
      begin_combo(ch)
    end
    #--------------------------------------------------------------------------
    # update
    #  Updates the combo while it is active
    #--------------------------------------------------------------------------
    def update
      # increase frame counter
      @time += 1
      # update movement
      update_move
      # update input
      update_input
      # update commands
      update_command
      # update character
      update_character
      # end combo if reached end of commands
      @ended = true if @commands.size == 0
    end
    #--------------------------------------------------------------------------
    # update_move
    #  Updates the active movement route
    #--------------------------------------------------------------------------
    def update_move
      if !@ch.moving? && @moves.size > 0
        @moves.shift if proccess_move(@moves[0])
      end
    end
    #--------------------------------------------------------------------------
    # update_command
    #  Updates the active command list
    #--------------------------------------------------------------------------
    def update_command
      while @commands.size > 0 && proccess_command(@commands[0])
        @commands.shift
      end
    end
    #--------------------------------------------------------------------------
    # update_input
    #  Updates the active input windows
    #--------------------------------------------------------------------------
    def update_input
      @inputs.each {|i|
        # else if not succeeded
        if !i[3]
          # decrease counter
          i[2] -= 1 if i[2] > 0
          # initialize success
          i[3] = true
          i[0].each {|k|
            # check for success based on trigger type
            case i[1]
            when INPress then i[3] = i[3] && Input.press?(k)
            when INTrigger then i[3] = i[3] && Input.trigger?(k)
            when INRelease then i[3] = i[3] && Input.release?(k)
            end}
        end}
    end
    #--------------------------------------------------------------------------
    # update_character
    #  Updates the character
    #--------------------------------------------------------------------------
    def update_character
      # freeze character input if flag is set
      @ch.set_action(1) if @freeze_character
    end
    #--------------------------------------------------------------------------
    # begin_combo
    #  Begins the combo
    #--------------------------------------------------------------------------
    def begin_combo(ch)
      # set character
      @ch = ch
      # setup first action
      setup_action(1)
    end
    #--------------------------------------------------------------------------
    # setup_action
    #  Loads data and prepares the character to perform the current action in
    #  the combo
    #--------------------------------------------------------------------------
    def setup_action(id)
      # set action id
      @aid = id
      # set time to zero
      @time = 0
      # get commands
      @commands = Combos.commands(self)
      # reset movement commands and input windows
      @moves = []
      # set animation data
      @animation, @animation_frames, @sprite, @extension = Combos.anim_data(self)
      # request combo sprite from player if needed
      @ch.new_combo_sprite = true if @animation != 0 || @sprite != ''
    end
    #--------------------------------------------------------------------------
    # proccess_command
    #  Processess a command
    #  Returns true if command processed, false if not
    #--------------------------------------------------------------------------
    def proccess_command(command)
      # branch based on command type
      case command[0]
      when COMScript # script [code]
        # evaluate script
        result = eval(command[1])
      when COMWait # wait [int]
        # decrease wait counter by 1
        command[1] -= 1
        # proceed if wait time is up
        return command[1] <= 0
      when COMMove # move [int, int]
        # add to move commands
        @moves.push(command)
      when COMTurn # turn [int]
        # add to move commands
        @moves.push(command)
      when COMJump # jump [int, int]
        # add to move commands
        @moves.push(command)
      when COMAttack # attack
        # use attack
        @ch.use_attack
      when COMSkill # skill [int]
        # use skill
        @ch.use_skill($data_skills[command[1]])
      when COMItem # item [int]
        # use item
        @ch.use_item($data_items[command[1]])
      when COMDefend # defend [int]
        # decrease time
        time = command[1] - 1
        # use defend
        @ch.use_defend
        # set penalty
        @ch.set_action(1)
        # if not done with command
        if time > 0
          # update the command counter
          command[1] = time
          # do not proceed
          return false
        end
      when COMCharacter # character [CH, value]
        # handle based on sub-command
        case command[1]
        when CHSpeed # move speed
          # set movement speed
          @ch.move_speed = command[2]
        when CHFrequency # move frequency
          # set movement frequency
          @ch.move_frequency = command[2]
        when CHSprite # change sprite
          # set sprite
          @ch.character_name = command[2]
        when CHAnimation # play animation
          # set animation
          @ch.animation_id = command[2]
        when CHFix # direction fix
          # set direction fix flag
          @ch.direction_fix = command[2]
        when CHThrough # through
          # set through flag
          @ch.through = command[2]
        when CHOnTop # always on top
          # set always on top flag
          @ch.always_on_top = command[2]
        when CHOpacity # opacity
          # set opacity
          @ch.opacity = command[2]  
        end
      when COMInput # create input window [int, [keys], IN, int]
        # create new input window
        @inputs[command[1]] = [command[2], command[3], command[4], false]
      when COMVariable # variable [VAR, value1, '=', VAR, value2]
        val1 = get_variable(command[1], command[2])
        val2 = get_variable(command[4], command[5])
        # branch handling based on operator type
        case command[3]
        when '+=' then val2 = val1 + val2 # add
        when '-=' then val2 = val1 - val2 # subtract
        when '*=' then val2 = val1 * val2 # multiply
        when '/=' then val2 = val1 / val2 # divide
        when '%=' then val2 = val1 % val2 # modulo
        end
        # set the variable
        set_variable(command[1], command[2], val2)
      when COMCondition # condition [VAR, value1, '==', VAR, value2]
        # initialize result
        result = false
        # initialize values
        val1 = get_variable(command[1], command[2])
        val2 = get_variable(command[4], command[5])
        # branch handling based on operator type
        case command[3]
        when '==' # equal to
          # result is value 1 equal to value 2
          result = val1 == val2
        when '!=' # not equal to
          # result is value 1 not equal to value 2
          result = val1 != val2
        when '>' # greater than
          # result is value 1 equal to value 2
          result = val1 > val2
        when '>=' # greater than or equal to
          # result is value 1 not equal to value 2
          result = val1 >= val2
        when '<=' # less than
          # result is value 1 equal to value 2
          result = val1 < val2
        when '<=' # less than or equal to
          # result is value 1 not equal to value 2
          result = val1 <= val2
        end  
        # if input or script
        if command[1] == VARInput || command[1] == VARScript
          # value 1 contains the result
          result = val1
          # do not proceed if waiting on an input window
          if command[1] == VARInput && @inputs[command[2]][2] > 0 && !result
            return false
          end
        end
        # skip next command if exists and condition not met
        @commands.delete_at(1) if !result && @commands.size > 1
      when COMFreeze # freeze input [bool]
        # set freeze input flag
        @freeze_character = command[1]
      when COMCompletion # wait for move completion
        # proceed if no more moves and character no longer moving
        return @moves.size == 0 && !@ch.moving?
      when COMGoTo # go to action [int]
        raise 'ERROR: Invalid action' if !is_valid_action?(command[1])
        # setup the action
        setup_action(command[1])
        # do not proceed - new set of commands
        return false
      when COMAbort # abort
        # set ended flag
        @ended = true
      end
      return true
    end
    #--------------------------------------------------------------------------
    # proccess_move
    #  Processess a move command
    #  Returns true if command fully processed, false if not
    #--------------------------------------------------------------------------
    def proccess_move(command)
      # branch based on command type
      case command[0]
      # move
      when COMMove
        # get direction
        dir = get_direction(command[1])
        # get number of steps remaining
        steps = command[2] - 1
        # make character move depending on direction
        case dir
        when 1 then @ch.move_lower_left
        when 2 then @ch.move_down(dir)
        when 3 then @ch.move_lower_right
        when 4 then @ch.move_left(dir)
        when 6 then @ch.move_right(dir)
        when 7 then @ch.move_upper_left
        when 8 then @ch.move_up(dir)
        when 9 then @ch.move_upper_right
        end
        # proceed if no more steps
        return true if steps == 0
        # update steps counter
        command[2] = steps
        # do not proceed as there are more steps to be executed
        return false
      # turn
      when COMTurn
        # make character turn to face direction
        @ch.direction = get_direction(command[1])
      # jump
      when COMJump
        # get direction
        dir = get_direction(command[1])
        # get range
        range = command[2]
        # set jumping direction
        x, y = BlizzABS::Cache::DirOffsets[dir]
        # jump into direction with range
        @ch.jump(x*range, y*range, dir)
      end
      # proceed
      return true
    end
    #--------------------------------------------------------------------------
    # get_variable
    #  type - variable type
    #  value - value type
    #  Returns the variable from the given command data
    #--------------------------------------------------------------------------
    def get_variable(type, value)
      # initialize
      var = 0
      # branch handling based on variable type
      case type
      when VARGame # game variable
        # variable is the game variable
        var = $game_variables[value]
      when VARCombo # combo variable
        # variable is the combo variable
        var = @variables[value]
      when VARCharacter # character variable
        # branch handling based on value type
        case value
        when VALHp # battler hp
          # variable is the battler's hp
          var = @ch.battler.hp
        when VALSp # battler sp
          # variable is the battler's hp
          var = @ch.battler.sp
        when VALMaxHp # battler max hp
          # variable is the battler's max hp
          var = @ch.battler.maxhp
        when VALMaxSp # battler max sp
          # variable is the battler's max sp
          var = @ch.battler.maxsp
        when VALState # battler states
          # variable is the amount of states on battler
          var = @ch.battler.states.size
        when VALExp # battler exp
          # variable is the battler's exp
          var = @ch.battler.exp
        when VALLevel # battler level
          # variable is the battler's level
          var = @ch.battler.level
        when VALTile # tile id
          # variable is the character's current tile
          var = @ch.tile_id
        when VALDirection # battler direction
          # variable is the character's current direction
          var = @ch.direction
        end
      when VARInput # input
        # variable is input success
        var = @inputs[value][3]
      when VARConstant # constant
        # variable is just the value given
        var = value
      when VARScript # script
        # variable is just the script given
        var = eval(value)
      end
      return var
    end
    #--------------------------------------------------------------------------
    # set_variable
    #  type - variable type
    #  value - value type
    #  setvalue - value to set to
    #  sets the variable from the given command data
    #--------------------------------------------------------------------------
    def set_variable(type, value, setvalue)
      # branch handling based on variable type
      case type
      when VARGame # game variable
        # set game variable to value
        $game_variables[value] = setvalue
      when VARCombo # combo variable
        # set combo variable to value
        @variables[value] = setvalue
      when VARCharacter # character variable
        # branch handling based on value type
        case value
        when VALHp # battler hp
          # set battler's hp to value
          @ch.battler.hp = setvalue
        when VALSp # battler sp
          # set battler's hp to value
          @ch.battler.sp = setvalue
        when VALMaxHp # battler max hp
          # set battler's max hp to value
          @ch.battler.maxhp = setvalue
        when VALMaxSp # battler max sp
          # set battler's max sp to value
          @ch.battler.maxsp = setvalue
        when VALExp # battler exp 
          # set battler's exp to value
          @ch.battler.exp = setvalue
        when VALLevel # battler level
          # set battler's level to value
          @ch.battler.level = setvalue
        when VALDirection # battler direction to value
          # set character's current direction
          @ch.direction = setvalue
        end
      end
    end
    #--------------------------------------------------------------------------
    # get_direction
    #  data - command data
    #  Returns the 0-10 direction from the given command data
    #--------------------------------------------------------------------------
    def get_direction(data)
      # default direction
      dir = 0
      # handle special directions
      case data
      when DIR90Right
        # go back two indices in circle
        dir = Cache::LoopDir8[(Cache::LoopDir8.index(@ch.direction) + 6) % 8]
      # when 90 degrees left
      when DIR90Left
        # go forward two indices in circle
        dir = Cache::LoopDir8[(Cache::LoopDir8.index(@ch.direction) + 2) % 8]
      # when forward
      when DIRForward
        # character's direction
        dir = @ch.direction
      # when backward
      when DIRBackward
        # character's direction
        dir = 10 - @ch.direction
      # when toward player
      when DIRTowardPlayer
        # get distance to player
        dx = $game_player.x - @ch.x
        dy = $game_player.y - @ch.y
        # direction toward player
        dir = vector_to_direction(dx, dy)
      # when away from player
      when DIRAwayPlayer
        # get from to player
        dx = @ch.x - $game_player.x
        dy = @ch.y - $game_player.y
        # direction away from player
        dir = vector_to_direction(dx, dy)
      # Random 4 way direction
      when DIRRandom4
        # Random 4 way direction
        dir = Cache::Dir4[rand(4)]
      # Random 8 way direction
      when DIRRandom8
        # Random 8 way direction
        dir = Cache::Dir8[rand(8)]
      # when 45 degrees right
      when DIR45Right
        # go to previous index in circle
        dir = Cache::LoopDir8[(Cache::LoopDir8.index(@ch.direction) + 7) % 8]
      # when 45degrees left
      when DIR45Left
        # go to next index in circle
        dir = Cache::LoopDir8[(Cache::LoopDir8.index(@ch.direction) + 1) % 8]
      # no special direction
      else
        # set to 0-10 direction
        dir = data
      end
      return dir
    end
    #--------------------------------------------------------------------------
    # vector_to_direction
    #  x - x component of vector
    #  y - y component of vector
    #  Returns the 0-10 direction of a vector
    #--------------------------------------------------------------------------
    def vector_to_direction(x, y)
      return 8 if y > 0 && x == 0
      return 2 if y < 0 && x == 0
      return 6 if x > 0 && y == 0
      return 4 if x < 0 && y == 0
      return 7 if y > 0 && x < 0
      return 1 if y < 0 && x < 0
      return 9 if y > 0 && x > 0
      return 3 if y < 0 && x > 0
      return 0
    end
    #--------------------------------------------------------------------------
    # is_valid_action?
    #  aid - id of action
    #  Tests if aid is a valid action for this combo.
    #--------------------------------------------------------------------------
    def is_valid_action?(aid)
      return aid > 0 && aid <= @total_actions
    end
    
  end
  
end

module BlizzABS
  
  #============================================================================
  # BlizzABS::Processor
  #----------------------------------------------------------------------------
  #  This class provides methods for Blizz-ABS handling.
  #============================================================================
  
  class Processor
    
    # setting all accessible variables
    attr_accessor :actors
    attr_accessor :pets
    attr_accessor :monsters
    attr_accessor :AI
    attr_reader   :player
    attr_reader   :cache
    attr_reader   :util
    attr_reader   :controls
    #--------------------------------------------------------------------------
    # Initialization
    #--------------------------------------------------------------------------
    def initialize
      # load player controller
      @player = Controller.new
      # create Blizz-ABS Cache
      @cache = Cache.new
      # utilities
      @util = Utility.new
      # refresh passability data
      @util.check_map_data
      # create handler for player battle input
      @controls = Controls.new
      # AI instance
      @AI = AI.new
      # map actors, summoned pets and summoned monsters
      @actors, @pets, @monsters = [], [], []
      # counters for pets and monsters
      @summon_time = {}
    end

    #--------------------------------------------------------------------------
    # battlers
    #  Returns actors and all summons from the party.
    #--------------------------------------------------------------------------
    def battlers
      return (@actors + @pets + @monsters)
    end
    #--------------------------------------------------------------------------
    # summons
    #  Returns only summons from the party.
    #--------------------------------------------------------------------------
    def summons
      return (@pets + @monsters)
    end
    #--------------------------------------------------------------------------
    # update
    #  Updates Blizz-ABS processes.
    #-------------------------------------------------------------------------- 
    def update
      # update each projectile and trap
      $BlizzABS.cache.remotes.each {|remote| remote.update}
      # update player battle input
      @controls.update
      # update summons
      update_summons
      # stop if scene is not Scene_Map
      return if !$scene.is_a?(Scene_Map)
      # update killed events
      update_killed
      # remove expired events from the map
      event_removal
      # remove expired summons from the map
      summon_removal
      # check special status effects
      check_special_states
    end
    #--------------------------------------------------------------------------
    # update_summons
    #  Updates all summons.
    #--------------------------------------------------------------------------
    def update_summons
      # for each summoned battler
      @summon_time.each_key {|summon|
          # decrease counter
          @summon_time[summon] -= 1
          # if counter expired
          remove_summon(summon) if @summon_time[summon] <= 0}
    end
    #--------------------------------------------------------------------------
    # summon_pet
    #  pet  - the pet to summon
    #  time - the time to remain
    #  Executes the summoning of a pet.
    #--------------------------------------------------------------------------
    def summon_pet(pet, time)
      # add pet
      @pets.push(pet)
      # set timer
      @summon_time[pet] = time * 40
      # stop if scene not Scene_Map or spriteset doesn't exist
      return if !$scene.is_a?(Scene_Map) || $scene.spriteset == nil
      # create sprite
      sprite = Sprite_Character.new($scene.spriteset.viewport1, pet)
      # add to spriteset handler
      $scene.spriteset.character_sprites.push(sprite)
    end
    #--------------------------------------------------------------------------
    # summon_monster
    #  monster - the monster to summon
    #  time    - the time to remain
    #  Executes the summoning of a monster.
    #--------------------------------------------------------------------------
    def summon_monster(monster, time)
      # add monster
      @monsters.push(monster)
      # set timer
      @summon_time[monster] = time * 40
      # stop if scene not Scene_Map or spriteset doesn't exist
      return if !$scene.is_a?(Scene_Map) || $scene.spriteset == nil
      # create sprite
      sprite = Sprite_Character.new($scene.spriteset.viewport1, monster)
      # add to spriteset handler
      $scene.spriteset.character_sprites.push(sprite)
    end
    #--------------------------------------------------------------------------
    # remove_summon
    #  summon - the summoned pet or monster to remove
    #  Removes the summon from the game.
    #--------------------------------------------------------------------------
    def remove_summon(summon)
      # remove this counter
      @summon_time.delete(summon)
      # make it "die"
      summon.battler.hp = 0
      # delete from events in case an enemy summoned this summon
      $game_map.events.delete(summon)
    end
    #--------------------------------------------------------------------------
    # summoned?
    #  character - the character to check
    #  Checks if the character was summoned.
    #--------------------------------------------------------------------------
    def summoned?(character)
      return (@pets + @monsters).include?(character)
    end
    #--------------------------------------------------------------------------
    # summoned_actor?
    #  id - the actor ID
    #  Checks if the actor was summoned.
    #--------------------------------------------------------------------------
    def summoned_actor?(id)
      return (@pets + @monsters).any? {|character| character.battler.id == id}
    end
    #--------------------------------------------------------------------------
    # update_killed
    #  Updates data regarding killed battlers.
    #--------------------------------------------------------------------------
    def update_killed
      # deleted killed
      deleted_killed = []
      # iterate through all killed
      $game_system.killed.each_key {|key|
          # decrease respawn counter
          $game_system.killed[key] -= 1
          # if dead enemy has event code to be executed
          if key.execute
            # update interpreter
            key.update
          # if respawn counter reached 0
          elsif $game_system.killed[key] <= 0
            # remove from map
            $game_map.events.delete(key.id)
            # if respawning available
            if $game_system.respawn_time > 0 || key.respawn_point != nil
              # add new enemy on old enemy's place
              $game_map.events[key.id] = respawn_enemy(key)
            end
            # this enemy is not "killed" anymore
            deleted_killed.push(key)
          end}
      # remove deleted values
      deleted_killed.each {|key| $game_system.killed.delete(key)}
    end
    #--------------------------------------------------------------------------
    # event_removal
    #  Removes expired events from the map including battlers and dropped
    #  items.
    #--------------------------------------------------------------------------
    def event_removal
      # iterate through all events on the map
      $game_map.events.values.each {|event|
          # if event is Map_Enemy
          if event.is_a?(Map_Enemy)
            # if event is actually on the map
            if event.precondition
              # start removing the enemy if he's dead
              remove_enemy(event) if !event.valid? || event.battler.dead?
              # if enemy spriteset missing
              if event.character_name == '' && event.tile_id < 384
                # remove completely
                $game_map.events.delete(event.id)
              end
            end
          # if event is dropped item and either item taken or stay time expired
          elsif event.dropped? && event.terminate
            # remove completely
            $game_map.events.delete(event.id)
          end}
    end
    #--------------------------------------------------------------------------
    # summon_removal
    #  Removes expired summons from the map.
    #--------------------------------------------------------------------------
    def summon_removal
      # remove all expired pets
      @pets.clone.each {|p| @pets.delete(p) if p.terminate}
      # remove all expired monsters
      @monsters.clone.each {|m| @monsters.delete(m) if m.terminate}
    end
    #--------------------------------------------------------------------------
    # battlers_refresh
    #  Replaces correctly named events with Blizz-ABS battlers and other
    #  Blizz-ABS specific events.
    #--------------------------------------------------------------------------
    def battlers_refresh
      # killed battlers array
      $game_system.reset_abs_data
      # for all events
      $game_map.events.each_key {|i|
          # execute substitution based on names if the event exists
          check_event_name(i) if $game_map.events[i] != nil}
    end
    #--------------------------------------------------------------------------
    # check_event_name
    #  event_id - event ID
    #  Checks and replaces the event.
    #--------------------------------------------------------------------------
    def check_event_name(event_id)
      # temporary variable
      event = $game_map.map.events[event_id]
      # initialize
      enemy, time, attr, id, group, lock, drop = 0, 5, 0x00, nil, nil, nil, nil
      move = immortal = object = full_passable = false
      # if lock setting exists
      if event.name.clone.gsub!(/\\lock\[(\d+)\]/) {"#[$1]"}
        # get lock setting
        lock = $1.to_i if event.name.clone.gsub!(/\\lock\[(\d+)\]/) {"#[$1]"}
      end
      # set internal variable to ID (enemy)
      if event.name.clone.gsub!(/\\[Ee]\[(\d+)\]/) {"#[$1]"}
        # temporary variable for ID
        id = $1.to_i
        # set internal variable to ID (enemy)
        if event.name.clone.gsub!(/\\[Gg]\[(\d+)\]/) {"#[$1]"}
          # temporary variable for group
          group = $1.to_i
        else
          # default enemy group
          group = BlizzABS::Alignments::ENEMY_GROUP
        end
      # set internal variable to array of IDs (Respawn Point)
      elsif event.name.clone.gsub!(/\\respawn\[([\d, ]+)\]/) {"#[$1]"}
        # temporary variable for array of IDs
        id = eval("[#{$1}]")
        # if time setting exists
        if event.name.clone.gsub!(/\\time\[(\d+)\]/) {"#[$1]"}
          # get time setting
          time = $1.to_i
        end
      # dropped item
      elsif event.name.clone.gsub!(/\\drop\[(\d+)\]/) {"#[$1]"}
        # temporary variable for time
        drop = $1.to_i
      end
      # if id is valid and enemy exists in database
      if id.is_a?(Numeric) && $data_enemies[id] != nil
        # set move flag if moving disabled
        move = true if event.name.clone.gsub!('\\move') {''}
        # set immortal flag if immortal enemy
        immortal = true if event.name.clone.gsub!('\\immortal') {''}
        # set full passability if passable enemy
        full_passable = true if event.name.clone.gsub!('\\pass') {''}
        # get AI setup
        attr, delay, view, hear = setup_enemy_ai(id)
        # custom AI setup exists
        custom = (event.name.clone.gsub!(/\\ai\[(\d+)\]/) {"#[$1]"} != nil)
        # add AI attribute setup if custom
        attr = eval("0b#{$1}") if custom
        # replace the real event with the new enemy
        $game_map.events[event_id] = Map_Enemy.new($game_map.map_id, event,
            id, group, attr, move, immortal, full_passable, custom, delay,
            view, hear)
        # increase original enemy count
        $game_system.add_battler_number(group, 1)
        # if hide command exists
        if event.name.clone.gsub!('\\hide') {''}
          # set flag to hide energy bar
          $game_map.events[event_id].hide_health = true
        end
      # if Respawn Point
      elsif id.is_a?(Array)
        # make this event a Respawn Point
        $game_map.events[event_id].respawn_ids = id
        # set respawn time 
        $game_map.events[event_id].respawn_time = time
        # for convenience and easier reference
        $game_map.respawns.push($game_map.events[event_id])
      # if dropped item
      elsif drop != nil
        # modify event to semi-drop event
        $game_map.events[event_id].activate_drop_mode(drop * 40)
      else
        # if special event renamed back to normal event
        if !$game_map.events[event_id].is_a?(Game_Event)
          # create normal event again
          $game_map.events[event_id] = Game_Event.new($game_map.map_id, event)
        end
        # if lock setting doesn't exist
        if lock == nil
          # set execution lock time to default
          $game_map.events[event_id].lock_time = BlizzABS::Config::EVENT_LOCK
        else
          # set execution lock time
          $game_map.events[event_id].lock_time = lock
        end
      end
    end
    #--------------------------------------------------------------------------
    # setup_enemy_ai
    #  id - enemy ID
    #  Returns the AI setup.
    #--------------------------------------------------------------------------
    def setup_enemy_ai(id)
      # get attributes
      attr = BlizzABS::Enemies.ai(id)
      # if unique AI setup exists
      if attr != nil
        # add AI attribute setup
        attr = eval("0b#{attr}")
      else
        # default AI attribute setup
        attr = eval("0b#{BlizzABS::Config::AI_DEFAULT_ATTRIBUTES}")
      end
      # get unique AI Delay Time
      delay = BlizzABS::Enemies.delay(id)
      # get default if not existent
      delay = BlizzABS::Config::AI_DELAY_TIME if delay == nil
      # get unique Perception
      view = BlizzABS::Enemies.perception(id)
      # if unique perception exists
      if view != nil
        # split up
        view, hear = view
      else
        # get defaults
        view = BlizzABS::Config::VIEW_RANGE
        hear = BlizzABS::Config::HEARING_RANGE_RATIO
      end
      # result
      return [attr, delay, view, hear]
    end
    #--------------------------------------------------------------------------
    # remove_enemy
    #  enemy - the killed enemy event
    #  Processes the after-death period of enemies.
    #--------------------------------------------------------------------------
    def remove_enemy(enemy)
      # stop except if enemy event code is to be executed or enemy is erased
      return if enemy.execute || enemy.erased
      # start event code if there is some
      enemy.start if enemy.trigger == BlizzABS::CETDeath
      # remove except if code needs to be executed
      $game_map.events.delete(enemy.id) unless enemy.execute
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
    end
    #--------------------------------------------------------------------------
    # drop_items
    #  enemy - the killed enemy event
    #  Returns array of items that will be dropped.
    #--------------------------------------------------------------------------
    def drop_items(enemy)
      # initialize array
      items = []
      # if using Multi-Drop from Tons of Add-ons
      if $tons_version != nil && $tons_version >= 5.98 &&
          TONS_OF_ADDONS::MULTI_DROP
        # gets all dropped items
        items += BlizzCFG.dropped_items(enemy.battler)
      # if got item
      elsif rand(100) < enemy.battler.treasure_prob
        # if enemy drops item
        if enemy.battler.item_id > 0
          # set ID 
          items.push($data_items[enemy.battler.item_id])
        # if enemy drops weapon
        elsif enemy.battler.weapon_id > 0
          # set ID
          items.push($data_weapons[enemy.battler.weapon_id])
        # if enemy drops armor
        elsif enemy.battler.armor_id > 0
          # set ID
          items.push($data_armors[enemy.battler.armor_id])
        end
      end
      # result
      return items
    end
    #--------------------------------------------------------------------------
    # exp_result
    #  enemy - the killed enemy event
    #  Processes EXP gain after the death of an enemy.
    #--------------------------------------------------------------------------
    def exp_result(enemy)
      # stop if enemy gives no EXP
      return 0 if enemy.exp == 0
      # get EXP
      exp = enemy.exp
      # if Tons is there
      if $tons_version != nil
        # if version is correct and using Different Difficulties
        if $tons_version >= 6.4 && TONS_OF_ADDONS::DIFFICULTY
          # multiply gained gold
          exp = exp * $game_system.exp_rate / 100
        end
        # if version is correct and using Passive Skills
        if $tons_version >= 6.5 && $game_system.PASSIVE_SKILLS
          # multiply gained gold with each actor's rate
          $game_party.actors.each {|actor| exp *= actor.exp_rate}
          exp = exp.to_i
        end
      end
      # iterate through all actors and pets
      ($BlizzABS.actors + $BlizzABS.pets).each {|b|
          # increase EXP if actor is valid and actor can get EXP
          b.battler.exp += exp if b.valid? && !b.battler.cant_get_exp?}
      # return exp value for further processing
      return exp
    end
    #--------------------------------------------------------------------------
    # gold_result
    #  enemy - the killed enemy event
    #  Processes gold gain after the death of an enemy.
    #--------------------------------------------------------------------------
    def gold_result(enemy)
      # stop if enemy drops no gold
      return 0 if enemy.gold == 0
      # get gold
      gold = enemy.gold
      # if Tons is there
      if $tons_version != nil
        # if version is correct and using Different Difficulties
        if $tons_version >= 6.4 && TONS_OF_ADDONS::DIFFICULTY
          # multiply gained gold
          gold = gold * $game_system.gold_rate / 100
        end
        # if version is correct and using Passive Skills
        if $tons_version >= 6.5 && $game_system.PASSIVE_SKILLS
          # multiply gained gold with each actor's rate
          $game_party.actors.each {|actor| gold *= actor.gold_rate}
          gold = gold.to_i
        end
      end
      # return gold value for further processing
      return gold
    end
    #--------------------------------------------------------------------------
    # additional_result
    #  enemy - the killed enemy event
    #  Processes additional gains after the death of an enemy.
    #--------------------------------------------------------------------------
    def additional_result(enemy)
      # if Tons of Add-ons there and EQUAP active
      if $tons_version != nil && $tons_version >= 7.32 &&
          TONS_OF_ADDONS::EQUAP_SKILLS
        # get AP result
        ap = BlizzCFG.gainap(enemy.id)
        # for each actor
        $BlizzABS.battlers.each {|battler|
            # if actor can gain AP
            if battler.valid? && (!battler.battler.dead? || GAIN_DEAD)
              # add AP
              battler.battler.add_ap(ap)
            end}
      end
    end
    #--------------------------------------------------------------------------
    # respawn_enemy
    #  enemy - the killed enemy event
    #  Processes the respawn of a dead enemy.
    #--------------------------------------------------------------------------
    def respawn_enemy(enemy)
      # create new enemy on old enemy's template
      new_enemy = Map_Enemy.new($game_map.map_id, enemy)
      # gets the respawn coordinates
      x, y = get_respawn_coordinates(enemy)
      # no respawn position found
      return nil if x == nil || y == nil
      # move enemy to position
      new_enemy.moveto(x, y)
      # if scene is Scene_Map and spriteset exists
      if $scene.is_a?(Scene_Map) && $scene.spriteset != nil
        # create sprite for respawned enemy
        sprite = Sprite_Character.new($scene.spriteset.viewport1, new_enemy)
        # set respawning flag
        sprite.respawning = true
        # add new sprite into spriteset
        $scene.spriteset.character_sprites.push(sprite)
      end
      # enemy is invisible at first
      new_enemy.opacity = 0
      # return new enemy
      return new_enemy
    end
    #--------------------------------------------------------------------------
    # get_respawn_coordinates
    #  enemy - the killed enemy event
    #  Gets the respawning coordinates for the new enemy.
    #--------------------------------------------------------------------------
    def get_respawn_coordinates(enemy)
      # if fixed Respawn Point exists
      if enemy.respawn_point != nil
        # coordinates of the Respawn Point
        return [enemy.respawn_point.x, enemy.respawn_point.y]
      end
      # get virtual map passability
      v_map, passables = $game_map.virtual_passability, []
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # find all passable tiles
      (0...v_map.xsize).each {|x| (0...v_map.ysize).each {|y|
          # if passable and enemy may respawn and no event on position
          if v_map[x, y] != 0x00 && !BlizzABS::Config::NO_ENEMY_TAGS.include?(
              $game_map.terrain_tag(x, y)) && $game_map.event_passable?(x, y)
            passables.push([x, y])
          end}}
      # random possibnle coordinates on the map
      return passables[rand(passables.size)]
    end
    #--------------------------------------------------------------------------
    # check_special_states
    #  Checks for several Tons of Add-ons effects.
    #--------------------------------------------------------------------------
    def check_special_states
      # if Tons of Add-ons is there
      if $tons_version != nil
        # if version is sufficient and using Auto-Revive
        if $tons_version >= 1.6 && $game_system.AUTO_REVIVE
          # for each actor
          $BlizzABS.battlers.each {|actor|
              # if battler exists and dead and having Auto-Revive
              if actor.battler != nil && actor.battler.hp == 0 &&
                  AUTO_REVIVE_IDS.any? {|i| actor.battler.states.include?(i)}
                # execute
                actor.battler.hp += actor.battler.maxhp / 5
                # remove Auto-Revive and Dead
                (AUTO_REVIVE_IDS + [DEAD_ID]).each {|i|
                    actor.battler.remove_state(i)}
                # set animation
                actor.animation_id = REVIVE_ANIMATION_ID
                # set revival text
                actor.battler.damage = REVIVE_TEXT
                # display text
                actor.battler.damage_pop = true
              end}
        end
        # if version is sufficient and using Fury Status
        if $tons_version >= 6.41 && $game_system.FURY_STATUS
          # execute Fury Status change
          BlizzCFG.fury_execution
        end
      end
    end
    #--------------------------------------------------------------------------
    # pixel
    #  Safe method to retreive the pixel movement rate.
    #-------------------------------------------------------------------------- 
    def pixel
      return ($game_system == nil ? 1 : 2 ** $game_system.pixel_rate)
    end
    #--------------------------------------------------------------------------
    # init_caterpillar
    #  Serves for initialization of the caterpillar.
    #--------------------------------------------------------------------------
    def init_caterpillar
      # add player controlled character
      @actors = [$game_player]
      # MAX-PARTY size - 1 times create actor
      (1...Config::MAX_PARTY).each {|i| @actors.push(Map_Actor.new(i))}
      # refresh all battlers
      $game_player.refresh
      # if not very beginning of the game
      if $game_map.map_id != nil && $game_map.map_id > 0
        # move all actors to the player's position
        $game_player.moveto($game_player.x / pixel, $game_player.y / pixel)
      end
    end
    #--------------------------------------------------------------------------
    # can_execute?
    #  ch     - the character in action
    #  target - target
    #  act    - action data
    #  Returns whether a target is in attack/skill/item range.
    #--------------------------------------------------------------------------
    def can_execute?(ch, target = false, act = false)
      # no if paralyzed or charging
      return false if ch.restriction == 4
      # argument correction
      act = ch.ai.act if act == false
      target = ch.ai.target if target == false
      # stop if defend action
      return true if act.defend?
      # stop if no target exists or target is invalid
      return false if target == nil || !target.valid?
      # if attack
      if act.attack?
        # target enemy and non-dead
        enemy, dead = true, false
      else
        # get scope
        scope = (act.skill? ? $data_skills : $data_items)[act.id].scope
        # execute allowed if targeting self
        return true if scope == 0 || scope == 7
        # determine target alignment, dead flag and all flag
        enemy, dead, all = $BlizzABS.util.get_scope_data(scope)
      end
      # temporary variables
      ai, d = ch.ai, act.range
      # determine whether actor or enemy for easier reference
      if ch.is_a?(Map_Actor)
        # decide target group
        group = (ch != $game_player && ((ch.restriction == 3) == enemy)) ?
            ai.positive : ai.negative
      else
        # determine target class group on confusion
        group = (((ch.restriction == 3) == enemy) ? ai.positive : ai.negative)
      end
      # if attack
      if act.attack?
        # get attack affection area
        area = $BlizzABS.util.get_attack_area(ch, d, act.type)
      else
        # get skill/item affection area
        area = $BlizzABS.util.get_skillitem_area(ch, d, act.type, scope)
      end
      # can target be hit considering all conditions
      return ((dead == target.battler.dead?) && @util.intersection(area,
          Rect.new(target.real_x / 4, target.real_y / 4, 32, 32)))
    end
    #--------------------------------------------------------------------------
    # attack_process
    #  ch - the character in action
    #  Processes ABS attack setup and handling for actors and enemies.
    #--------------------------------------------------------------------------
    def attack_process(ch)
      # temporary variable
      ai = ch.ai
      # determine whether actor or enemy for easier reference
      if ch.is_a?(Map_Actor)
        # decide target group
        group = ((ch != $game_player && ch.restriction == 3)) ?
            ai.positive : ai.negative
        # determine range
        d = Weapons.range(ch.battler.weapon_id)
        d = 1 if d < 1
        # determine type
        type = Weapons.type(ch.battler.weapon_id)
        # determine charge
        charge = Weapons.charge(ch.battler.weapon_id)
        # determine projectile speed
        projectile_speed = Weapons.projectile_speed(ch.battler.weapon_id)
      else
        # determine target group depending on confusion
        group = (ch.restriction == 3 ? ai.positive : ai.negative)
        # determine range
        d = Enemies.range(ch.battler_id)
        d = 1 if d < 1
        # determine type
        type = Enemies.type(ch.battler_id)
        # determine charge
        charge = Enemies.charge(ch.battler_id)
        # determine charge
        charge[0] = BlizzABS::CHARGEMove if charge[0] == BlizzABS::CHARGETrigger
        # determine projectile speed
        projectile_speed = Weapons.projectile_speed(ch.battler_id)
      end
      # if item shooting type
      if type == BOW_ARROW
        # temporary variable
        ids = Weapons.consume(ch.battler.weapon_id)
        # if no more items
        if !ids.include?(ch.battler.item) ||
            $game_party.item_number(ch.battler.item) == 0
          # can't use
          return false
        end
      end
      # if not charging already
      if charge[0] != CHARGENone && !ch.charging?
        # setup charging
        ch.setup_charge(ch, charge)
        # not used yet
        return false
      end
      # create affection area depending on attack type
      case type
      when SWORD, SPEAR, FLAIL # sword attack
        # get attack affection area
        area = $BlizzABS.util.get_attack_area(ch, d, type)
      when BOOMERANG # returning projectile attack
        # decide spriteset
        spriteset = ch.is_a?(Map_Actor) ?
            BlizzABS::SPRProjWeapon + ch.battler.weapon_id.to_s :
            BlizzABS::SPRProjEnemy + ch.battler_id.to_s
        # create returning projectile
        proj = Map_Projectile.new(spriteset, ch, 0, d, projectile_speed,
            REMReturning, group)
      when BOW # projectile attack
        # decide spriteset
        spriteset = ch.is_a?(Map_Actor) ?
            BlizzABS::SPRProjWeapon + ch.battler.weapon_id.to_s :
            BlizzABS::SPRProjEnemy + ch.battler_id.to_s
        # create returning projectile
        proj = Map_Projectile.new(spriteset, ch, 0, d, projectile_speed,
            REMNormal, group)
      when BOW_ARROW # item consuming projectile
        # remove one item from inventory
        $game_party.lose_item(ch.battler.item, 1)
        # temporary variable
        item = $data_items[ch.battler.item]
        # get item explosion data
        explode = Items.type(item.id)
        # if explosion exists
        if explode[1] != EXPLNone
          # fix the missing explosion animation error
          explode[2] = 0 if explode[2] == nil
          # create projectile from exploding item with weapon attack effect
          proj = Map_Projectile.new(BlizzABS::SPRProjItem + item.id.to_s, ch,
              item.id, d, projectile_speed, REMShotItem, group, false,
              explode[1, 3])
        else
          # create projectile from item with weapon attack effect
          proj = Map_Projectile.new(BlizzABS::SPRProjItem + item.id.to_s, ch,
              item.id, d, projectile_speed, REMShotItem, group)
        end
      when SHURIKEN # self consuming weapon
        # temporary variable
        weapon = $data_weapons[ch.battler.weapon_id]
        # unequip last weapon if no more weapons in inventory
        ch.battler.equip(0, 0) if $game_party.weapon_number(weapon.id) == 0
        # remove one weapon from inventory
        $game_party.lose_weapon(weapon.id, 1)
        # self shooting weapon, create projectile from weapon
        proj = Map_Projectile.new(BlizzABS::SPRProjWeapon + weapon.id.to_s, ch,
            weapon.id, d, projectile_speed, REMShotWeapon, group)
      end
      # if projectile fired
      if proj != nil
        # add projectile to buffer
        $BlizzABS.cache.remotes.push(proj)
        # used
        return true
      end
      # iterate through all battlers
      ($game_map.battlers + $BlizzABS.battlers).each {|battler|
          # if target can be hit considering all conditions
          if battler.battler != nil && group.include?(battler.ai.group) &&
              !battler.battler.dead? && @util.intersection(area,
              Rect.new(battler.real_x / 4, battler.real_y / 4, 32, 32))
            # execute attack
            battler.attack_effect(ch, ch.battler)
            # clear damage displays
            battler.battler.damage, battler.battler.damage_pop = nil, false
          end}
      # enemies were attacked
      return true
    end
    #--------------------------------------------------------------------------
    # skillitem_process
    #  ch - the skill/item using character
    #  object - the skill or item that is being used
    #  Processes skill and item use in Blizz-ABS on the map. One method is
    #  used for both since the process is almost identical for both objects.
    #--------------------------------------------------------------------------
    def skillitem_process(ch, object)
      # determine whether skill or item for easier reference
      case object
      when RPG::Skill
        skill, d, time = true, Skills.range(object.id), Skills.trap(object.id)
        type, charge = Skills.type(object.id), Skills.charge(object.id)
        projectile_speed = Skills.projectile_speed(object.id)
        spriteset = BlizzABS::SPRProjSkill
      when RPG::Item
        skill, d, time = false, Items.range(object.id), Items.trap(object.id)
        type, charge = Items.type(object.id), Items.charge(object.id)
        projectile_speed = Items.projectile_speed(object.id)
        spriteset = BlizzABS::SPRProjItem
      end
      # fix the missing explosion animation error
      type[2] = 0 if type[1] != EXPLNone && type[2] == nil
      # if enemy
      if ch.is_a?(Map_Enemy) && charge[0] == CHARGETrigger
        # correct charge type
        charge[0] = CHARGEMove
      end
      # if not charging already and no selection data
      if charge[0] != CHARGENone && !ch.charging? &&
          $game_temp.select_data == nil
        # setup charging
        ch.setup_charge(object, charge)
        # not used yet
        return false
      end
      # if summoning
      if type[0] == SUMMON
        # nobody except actors can summon with caterpillar turned on
        return false unless ch.is_a?(Map_Actor) && $game_system.caterpillar
        # get summoning data
        summon = (skill ? Skills.summon(object.id) : Items.summon(object.id))
        # if summon ID or time is 0
        if summon[0] == SUMMONNone || summon[1] == 0 || summon[2] == 0
          # no summoning
          return false 
        end
        # no summoning if already summoned
        return false if (@pets + @monsters).any? {|b| b.battler_id == summon[1]}
        # if any summon limit reached
        if summon[0] == SUMMONPet && @pets.size >= BlizzABS::Config::MAX_PETS ||
            summon[0] == SUMMONMonster &&
            @monsters.size >= BlizzABS::Config::MAX_MONSTERS ||
             @pets.size + @monsters.size >= BlizzABS::Config::MAX_SUMMONS
          # no summoning
          return false
        end
        # create new map actor
        new_battler = Map_Actor.new(summon[1])
        # if pet
        if summon[0] == SUMMONPet
          # summon pet
          summon_pet(new_battler, summon[2])
        # if monster
        elsif summon[0] == SUMMONMonster
          # summon monster
          summon_monster(new_battler, summon[2])
        else
          # something's not right here, no summoning
          return false
        end
        # get pixel movement rate
        pix = $BlizzABS.pixel
        # move to correct position
        new_battler.moveto(ch.x / pix, ch.y / pix)
        # set correct battler
        new_battler.battler = $game_actors[summon[1]]
        # heal the battler completely
        new_battler.battler.recover_all
        # return to caterpillar first
        new_battler.cindex, new_battler.ai.state = nil, AI::Return
        # refresh display
        new_battler.refresh
        # set animation
        new_battler.animation_id = object.animation2_id
        # summon successful
        return true
      end
      # skill/item used (can be a common event call) if no target scope
      return true if object.scope == 0
      # if targeting self
      if object.scope == 7
        # if skill
        if skill
          # execute skill upon user
          ch.skill_effect(ch, ch.battler, object)
          # check special skill effects
          self.check_special_skills(ch, [ch], object)
        else
          # execute item upon user
          ch.item_effect(ch, object)
        end
        # clear damage displays
        ch.battler.damage, ch.battler.damage_pop = nil, false
        # skill/item used
        return true
      end
      # correct range
      d = 1 if d < 1
      # determine target alignment, dead flag and all flag
      enemy, dead, all = $BlizzABS.util.get_scope_data(object.scope)
      # doesn't target all and no death roulette initially
      target_all = false
      # if Tons is there and skill process
      if $tons_version != nil && $tons_version >= 6.02 && skill
        # if version is correct and Target 'em all! is being used for this skill
        if $game_system.TARGET_EM_ALL && FULL_TARGET_IDS.include?(object.id)
          # targets all and forces all flag
          target_all = all = true
        end
      end
      # temporary variable
      ai = ch.ai
      # determine whether actor or enemy for easier reference
      if ch.is_a?(Map_Actor)
        # decide target group
        group = (((ch == $game_player || ch.restriction != 3) == enemy) ?
            ai.negative : ai.positive)
      else
        # determine target group depending on confusion
        group = (((ch.restriction == 3) == enemy) ? ai.positive : ai.negative)
      end
      # selection only if player using selectable skill/item and not charging
      if ch == $game_player && $game_temp.select_data == nil &&
          (charge[0] == CHARGENone || charge[0] != CHARGENone &&
          ch.charged?) && (target_all || type[0] == HOMING ||
          type[0] == DIRECT || type[0] == BEAM && all)
        # temporary variable, selection skill/item
        handling = 0
      else
        # set handling for projectile skill/item or direct skill/item
        handling = ((type[0] == SHOOT || type[0] == HOMING ||
            type[0] == TRAP || type[0] == TIMED) ? 1 : 2)
      end
      # depending on handling
      case handling
      when 0 # selection
        # create circle shape data
        area = $BlizzABS.util.get_circle_area(ch, d)
        # create fullscreen rectangle
        screen = $BlizzABS.util.get_fullscreen_area
        # no use if scene not Scene_Map or spriteset doesn't exist
        return false if !$scene.is_a?(Scene_Map) || $scene.spriteset == nil
        # get all selectable map battlers
        available = $scene.spriteset.character_sprites.find_all {|sprite|
            sprite.character.is_a?(Map_Battler) &&
            !sprite.character.is_a?(Map_Remote) &&
            group.include?(sprite.character.ai.group) &&
            can_be_hit(sprite.character, dead, type, all, screen, area)}
        # no use if no selectable targets
        return false if available.size == 0
        # sort selectable targets by coordinates
        available.sort {|a, b| b.y > a.y ? 1 : b.y < a.y ? -1 : (b.x <=> a.x)}
        # setup select interuption
        $game_temp.select_data = [object, d * 32, type[0], available]
        # don't use skill/item yet
        return false
      when 1 # projectile
        # decide process branch depending on skill type
        case type[0]
        # set normal or break-through projectile data
        when SHOOT
          # if break-through
          if all
            # set break-through projectile skill or item
            projectype = (skill ? REMBreakSkill : REMBreakSkill)
          else
            # set normal projectile skill or item
            projectype = (skill ? REMNormalSkill : REMNormalItem)
          end
          # set range
          targets = [d]
        # homing skill/item
        when HOMING
          # get circle area
          area = $BlizzABS.util.get_circle_area(ch, d)
          # create fullscreen rectangle
          screen = $BlizzABS.util.get_fullscreen_area
          # get all targets that can be hit
          targets = ($game_map.battlers + $BlizzABS.battlers).find_all {|b|
              can_be_hit(b, dead, type, all, screen, area)}
          # if targetting everybody
          if target_all
            # reflection possible on everybody
            other = targets.clone
          else
            # reflection possible on non-target group
            other = targets.find_all {|b| !group.include?(b.ai.group)}
            # if predefined target exists
            if !all && ai.target != nil
              # set predefined target
              targets = [ai.target]
            else
              # set possible targets
              targets = targets.find_all {|b| group.include?(b.ai.group)}
            end
          end
          # set homing projectile type
          projectype = (skill ? REMInitSkill : REMInitItem)
        # homing skill/item
        when TRAP
          # targets for selection, other targets
          targets, other = [], []
          # set homing projectile type
          projectype = (skill ? REMTrapSkill : REMTrapItem)
        # homing skill/item
        when TIMED
          # targets for selection, other targets
          targets, other = [], []
          # set homing projectile type
          projectype = (skill ? REMTimedSkill : REMTimedItem)
        end
      when 2 # direct
        # if direct skill or shockwave skill
        if type[0] == DIRECT
          # get circle area
          area = $BlizzABS.util.get_circle_area(ch, d)
        # if beam skill (fullscreen skill that does not target all)
        elsif !all
          # get affection area rectangle
          area = $BlizzABS.util.get_front_area(ch, d)
          # initialize
          this = nil
          # if scene is Scene_Map and spriteset exists
          if $scene.is_a?(Scene_Map) && $scene.spriteset != nil
            # find the sprite of this character
            $scene.spriteset.character_sprites.each {|spr|
                if spr.character == ch
                  this = spr
                  break
                end}
          end
          # if sprite exists
          if this != nil
            # create sprite
            sprite = Sprite.new($scene.spriteset.viewport1)
            # try to
            begin
              # load the characterset file
              sprite.bitmap = RPG::Cache.character(object.icon_name, 0)
              # temporary variables
              w1, h = sprite.bitmap.width, sprite.bitmap.height
            # if failed
            rescue
              # get width and height
              w1, h = 24, d*32
              # create bitmap
              sprite.bitmap = Bitmap.new(w1, h)
              # get image from cache
              b = $BlizzABS.cache.image('beam1')
              # copy the beam image
              (0...h).each {|i|
                  a = (i < h/2 ? i**2*2 : (h-i-1)**2*2)
                  a = 255 if a > 255
                  sprite.bitmap.blt(0, i, b, Rect.new(0, 0, b.width, b.height), a)}
            end
              w2 = case ch.direction
              when 6 then 16-w1/2
              else
                w1/2+16
              end
            # set sprite position, rotation and offsets depending on facing
            case ch.direction
            when 2
              sprite.angle, sprite.ox = 0, w1/2
              sprite.x, sprite.y, sprite.z = this.x, this.y, this.z+1
            when 4
              sprite.angle, sprite.ox, sprite.oy = 270, w2, w1/2+16
              sprite.x, sprite.y, sprite.z = this.x-w1-16, this.y, this.z-1
            when 6
              sprite.angle, sprite.ox, sprite.oy = 90, -w2, -w1/2+16
              sprite.x, sprite.y, sprite.z = this.x+16, this.y, this.z-1
            when 8
              sprite.angle, sprite.ox, sprite.oy = 180, w1/2, h+16
              sprite.x, sprite.y, sprite.z = this.x, this.y-h-32, this.z-32
            end
            # add sprite for handling
            $BlizzABS.cache.beams.push([sprite, 20])
            # set beam flag
            beam = true
          end
        end
        # create fullscreen rectangle
        screen = $BlizzABS.util.get_fullscreen_area
        # get all targets that can be hit
        targets = ($game_map.battlers + $BlizzABS.battlers).find_all {|b|
            can_be_hit(b, dead, type, all, screen, area)}
        # if targetting everybody
        if target_all
          # reflection possible on everybody
          other = targets.clone
        else
          # reflection possible on non-target group
          other = targets.find_all {|b| !group.include?(b.ai.group)}
          # if predefined target exists
          if !all && ai.target != nil
            # set predefined target
            targets = [ai.target]
          else
            # set possible targets
            targets = targets.find_all {|b| group.include?(b.ai.group)}
          end
        end
      end
      # if no selectable targets and not trap
      if targets.size == 0 && projectype != REMTrapSkill &&
          projectype != REMTrapItem && projectype != REMTimedSkill &&
          projectype != REMTimedItem
        # no use
        return (beam == true)
      end
      # if Full Reflection System is being used and not breaking reflection skill
      if $full_reflection_system != nil && $full_reflection_system >= 3.01 &&
          targets[0].is_a?(Map_Battler) && skill && !beam &&
          !BlizzCFG::BREAK_REFLECT.include?(object.id) &&
          projectype != REMTrapSkill && projectype != REMTrapItem &&
          projectype != REMTimedSkill && projectype != REMTimedItem
        # execute reflection effect in Blizz-ABS
        BlizzCFG.reflection_effect_blizzabs(ch, targets, other, object)
      end
      # get a random target if not targeting all and no beam or death roulette
      targets = [targets[rand(targets.size)]] if !all && !beam
      # if projectile data is available and projectile should be created
      if projectype != nil
        # temporary variable
        explode = (type[1] != EXPLNone ? type[1, 3] : nil)
        # if trap
        if projectype == REMTrapSkill || projectype == REMTrapItem
          # create trap
          proj = Map_Trap.new(spriteset + object.id.to_s, ch, object.id, d,
              time, projectype, group, dead, explode)
          # add trap to buffer
          $BlizzABS.cache.remotes.push(proj)
        # if timed trap
        elsif projectype == REMTimedSkill || projectype == REMTimedItem
          # create timed trap
          proj = Map_Timed.new(spriteset + object.id.to_s, ch, object.id, d,
              time, projectype, group, dead, explode)
          # add timed trap to buffer
          $BlizzABS.cache.remotes.push(proj)
        else
          # iterate through all targets
          targets.each {|target|
              # create projectile
              proj = Map_Projectile.new(spriteset + object.id.to_s, ch,
                  object.id, target, projectile_speed, projectype, group, dead,
                  explode)
              # add projectile to buffer
              $BlizzABS.cache.remotes.push(proj)}
        end
      # if skill
      elsif skill
        # execute skill effect upon all targets
        targets.each {|target| target.skill_effect(ch, ch.battler, object)}
        # check special skill effects
        self.check_special_skills(ch, targets, object)
        # clear damage displays upon all targets
        targets.each {|target|
            target.battler.damage, target.battler.damage_pop = nil, false}
      else
        # upon all targets
        targets.each {|target|
            # execute item effect
            target.item_effect(ch, object)
            # clear damage displays
            target.battler.damage, target.battler.damage_pop = nil, false}
      end
      # skill/item use successful
      return true
    end
    #--------------------------------------------------------------------------
    # can_be_hit
    #  char       - current map battler
    #  dead       - dead flag
    #  type       - object type
    #  all        - targeting all
    #  screen     - screen rectangle
    #  area       - affection area data
    #  Determines whether a map battler is affected by an area.
    #--------------------------------------------------------------------------
    def can_be_hit(char, dead, type, all, screen, area)
      return (char.battler != nil && dead == char.battler.dead? &&
          @util.intersection(screen, Rect.new(char.real_x / 4 + 15,
          char.real_y / 4 + 15, 2, 2)) && (type[0] == BEAM && all ||
          @util.intersection(area, Rect.new(char.real_x / 4,
          char.real_y / 4, 32, 32))))
    end
    #--------------------------------------------------------------------------
    # check_special_skills(battler, targets, skill)
    #  ch      - the character
    #  targets - all targets
    #  skill   - the used skill
    #  Addition to process special skill effects.
    #--------------------------------------------------------------------------
    def check_special_skills(ch, targets, skill)
      # if Tons of Add-ons is being used
      if $tons_version != nil && $tons_version >= 6.4
        # if using absorbing skills
        if $game_system.ABSORB_HP_SP
          # set damage accumulation to 0
          damages = 0
          # if skill absorbs HP
          if SKILL_IDS_HP.include?(skill.id)
            # for each target
            targets.each {|target|
                # if damage was done
                if target.battler.damage.is_a?(Numeric)
                  # accumulate damage
                  damages += target.battler.damage
                end}
            # change battler HP
            ch.battler.hp += damages
            # request damage sprite
            $BlizzABS.util.request_damage_sprite(ch)
          # if skill absorbs SP
          elsif SKILL_IDS_SP.include?(skill.id)
            # for each target
            targets.each {|target|
                # if damage was done
                if target.battler.damage.is_a?(Numeric)
                  # accumulate damage
                  damages += target.battler.spdamage
                  # remove damage
                  target.battler.damage = nil
                  # make SP damage text
                  target.check_spdamage
                end}
            # change battler SP
            ch.battler.sp += damages
            # request damage sprite
            $BlizzABS.util.request_damage_sprite(ch)
          end
        end
        # if using Destructor Skill and battler should die
        if $game_system.DESTRUCTOR_SKILL && ch.battler.set_to_die
          # kill
          ch.battler.hp = 0
        end
        # if using Blus Magic Skills
        if $game_system.BLUE_MAGIC_SKILL && BLUE_MAGIC_IDS.include?(skill.id)
          # remove damage for all targets
          targets.each {|target| target.battler.damage = nil}
          # get a random target
          target = targets[rand(targets.size)]
          # try to learn
          if rand(100) < skill.hit
            # if enemy
            if target.battler.is_a?(Game_Enemy)
              # initialize array
              ids = []
              # get all skill IDs of the target
              target.battler.actions.each {|act|
                  ids.push(act.skill_id) if act.kind == 1}
            # if actor
            elsif target.battler.is_a?(Game_Actor)
              # get all skill IDs of the target
              ids = target.battler.skills.clone
            end
            # if any ID exists
            if ids.size > 0
              # get skill
              newskill = $data_skills[ids[rand(ids.size)]]
              # if already knowing that skill
              if ch.battler.skills.include?(newskill.id)
                # make damage text
                target.battler.damage = "#{newskill.name} known"
              else
                # learn skill
                target.battler.learn_skill(newskill.id)
                # make damage text
                target.battler.damage = "#{newskill.name} learned"
              end
            else
              # no skills available
              target.battler.damage = 'None available'
            end
          else
            # not successful
            target.battler.damage = 'Miss'
          end
        end
      end
    end
    #--------------------------------------------------------------------------
    # drop_event
    #  items   - array of items which the event contains
    #  real_x  - real x-coordinate
    #  real_y  - real y-coordinate
    #  dropper - the enemy that dropped the loot
    #  time    - timer setting
    #  Creates an event that contains loot that can be picked up.
    #--------------------------------------------------------------------------
    def drop_event(items, real_x, real_y, dropper = nil, time = nil)
      # map coordinates
      x, y, icon = real_x / 128, real_y / 128, false
      # if gold dropped and no corpses used
      if dropper == nil && items[0].is_a?(Numeric) &&
          !BlizzABS::Config::CORPSES
        # set up everything for map display
        event = create_drop_event(x, y, BlizzABS::Config::GOLD_DROP)
        # setup the event commands
        setup_drop_event(event, items, BlizzABS::Config::GOLD_PICKUP_SOUND_FILE)
      else
        # if not dropped by enemy
        if dropper == nil
          # create drop event with icon spriteset
          event = create_drop_event(x, y, items[0].icon_name)
          # event with icon spriteset
          icon = !Items.drop_sprite(items[0].id)
        # if using corpses
        elsif BlizzABS::Config::CORPSES
          # create drop event
          event = create_drop_event(x, y, dropper.character_name_org +
              BlizzABS::SPRCorpse, dropper.character_hue, 0)
        else
          # create drop event
          event = create_drop_event(x, y, dropper.character_name_org,
              dropper.character_hue)
        end
        # setup the event commands
        setup_drop_event(event, items)
      end
      # call superclass method
      drop = Game_Event.new($game_map.map_id, event)
      # mark created event as icon event
      drop.icondrop = icon
      # refresh
      drop.refresh
      # set up drop mode
      drop.activate_drop_mode(BlizzABS::Config::DROP_TIME * 40)
      # add into map events
      $game_map.events[event.id] = drop
      # stop if scene not Scene_Map or spriteset doesn't exist
      return if !$scene.is_a?(Scene_Map) || $scene.spriteset == nil
      # create own sprite as dropped
      sprite = Sprite_Character.new($scene.spriteset.viewport1, drop)
      # add to spriteset handler
      $scene.spriteset.character_sprites.push(sprite)
    end
    #--------------------------------------------------------------------------
    # create_drop_event
    #  x              - x-coordinate
    #  y              - y-coordinate
    #  character_name - spriteset name
    #  character_hue  - spriteset hue
    #  trigger        - event trigger
    #  Sets up everything so the item can be displayed correctly.
    #--------------------------------------------------------------------------
    def create_drop_event(x, y, character_name, character_hue = 0, trigger = 1)
      # create new event
      event = RPG::Event.new(0, 0)
      # if no floor beneath
      if BlizzABS::Config::NO_FLOOR_TAGS.include?($game_map.terrain_tag(x, y))
        # find closest coordinates that have a floor
        event.x, event.y = $BlizzABS.util.closest_floor(x, y)
      else
        # set coordinates
        event.x, event.y = x, y
      end
      # get keys
      keys = $game_map.events.keys
      # set new ID
      event.id = (keys.size == 0 ? 1 : keys.max + 1)
      # set own event name DROP + ID
      event.name = "DROP#{event.id}"
      # set up all necessary event page settings
      event.pages[0].graphic.character_name = character_name
      event.pages[0].graphic.character_hue = character_hue
      event.pages[0].through = event.pages[0].direction_fix = true
      event.pages[0].walk_anime = event.pages[0].step_anime = false
      event.pages[0].trigger = trigger
      # return the created event
      return event
    end
    #--------------------------------------------------------------------------
    # setup_drop_event
    #  event     - the event
    #  items     - the dropped items
    #  soundfile - the sound file to be played
    #  Sets up everything so that the right items are obtained when picking up
    #  the event.
    #--------------------------------------------------------------------------
    def setup_drop_event(event, items,
                         soundfile = BlizzABS::Config::ITEM_PICKUP_SOUND_FILE)
      # if there are no items
      if items.size == 0
        # create the event commands
        event.pages[0].list.push(RPG::EventCommand.new)
        # erase event command
        event.pages[0].list[0].code = 116
        # abort
        return
      end
      # create the event commands
      (items.size + 2).times {event.pages[0].list.push(RPG::EventCommand.new)}
      # play sound effect
      event.pages[0].list[items.size].code = 250
      # set file to be played
      event.pages[0].list[items.size].parameters = [soundfile]
      # erase event command
      event.pages[0].list[items.size + 1].code = 116
      # for each dropped item
      items.each_index {|i|
          # deteremine code and parameters
          case items[i]
          when Numeric then code, parameters = 125, [0, 0, items[i]]
          when RPG::Item then code, parameters = 126, [items[i].id, 0, 0, 1]
          when RPG::Weapon then code, parameters = 127, [items[i].id, 0, 0, 1]
          when RPG::Armor then code, parameters = 128, [items[i].id, 0, 0, 1]
          end
          # which event command
          event.pages[0].list[i].code = code
          # increase quantity by number command
          event.pages[0].list[i].parameters = parameters}
    end
    #--------------------------------------------------------------------------
    # get_enemies
    #  id - event ID or false for troop
    #  Gets the requested target enemies.
    #--------------------------------------------------------------------------
    def get_enemies(id)
      # get targets
      return (id ? [$game_map.events[id]].compact : $game_map.battlers)
    end
    #--------------------------------------------------------------------------
    # get_actors
    #  id - party position ID or false for party
    #  Gets the requested target actors.
    #--------------------------------------------------------------------------
    def get_actors(id)
      # get targets
      return (id ? [$BlizzABS.actors[id]].compact : $BlizzABS.actors.clone)
    end
    #--------------------------------------------------------------------------
    # get_targets
    #  target_type - enemies or actors
    #  target      - which target
    #  Gets the requested targets.
    #--------------------------------------------------------------------------
    def get_targets(target_type, target)
      return case target_type
      when ENEMIES then return get_enemies(target)
      when ACTORS then return get_actors(target)
      when NONE then return nil
      end
    end
    #--------------------------------------------------------------------------
    # enemy_change_hp
    #  id           - event ID or false for troop
    #  operation    - increase flag
    #  operand_type - variable or constant
    #  operand      - value or variable ID
    #  allow_kill   - allow to kill
    #  Part of the battleflow control on the map and allows users to change the
    #  HP of enemies on the map.
    #--------------------------------------------------------------------------
    def enemy_change_hp(id, operation, operand_type, operand, allow_kill)
      # creating an interpreter
      interpreter = Interpreter.new
      # get value from data
      value = interpreter.operate_value(operation, operand_type, operand)
      # for all target enemies
      get_enemies(id).each {|enemy|
          # if actually existing enemy
          if enemy.battler != nil
            # if not allowed to kill and change would kill
            if !allow_kill && enemy.battler.hp <= -value
              # set to 1 HP
              enemy.battler.hp = 1
            else
              # change HP
              enemy.battler.hp += value
            end
          end}
    end
    #--------------------------------------------------------------------------
    # enemy_change_sp
    #  id           - event ID or false for troop
    #  operation    - increase flag
    #  operand_type - variable or constant
    #  operand      - value or variable ID
    #  Part of the battleflow control on the map and allows users to change the
    #  SP of enemies on the map.
    #--------------------------------------------------------------------------
    def enemy_change_sp(id, operation, operand_type, operand)
      # creating an interpreter
      interpreter = Interpreter.new
      # get value from data
      value = interpreter.operate_value(operation, operand_type, operand)
      # change SP of all existing target enemies
      get_enemies(id).each {|e| e.battler.sp += value if e.battler != nil}
    end
    #--------------------------------------------------------------------------
    # enemy_change_state
    #  id       - event ID or false for troop
    #  add      - add/remove flag
    #  state_id - status effect ID
    #  Part of the battleflow control on the map and allows users to change the
    #  states of enemies on the map.
    #--------------------------------------------------------------------------
    def enemy_change_state(id, add, state_id)
      # for all target enemies
      get_enemies(id).each {|enemy|
          # if actually existing enemy
          if enemy.battler != nil
            # clear immortal flag if state is dead state
            enemy.battler.immortal = false if $data_states[state_id].zero_hp
            # add or remove state
            add ? enemy.battler.add_state(state_id) :
                enemy.battler.remove_state(state_id)
          end}
    end
    #--------------------------------------------------------------------------
    # enemy_recover_all
    #  id - event ID or false for troop
    #  Part of the battleflow control on the map and allows users to let
    #  enemies recover on the map.
    #--------------------------------------------------------------------------
    def enemy_recover_all(id)
      # recover all existing target enemies
      get_enemies(id).each {|e| e.battler.recover_all if e.battler != nil}
    end
    #--------------------------------------------------------------------------
    # enemy_transform
    #  id       - event ID or false for troop
    #  enemy_id - enemy ID in the database
    #  Part of the battleflow control on the map and allows users to transform
    #  enemies on the map.
    #--------------------------------------------------------------------------
    def enemy_transform(id, enemy_id)
      # transform all existing target enemies
      get_enemies(id).each {|e| e.transform(enemy_id) if e.battler != nil}
    end
    #--------------------------------------------------------------------------
    # enemy_change_group
    #  id       - event ID or false for troop
    #  group_id - alignment group ID
    #  Part of the battleflow control on the map and allows users to change the
    #  alignment group of enemies.
    #--------------------------------------------------------------------------
    def enemy_change_group(id, group_id)
      # transform all existing target enemies
      get_enemies(id).each {|e| e.ai.setup_group(group_id) if e.battler != nil}
    end
    #--------------------------------------------------------------------------
    # enemy_affect_group
    #  id       - event ID or false for troop
    #  group_id - alignment group ID
    #  Part of the battleflow control on the map and allows users to cause
    #  a negative effect on the enemy alignment group from another group.
    #--------------------------------------------------------------------------
    def enemy_affect_group(id, group_id)
      # transform all existing target enemies
      get_enemies(id).each {|e| e.alignment_effect(group_id) if e.battler != nil}
    end
    #--------------------------------------------------------------------------
    # enemy_deal_damage
    #  id           - event ID or false for troop
    #  operand_type - variable or constant
    #  operand      - value or variable ID
    #  Part of the battleflow control on the map and allows users to deal
    #  damage to enemies on the map.
    #--------------------------------------------------------------------------
    def enemy_deal_damage(id, operand_type, operand)
      # execute requested command
      battler_deal_damage(get_enemies(id), operand_type, operand)
    end
    #--------------------------------------------------------------------------
    # actor_deal_damage
    #  id           - actor position ID or false for party
    #  operand_type - variable or constant
    #  operand      - value or variable ID
    #  Part of the battleflow control on the map and allows users to deal
    #  damage to actors on the map.
    #--------------------------------------------------------------------------
    def actor_deal_damage(id, operand_type, operand)
      # execute requested command
      battler_deal_damage(get_actors(id), operand_type, operand)
    end
    #--------------------------------------------------------------------------
    # battler_deal_damage
    #  targets - targets
    #  operand_type - variable or constant
    #  operand      - value or variable ID
    #  Deals damage to the given targets.
    #--------------------------------------------------------------------------
    def battler_deal_damage(targets, operand_type, operand)
      # creating an interpreter
      interpreter = Interpreter.new
      # if number
      if operand.is_a?(Numeric)
        # get value from data
        value = interpreter.operate_value(CONSTANT, operand_type, operand)
      else
        # set direct value
        value = operand
      end
      # for all target enemies
      targets.each {|battler|
          # if actually existing battler
          if battler.valid?
            # change HP if numeric value
            battler.battler.hp -= value if value.is_a?(Numeric)
            # set damage
            battler.battler.damage = value
            # request damage sprite
            $BlizzABS.util.request_damage_sprite(battler)
            # reset damage
            battler.battler.damage = nil
            # reset hpdamage and spdamage
            battler.battler.hpdamage = battler.battler.spdamage = 0
          end}
    end
    #--------------------------------------------------------------------------
    # enemy_force_action
    #  id          - event ID or false for troop
    #  target_type - enemies or actors
    #  target      - which target
    #  action_type - attack, defend, escape or skill
    #  data        - defend time, runaway time or skill ID
    #  Part of the battleflow control on the map and allows users to enforce
    #  enemies to make an action.
    #--------------------------------------------------------------------------
    def enemy_force_action(id, target_type, target, action_type, data)
      # abort if trying to force an enemy to use an item
      return if action_type == ITEM
      # decide targets depending on target battler type
      to_target = get_targets(target_type, target)
      # for all enemies
      get_enemies(id).each {|enemy|
          # if actually existing enemy
          if enemy.battler != nil
            # setup action for enemy
            $BlizzABS.AI.normal_action(enemy, to_target, to_target,
                (action_type < SKILL), action_type, data, data, data,
                (action_type != ITEM), (to_target == NONE))
            # make actually aggressive if action exists
            enemy.ai.aggressive = true if enemy.ai.act.valid?
          end}
    end
    #--------------------------------------------------------------------------
    # actor_force_action
    #  id          - actor position ID or false for party
    #  target_type - enemies or actors
    #  target      - which target
    #  action_type - attack, defend, escape or skill
    #  data        - defend time, skill ID or item ID
    #  Part of the battleflow control on the map and allows users to enforce
    #  enemies to make an action.
    #--------------------------------------------------------------------------
    def actor_force_action(id, target_type, target, action_type, data)
      # abort if trying to force an actor to run away
      return if action_type == ESCAPE
      # decide targets depending on target battler type
      to_target = get_targets(target_type, target)
      # for all actors
      get_actors(id).each {|actor|
          # if actually existing actor
          if actor.valid?
            # setup action for enemy
            $BlizzABS.AI.normal_action(actor, to_target, to_target,
                (action_type < SKILL), action_type, data, data, data,
                (action_type != ITEM), (to_target == NONE))
          end}
    end
    #--------------------------------------------------------------------------
    # get_enemy
    #  id   - event ID
    #  Returns the battler instance of an enemy.
    #--------------------------------------------------------------------------
    def get_enemy(id)
      # get enemies
      enemies = get_enemies(id)
      # return result
      return enemies[0].battler
    end
    #--------------------------------------------------------------------------
    # is_enemy?
    #  id   - event ID
    #  Checks whether the given event is an enemy.
    #--------------------------------------------------------------------------
    def is_enemy?(id)
      # get enemies
      enemies = get_enemies(id)
      # return result
      return (enemies.size > 0 && enemies[0].is_a?(Map_Battler))
    end
    #--------------------------------------------------------------------------
    # enemy_has_state?
    #  id   - event ID or false for troop
    #  s_id - state ID
    #  Checks whether the given enemy has a specific state.
    #--------------------------------------------------------------------------
    def enemy_has_state?(id, s_id)
      # get enemies
      enemies = get_enemies(id)
      # return result
      return (enemies.any? {|e| e.states.include?(s_id)})
    end
    #--------------------------------------------------------------------------
    # enemy_can_see?
    #  id          - event ID
    #  target_type - enemies or actors
    #  target      - which target
    #  Checks is the given enemy can see a specific battler.
    #--------------------------------------------------------------------------
    def enemy_can_see?(id, target_type, target)
      # get enemies
      enemies = get_enemies(id)
      # can't see if not a battler
      return false unless enemies[0].is_a?(Map_Battler)
      # get targets to check
      targets = get_targets(target_type, target)
      # return result
      return (enemies.any? {|e| (targets & e.ai.sight).size > 0})
    end
    #--------------------------------------------------------------------------
    # enemy_can_hear?
    #  id          - event ID
    #  target_type - enemies or actors
    #  target      - which target
    #  Checks is the given enemy can see a specific battler.
    #--------------------------------------------------------------------------
    def enemy_can_hear?(id, target_type, target)
      # get enemies
      enemies = get_enemies(id)
      # can't see if not a battler
      return false unless enemies[0].is_a?(Map_Battler)
      # get targets to check
      targets = get_targets(target_type, target)
      # return result
      return (targets.any? {|t| enemies.any? {|e|
          $BlizzABS.AI.can_hear_char?(e, t.real_x, t.real_y)}})
    end
    #--------------------------------------------------------------------------
    # enemy_can_perceive?
    #  id          - event ID
    #  target_type - enemies or actors
    #  target      - which target
    #  Checks is the given enemy can see a specific battler.
    #--------------------------------------------------------------------------
    def enemy_can_perceive?(id, target_type, target)
      # get enemies
      enemies = get_enemies(id)
      # can't see if not a battler
      return false unless enemies[0].is_a?(Map_Battler)
      # get targets to check
      targets = get_targets(target_type, target)
      # return result
      return (targets.any? {|t| enemies.any? {|e|
          $BlizzABS.AI.can_perceive_char?(e, t.real_x, t.real_y)}})
    end
    #--------------------------------------------------------------------------
    # enemy_has_memorized?
    #  id          - event ID
    #  target_type - enemies or actors
    #  target      - which target
    #  Checks is the given enemy can see a specific battler.
    #--------------------------------------------------------------------------
    def enemy_has_memorized?(id, target_type, target)
      # get enemies
      enemies = get_enemies(id)
      # can't see if not a battler
      return false unless enemies[0].is_a?(Map_Battler)
      # get targets to check
      targets = get_targets(target_type, target)
      # return result
      return (enemies.any? {|e| targets.size > 0 || e.ai.memory.keys.size > 0})
    end
  end
  
end

module BlizzABS
  
  #============================================================================
  # BlizzABS::Controller
  #----------------------------------------------------------------------------
  #  This class is a special controller that controls the party leader.
  #============================================================================
  
  class Controller
    
    # Center screen x-coordinate * 4
    CX = (320 - 16) * 4
    # Center screen y-coordinate * 4
    CY = (240 - 16) * 4
    
    # set all accessible variables
    attr_accessor :encounter_count
    #--------------------------------------------------------------------------
    # Initialization
    #--------------------------------------------------------------------------
    def initialize
      # set memory jump
      @memory_jump = false
    end
    #--------------------------------------------------------------------------
    # player
    #  Makes the code easier to read.
    #--------------------------------------------------------------------------
    def player
      return $BlizzABS.actors[0]
    end
    #--------------------------------------------------------------------------
    # update_control
    #  Processes player control.
    #--------------------------------------------------------------------------
    def update_control
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # reset move speed
      player.move_speed = player.normal_speed
      # reset spriteset name
      player.character_name = player.character_name_org
      # if allowed to change speed
      unless $game_system.map_interpreter.running? ||
          player.move_route_forcing || $game_temp.message_window_showing
        # if run button works and running
        if $game_system.running_button && Input.press?(Input::Run)
          # set running speed
          player.move_speed = Config::RUN_SPEED
        # if sneak button works and sneaking
        elsif $game_system.sneaking_button && Input.press?(Input::Sneak) ||
            Config::SNEAK_SPEED > 0 && Config::SNEAK_ON_CHARGE && player.charging?
          # set sneaking speed
          player.move_speed = Config::SNEAK_SPEED
        end
      end
      # if battler exists and either dead or select triggered
      if player.battler != nil && ($game_system.select_button &&
          Input.trigger?(Input::Select) || player.battler.dead?)
        # switch to next valid actor
        switch_leader
      end 
      # setup sprite animation
      player.sprite_animation_setup
      # update action
      player.update_action
      # if allowed to turn and pressed turning button or defending
      if ((player.ai.act.defend? && player.attacked == 0) ||
          $game_system.turn_button && Input.press?(Input::Turn)) &&
          !player.moving? && !$game_system.map_interpreter.running? &&
          !player.move_route_forcing && !$game_temp.message_window_showing
        # get input depending on confusion
        input = (player.restriction == 3 ? 10 - Input.dir4 : Input.dir4)
        # depending on input turn
        case input
        when 2 then player.turn_down
        when 4 then player.turn_left
        when 6 then player.turn_right
        when 8 then player.turn_up
        end
        # updates any attacked action
        player.update_attacked
        # abort method
        return nil
      end
      # updates any attacked action
      player.update_attacked
      # if acting
      if player.in_action > 0
        # decrease action counter if in_action is greater than 0
        player.in_action -= 1 if player.in_action > 0
        # return data
        return [player.moving?, player.real_x, player.real_y]
      end
      # if allowed to move
      unless $game_system.map_interpreter.running? ||
          player.move_route_forcing || $game_temp.message_window_showing
        # if jump button was pressed and not already jumping
        if $game_system.jumping_button && Input.trigger?(Input::Jump) &&
            !player.jumping? && player.restriction < 4
          # set to jump
          @memory_jump = true
        end
        # if not moving
        unless player.moving?
          # get jumping range
          range = Config::JUMPING
          # if jumping turned on and not jumping and jumped
          if range > 0 && !player.jumping? && @memory_jump
            # if sneaking or running is possible
            if Config::RUN_SPEED > 0 || Config::SNEAK_SPEED > 0
              # get difference between current speed and normal speed
              dplus = player.move_speed - player.normal_speed
            else
              # difference is 0
              dplus = 0
            end
            # get direction
            direction = $game_system._8_way ? Input.dir8 : Input.dir4
            # set jumping direction
            x, y = Cache::DirOffsets[direction]
            # jump into direction with considering running/sneaking
            player.jump(x*range + x*dplus, y*range + y*dplus, direction)
          # if not already jumping
          elsif !player.jumping?
            # move
            move($game_system._8_way ? Input.dir8 : Input.dir4)
            # allow idle if no movement
            player.idle_allowed = !player.moving?
          end
          # not jumping anymore
          @memory_jump = false
        end
      end
      # return data
      return [player.moving?, player.real_x, player.real_y]
    end
    #--------------------------------------------------------------------------
    # switch_leader
    #  Switches to the next valid actor as leader.
    #--------------------------------------------------------------------------
    def switch_leader
      # store the old party leader
      leader = player
      # iterate "number of party members" times
      $game_party.actors.size.times {
          # change party leader
          $game_party.add_actor($game_party.actors.shift.id)
          # until finding one who's not dead
          break if $game_party.actors[0] != nil && !$game_party.actors[0].dead?}
      # stop if party leader has not changed
      return if leader == player
      # enforce emptying moving buffer and add special command
      update_buffer(nil)
      # center screen display on new player controlled character
      center(player.x, player.y, true) if $game_system.caterpillar
      # except if charging
      unless player.charging?
        # reset player action
        player.reset_action
        # reset player action counter
        player.in_action = 0
      end
      # except if charging
      unless leader.charging?
        # reset old leader action
        leader.reset_action
        # reset old leader action counter
        leader.in_action = 0
      end
      # set flag for HUD update
      $game_temp.hud_refresh = true
    end
    #--------------------------------------------------------------------------
    # move
    #  dir - direction
    #  Make the code easier to read. It moves the player in the appropriate
    #  direction then.
    #--------------------------------------------------------------------------
    def move(dir)
      return case (player.restriction == 3 ? 10 - dir : dir)
      when 1 then player.move_lower_left
      when 2 then player.move_down
      when 3 then player.move_lower_right
      when 4 then player.move_left
      when 6 then player.move_right
      when 7 then player.move_upper_left
      when 8 then player.move_up
      when 9 then player.move_upper_right
      end
    end
    #--------------------------------------------------------------------------
    # update_moving
    #  Processes player control.
    #--------------------------------------------------------------------------
    def update_moving(data)
      # if control update was not aborted
      if data != nil
        # get data
        moved, x, y = data
        # if moved down
        if player.real_y > y && player.real_y - $game_map.display_y > CY
          # scroll screen down
          $game_map.scroll_down(player.real_y - y)
        end
        # if moved left
        if player.real_x < x && player.real_x - $game_map.display_x < CX
          # scroll screen left
          $game_map.scroll_left(x - player.real_x)
        end
        # if moved right
        if player.real_x > x && player.real_x - $game_map.display_x > CX
          # scroll screen right
          $game_map.scroll_right(player.real_x - x)
        end
        # if moved up
        if player.real_y < y && player.real_y - $game_map.display_y < CY
          # scroll screen up
          $game_map.scroll_up(y - player.real_y)
        end
        # if not moving
        unless player.moving?
          # if last moving, not activated, not override and countdown
          if moved && !check_event_trigger_here(Cache::TouchTrigger) &&
              !($DEBUG && Input.press?(Input::CTRL)) && @encounter_count > 0
            # set battle-encounter countdown
            @encounter_count -= 2 ** (5 - $game_system.pixel_rate)
            @encounter_count = 0 if @encounter_count < 0
          end
          # if pressed C button
          if Input.trigger?(Input::C)
            # check event here
            check_event_trigger_here(Cache::PressTrigger)
            # check event there
            check_event_trigger_there(Cache::BasicTrigger)
          end
        end
      end
      # update each other actor except the player
      ($BlizzABS.battlers - [player]).each {|actor| actor.update}
    end
    #--------------------------------------------------------------------------
    # update_buffer
    #  move - new command
    #  Updates the buffer of the last moving commands.
    #--------------------------------------------------------------------------
    def update_buffer(move)
      # if new command requires so
      if move == nil || move == false
        # empty each actor's buffer
        $BlizzABS.battlers.each {|actor| actor.force_move = []}
      end
      # add new command or enforce emptying whether move is reset for each actor
      $BlizzABS.battlers.each {|actor| actor.update_buffer(move == 'reset' ? nil : move)}
    end
    #--------------------------------------------------------------------------
    # refresh
    #  Refreshes the character.
    #--------------------------------------------------------------------------
    def refresh
      # test on changes in the inner structure of $game_party.actors
      if $BlizzABS.actors.any? {|actor|
          actor.battler(true) == nil && $game_party.actors[actor.index] != nil ||
          actor.battler(true) != $game_party.actors[actor.index]}
        # if caterpillar is on
        if $game_system.caterpillar
          # store old array, create 2 new arrays
          old, tmp, $BlizzABS.actors = $BlizzABS.actors, [], []
          # for each old actor
          old.each {|a|
              # if battler exists and in party
              if a.battler(true) != nil && a.battler(true).index != nil &&
                  a.battler(true).index < BlizzABS::Config::MAX_PARTY
                # add actor on position
                $BlizzABS.actors[a.battler(true).index] = a
              end}
          # for the rest of the old actors
          (old - $BlizzABS.actors).each {|a|
              # if not in party
              if a.battler(true) != nil && (a.battler(true).index == nil ||
                  a.battler(true).index >= BlizzABS::Config::MAX_PARTY)
                # remove battler
                a.battler = nil
              end
              # add actor
              tmp.push(a)}
          # fill the empty places between
          $BlizzABS.actors.each_index {|i|
              $BlizzABS.actors[i] = tmp.shift if $BlizzABS.actors[i] == nil}
          # add rest of actors
          $BlizzABS.actors += tmp
          # for each actor
          $BlizzABS.actors.each {|a|
              # if no battler assigned, but in the party is a battler
              if a.battler(true) == nil && $game_party.actors[a.index] != nil
                # assign battler
                a.battler = $game_party.actors[a.index]
              end}
        else
          # set the correct battlers
          $BlizzABS.actors.each_index {|i|
              $BlizzABS.actors[i].battler = $game_party.actors[i]}
        end
      end
      # each actor
      $BlizzABS.battlers.each {|actor|
          # refresh spriteset
          actor.refresh(true)
          # set to return to caterpillar for convenience
          actor.ai.state = AI::Return
          # if actor not valid
          unless actor.valid?
            # reset action
            actor.ai.target = nil
            actor.ai.act.set
          end}
      # set new $game_player character
      $game_player = player
    end
    #--------------------------------------------------------------------------
    # moveto
    #  x - x-coordinate
    #  y - y-coordinate
    #  Moves the player instantly to a position, moves all actors and centers
    #  the screen upon the player.
    #--------------------------------------------------------------------------
    def moveto(x, y)
      # center screen upon player
      center(x, y)
      # for each actor
      ($BlizzABS.battlers - [player]).each {|actor|
          # return to caterpillar if not in caterpillar
          actor.return_to_caterpillar if actor.cindex == nil}
      # empty movement command buffer
      update_buffer(nil)
      # move each actor to the same position
      ($BlizzABS.battlers - [player]).each {|actor| actor.moveto(x, y)}
      # create battle-encounter countdown
      player.make_encounter_count
    end
    #--------------------------------------------------------------------------
    # center
    #  x - x-coordinate
    #  y - y-coordinate
    #  Centers the screen upon the player. (pixel movement)
    #--------------------------------------------------------------------------
    def center(x, y, flag = false)
      # set pix value
      pix = flag ? $BlizzABS.pixel : 1
      # resize coordinates
      x, y = x * 128 / pix, y * 128 / pix
      # get maximum coordinates of map
      m_x, m_y = ($game_map.width - 20) * 128, ($game_map.height - 15) * 128
      ox, oy = x - CX, y - CY
      # set new display coordinates
      if ox > m_x
        $game_map.display_x = m_x
      elsif ox < 0
        $game_map.display_x = 0
      else
        $game_map.display_x = ox
      end
      if oy > m_y
        $game_map.display_y = m_y
      elsif oy < 0
        $game_map.display_y = 0
      else
        $game_map.display_y = oy
      end
    end
    #--------------------------------------------------------------------------
    # check_event_trigger_here
    #  triggers - possible event triggers
    #  Checks if there are events to be triggered. (pixel movement)
    #--------------------------------------------------------------------------
    def check_event_trigger_here(triggers)
      # not started if already running
      return false if $game_system.map_interpreter.running?
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # initialize result
      result = false
      # iterate through all events
      $game_map.events.each_value {|event|
          # if coordinates fit and can be triggered and not jumping
          if event.x == (player.x+pix/2)/pix &&
             event.y == (player.y+pix/2)/pix &&
              triggers.include?(event.trigger) && !event.jumping? &&
              event.over_trigger?
            # start event
            event.start
            # events were started
            result = true
          end}
      # return result
      return result
    end
    #--------------------------------------------------------------------------
    # check_event_trigger_there
    #  triggers - possible event triggers
    #  Checks if there are events to be triggered. (pixel movement)
    #--------------------------------------------------------------------------
    def check_event_trigger_there(triggers)
      # not started if already running
      return false if $game_system.map_interpreter.running?
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # calculate new coordinates
      nx = player.x + (player.direction == 6 ? 1 : player.direction == 4 ? -1 : 0)*pix
      ny = player.y + (player.direction == 2 ? 1 : player.direction == 8 ? -1 : 0)*pix
      # initialize result
      result = false
      # iterate through all events
      $game_map.events.each_value {|event|
          # if triggered by touch and trigger started the event
          if triggers.include?(event.trigger) &&
              event.check_event_trigger_at(nx, ny)
            # events were started
            result = true
          end}
      # if event was not started and counter
      if !result && $game_map.pixel_counter?(nx, ny)
        # change new coordinates
        nx += (player.direction == 6 ? 1 : player.direction == 4 ? -1 : 0)*pix
        ny += (player.direction == 2 ? 1 : player.direction == 8 ? -1 : 0)*pix
        # iterate through all events
        $game_map.events.each_value {|event|
            # if triggered by touch and trigger started the event
            if triggers.include?(event.trigger) &&
                event.check_event_trigger_at(nx, ny)
              # events were started
              result = true
            end}
      end
      # return result
      return result
    end
    #--------------------------------------------------------------------------
    # check_event_trigger_touch
    #  x - x-coordinate
    #  y - y-coordinate
    #  Checks if there are events that were triggered by touch. (pixel movement)
    #--------------------------------------------------------------------------
    def check_event_trigger_touch(x, y)
      # not started if already running
      return false if $game_system.map_interpreter.running?
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # initialize result
      result = false
      # iterate through all events
      $game_map.events.each_value {|event|
          # if triggered by touch and trigger started the event
          if Cache::TouchTrigger.include?(event.trigger) &&
              event.check_event_trigger_at(x, y)
            # events were started
            result = true
          end}
      # return result
      return result
    end
  end
  
end

module BlizzABS
  
  #============================================================================
  # BlizzABS::Trigger
  #----------------------------------------------------------------------------
  #  This class provides a data interface for AI Trigger data packs.
  #============================================================================
  
  class Trigger
    
    # setting all accessible variables
    attr_accessor :activator
    attr_accessor :condition
    attr_accessor :comparator
    attr_accessor :value
    attr_accessor :action_type
    attr_accessor :action_data
    attr_accessor :target
    #--------------------------------------------------------------------------
    # Initialization
    #  activator   - the battler type that activates the trigger
    #  condition   - conditional operand A
    #  comparator  - comparison operator
    #  value       - conditional operand B
    #  action_type - action type
    #  action_data - data supporting the action type
    #  target      - target type
    #--------------------------------------------------------------------------
    def initialize(activator = TRGLeader, condition = TRGHP,
                   comparator = TRGEqual, value = 100, action_type = TRGAttack,
                   action_data = 0, target = TRGTargetDefault)
      @activator = activator
      @condition = condition
      @comparator = comparator
      @value = value
      @action_type = action_type
      @action_data = action_data
      @target = target
    end
    #--------------------------------------------------------------------------
    # battler_activator?
    #  Checks if the trigger is activated by a battler type.
    #--------------------------------------------------------------------------
    def battler_activator?
      return (@activator != TRGProbability)
    end
    #--------------------------------------------------------------------------
    # get_a_target
    #  char    - the hosting actor
    #  targets - possible targets
    #  Checks the condition of the trigger with the given targets and returns
    #  the chosen target.
    #--------------------------------------------------------------------------
    def get_a_target(char, targets)
      # check trigger condition
      case @condition
      when TRGHP # HP condition
        # for each possible target
        targets.each {|b|
            # get comparator string
            comparator = Cache::TRGComparators[@comparator]
            # evaluate condition
            if eval("b.battler.hp * 100 / b.battler.maxhp #{comparator} @value")
              # this target fulfills the condition
              return b
            end}
      when TRGSP # SP condition
        # for each possible target
        targets.each {|b|
            # get comparator string
            comparator = Cache::TRGComparators[@comparator]
            # evaluate condition
            if eval("b.battler.sp * 100 / b.battler.maxsp #{comparator} @value")
              # this target fulfills the condition
              return b
            end}
      when TRGState # State condition
        # if no state condition
        if @value == 0
          # find a target that has no states
          targets.each {|b| return b if b.battler.states.size == 0}
        else
          # find a target with the condition state
          targets.each {|b| return b if b.battler.states.include?(@value)}
        end
      when TRGLocation # Location condition
        # temporary variable
        pix = $BlizzABS.pixel
        # sort all targets by relative distance ascending
        targets.sort! {|a, b|
            Math.hypot(char.x / pix - a.x / pix, char.y / pix - a.y / pix) <=>
            Math.hypot(char.x / pix - b.x / pix, char.y / pix - b.y / pix)}
        # return the requested battler
        return case @value
        when TRGClosest then targets[0]
        when TRGFarthest then targets[targets.size - 1]
        end
      end
      # this trigger has not been activated
      return nil
    end
    
  end
  
  #============================================================================
  # BlizzABS::Action
  #----------------------------------------------------------------------------
  #  This class provides a data interface for action data packs.
  #============================================================================
  
  class Action
    
    # setting all accessible variables
    attr_accessor :range
    attr_accessor :kind
    attr_accessor :id
    attr_accessor :type
    attr_accessor :delay
    #--------------------------------------------------------------------------
    # Initialization
    #  range - range of the action
    #  kind  - action kind
    #  id    - action id
    #  type  - action type
    #  delay - delay time
    #--------------------------------------------------------------------------
    def initialize(range = 0, kind = 0, id = 0, type = 0, delay = 0)
      set(range, kind, id, type, delay)
    end
    #--------------------------------------------------------------------------
    # set
    #  range - range of the action
    #  kind  - action kind
    #  id    - action id
    #  type  - action type
    #  delay - delay time
    #  Sets all action's parameters at once.
    #--------------------------------------------------------------------------
    def set(range = 0, kind = 0, id = 0, type = 0, delay = 0)
      @range = range
      @kind = kind
      @id = id
      @type = type
      @delay = delay
    end
    #--------------------------------------------------------------------------
    # valid?
    #  Checks if the action is actually an action.
    #--------------------------------------------------------------------------
    def valid?
      return (@kind != ACTNone)
    end
    #--------------------------------------------------------------------------
    # basic?
    #  Checks if the action is a basic action.
    #--------------------------------------------------------------------------
    def basic?
      return (attack? || defend? || escape?)
    end
    #--------------------------------------------------------------------------
    # attack?
    #  Checks if the action is an attack.
    #--------------------------------------------------------------------------
    def attack?
      return (@kind == ACTAttack)
    end
    #--------------------------------------------------------------------------
    # defend?
    #  Checks if the action is a defending action.
    #--------------------------------------------------------------------------
    def defend?
      return (@kind == ACTDefend)
    end
    #--------------------------------------------------------------------------
    # escape?
    #  Checks if the action is an escaping action.
    #--------------------------------------------------------------------------
    def escape?
      return (@kind == ACTEscape)
    end
    #--------------------------------------------------------------------------
    # skill?
    #  Checks if the action is a skill.
    #--------------------------------------------------------------------------
    def skill?
      return (@kind == ACTSkill)
    end
    #--------------------------------------------------------------------------
    # item?
    #  Checks if the action is an item use.
    #--------------------------------------------------------------------------
    def item?
      return (@kind == ACTItem)
    end
    #--------------------------------------------------------------------------
    # ready?
    #  Checks if the action is ready to be executed.
    #--------------------------------------------------------------------------
    def ready?
      return (@delay <= 0)
    end
    
  end
  
  #============================================================================
  # BlizzABS::ChargeData
  #----------------------------------------------------------------------------
  #  This class provides a data interface for action charges.
  #============================================================================
  
  class ChargeData
    
    # setting all accessible variables
    attr_accessor :type
    attr_accessor :time
    attr_accessor :action
    attr_accessor :id
    #--------------------------------------------------------------------------
    # Initialization
    #  type   - charge type
    #  time   - time to charge up
    #  action - action type
    #  id     - action ID
    #--------------------------------------------------------------------------
    def initialize(type, time, action, id)
      @type, @time, @action, @id = type, time, action, id
    end
    #--------------------------------------------------------------------------
    # charged?
    #  Checks if the action has been charged.
    #--------------------------------------------------------------------------
    def charged?
      return (@time <= 0)
    end
    
  end
  
  #============================================================================
  # BlizzABS::MemoryData
  #----------------------------------------------------------------------------
  #  This class provides a data interface for enemy memory data about other
  #  battlers one the map.
  #============================================================================
  
  class MemoryData
    
    # setting all accessible variables
    attr_accessor :x
    attr_accessor :y
    #--------------------------------------------------------------------------
    # Initialization
    #  x    - x-coordinate of memorized battler
    #  y    - y-coordinate of memorized battler
    #--------------------------------------------------------------------------
    def initialize(x, y)
      @x, @y = x, y
    end
    
  end
  
  #============================================================================
  # BlizzABS::ObserveData
  #----------------------------------------------------------------------------
  #  This class provides a data interface for observation logs.
  #============================================================================
  
  class ObserveData
    
    # setting all accessible variables
    attr_accessor :damage
    attr_accessor :time
    #--------------------------------------------------------------------------
    # Initialization
    #  damage - the damage value
    #  time   - the moment in time when the damage was done
    #--------------------------------------------------------------------------
    def initialize(damage, time)
      @damage, @time = damage, time
    end
    
  end
  
  #============================================================================
  # BlizzABS::DamageRequest
  #----------------------------------------------------------------------------
  #  This class provides a data interface for damage sprite requests.
  #============================================================================
  
  class DamageRequest
    
    # setting all accessible variables
    attr_reader :x
    attr_reader :y
    attr_reader :damage
    attr_reader :critical
    attr_reader :color
    attr_reader :width
    attr_reader :height
    #--------------------------------------------------------------------------
    # Initialization
    #  char     - reference character for position
    #  damage   - the damage value
    #  color    - damage text color
    #  critical - critical flag
    #--------------------------------------------------------------------------
    def initialize(char, damage, color, critical = false)
      # set coordinates
      @x, @y = char.real_x / 4 + 16, char.real_y / 4 + 16
      # set damage text value
      @damage = (damage.is_a?(Numeric) ? damage.abs.to_s : damage.to_s)
      # set color and critical flag
      @color, @critical = color, critical
      # create dummy bitmap
      bitmap = Bitmap.new(1, 1)
      # set font
      bitmap.font.name = Cache::FontNameDamage
      # set font size
      bitmap.font.size = Cache::FontSizeDamage
      # get size rectangle
      size_rect = bitmap.text_size(@damage)
      # get text width and height
      @width, @height = (size_rect.width + 4) / 2 * 2, size_rect.height
      @width = 1 if @width < 1
      @height = 1 if @height < 1
    end
    
  end
  
  #============================================================================
  # BlizzABS::PathRequest
  #----------------------------------------------------------------------------
  #  This class provides a data interface for path requests.
  #============================================================================
  
  class PathRequest
    
    # setting all accessible variables
    attr_reader :open
    attr_reader :closed
    attr_reader :sx
    attr_reader :sy
    attr_reader :tx
    attr_reader :ty
    #--------------------------------------------------------------------------
    # Initialization
    #  ox - real x-coordinate of starting point
    #  oy - real y-coordinate of starting point
    #  tx - x-coordinate of target point
    #  ty - y-coordinate of target point
    #--------------------------------------------------------------------------
    def initialize(ox, oy, tx, ty)
      # pixel movement rate
      pix = $BlizzABS.pixel
      # coordinates
      @sx, @sy, @tx, @ty = ox / pix, oy / pix, tx / pix, ty / pix
      # additional data
      @x_off, @y_off = ox - @sx * pix, oy - @sy * pix
      # nodes yet to check
      @open = {[@sx, @sy] => -1}
      # checked nodes
      @closed = Table.new($game_map.width, $game_map.height)
    end
    #--------------------------------------------------------------------------
    # backtrack
    #  Finds the way back from the target to the start to create a path.
    #--------------------------------------------------------------------------
    def backtrack
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # current x, y, target x, y and resulting path
      cx, cy, x, y, result = @tx, @ty, 0, 0, []
      # find the way back from destination to start
      loop do
        # change current coordinates
        cx, cy = cx - x, cy - y
        # stop if reached corrected start position
        break if cx == @sx && cy == @sy
        # add movement command
        pix.times {result.unshift(Cache::TDirs[@closed[cx, cy]])}
        # track back next node
        x, y = Cache::DirOffsets[@closed[cx, cy]]
      end
      # modify found path if pixel movement is being used
      modify(result) if pix > 1
      # return result
      return result
    end
    #--------------------------------------------------------------------------
    # modify
    #  result - found path
    #  Modifies the path so it works with pixel movement
    #--------------------------------------------------------------------------
    def modify(result)
      # add correction movement commands for x and y
      @x_off.times {result.unshift(Cache::TDirs[4])}
      @y_off.times {result.unshift(Cache::TDirs[8])}
      # stop if not using 8 way movement
      return if !$game_system._8_way
      # add diagonal moving commands at positions where possible
      result.each_index {|i|
          # if both exist
          if result[i] != nil && result[i + 1] != nil
            # exchange of corner commands
            case [result[i][0], result[i + 1][0]]
            when Cache::DirDownLeft, Cache::DirLeftDown
              result[i], result[i + 1] = Cache::TDirs[1], nil
            when Cache::DirDownRight, Cache::DirRightDown
              result[i], result[i + 1] = Cache::TDirs[3], nil
            when Cache::DirLeftUp, Cache::DirUpLeft
              result[i], result[i + 1] = Cache::TDirs[7], nil
            when Cache::DirRightUp, Cache::DirUpRight
              result[i], result[i + 1] = Cache::TDirs[9], nil
            end
          end}
      # remove nils
      result.compact!
    end
    
  end
  
  #============================================================================
  # BlizzABS::AlignmentData
  #----------------------------------------------------------------------------
  #  This class provides a data interface for alignment groups.
  #============================================================================
  
  class AlignmentData
    
    # setting all accessible variables
    attr_accessor :id
    attr_accessor :enemies
    attr_accessor :allies
    attr_accessor :neutral
    #--------------------------------------------------------------------------
    # Initialization
    #--------------------------------------------------------------------------
    def initialize(id)
      @id = id
      @enemies = BlizzABS::Alignments.enemies(id)
      @allies = BlizzABS::Alignments.allies(id)
      @neutral = BlizzABS::Alignments.neutral(id)
    end
    #--------------------------------------------------------------------------
    # enemy?
    #  id - group ID
    #  Checks if a group is an enemy.
    #--------------------------------------------------------------------------
    def enemy?(id)
      return @enemies.include?(id)
    end
    #--------------------------------------------------------------------------
    # ally?
    #  id - group ID
    #  Checks if a group is an ally.
    #--------------------------------------------------------------------------
    def ally?(id)
      return @allies.include?(id)
    end
    #--------------------------------------------------------------------------
    # neutral?
    #  id - group ID
    #  Checks if a group is always neutral.
    #--------------------------------------------------------------------------
    def neutral?(id)
      return @neutral.include?(id)
    end
    
  end
  
end

module BlizzABS
  
  #============================================================================
  # BlizzABS::Controls
  #----------------------------------------------------------------------------
  #  This class handles player input for battle on the map.
  #============================================================================
  
  class Controls
    
    attr_accessor :down_key
    attr_accessor :left_key
    attr_accessor :right_key
    attr_accessor :up_key
    attr_accessor :confirm_key
    attr_accessor :cancel_key
    attr_accessor :attack_key
    attr_accessor :prevpage_key
    attr_accessor :nextpage_key
    attr_accessor :defend_key
    attr_accessor :skill_key
    attr_accessor :item_key
    attr_accessor :select_key
    attr_accessor :hud_key
    attr_accessor :minimap_key
    attr_accessor :hotkey_key
    attr_accessor :run_key
    attr_accessor :sneak_key
    attr_accessor :jump_key
    attr_accessor :turn_key
    
    #--------------------------------------------------------------------------
    # update
    #  Processes the player's input.
    #--------------------------------------------------------------------------
    def update
      # if not allowed to act
      if !$game_temp.in_battle || $game_player.jumping? ||
          $game_player.freeze_action || $game_player.move_route_forcing ||
          $game_player.in_action > 0 && !$game_player.ai.act.defend? ||
          !$game_player.valid?
        # freeze battle controls
        return
      end
      # stop update if defending
      return if update_defend
      # if defending before
      if $game_player.ai.act.defend?
        # override defending reset
        $game_player.ai.act.set
        # reset action
        $game_player.reset_action
        # reset sprites
        $game_player.reset_sprites
      end
      # stop update if attacking
      return if update_attack
      # stop update if using skill
      return if update_skill
      # stop update if using item
      return if update_item
    end
    #--------------------------------------------------------------------------
    # update_defend
    #  Processes the player's defend input.
    #--------------------------------------------------------------------------
    def update_defend
      # continue input update if defend button not pressed
      return false if !self.check_defend_condition?
      # player defends
      $game_player.use_defend
      # setup action data
      $game_player.ai.act.set(0, BlizzABS::ACTDefend, 0, 0, 1)
      # stop input update
      return true
    end
    #--------------------------------------------------------------------------
    # update_attack
    #  Processes the player's attack input.
    #--------------------------------------------------------------------------
    def update_attack
      # continue input update if attack should not be used
      return false if !self.check_attack_condition?
      # if attack not successful
      if !$game_player.use_attack
        # play buzzer, can't use
        $game_system.se_play($data_system.buzzer_se)
      end
      # stop input update
      return true
    end
    #--------------------------------------------------------------------------
    # update_skill
    #  Processes the player's skill input.
    #--------------------------------------------------------------------------
    def update_skill
      # continue input update if skill should be used
      return false if !self.check_skill_condition?
      # if skill not usable or skill use process not executed and no selection
      if $game_player.battler.skill == 0 ||
          !$game_player.use_skill($data_skills[$game_player.battler.skill]) &&
          $game_temp.select_data == nil
        # play buzzer, can't use
        $game_system.se_play($data_system.buzzer_se)
      end
      # stop input update
      return true
    end
    #--------------------------------------------------------------------------
    # update_item
    #  Processes the player's item input.
    #--------------------------------------------------------------------------
    def update_item
      # continue input if item should be used
      return false if !self.check_item_condition?
      # if item not usable or item use process not executed and no selection
      if $game_player.battler.item == 0 ||
          !$game_player.use_item($data_items[$game_player.battler.item]) &&
          $game_temp.select_data == nil
        # play buzzer, can't use
        $game_system.se_play($data_system.buzzer_se)
      end
      # stop input update
      return true
    end
    #--------------------------------------------------------------------------
    # check_defend_condition?
    #  Checks whether defend should be executed or not.
    #--------------------------------------------------------------------------
    def check_defend_condition?
      # defend button enabled and defend button is pressed
      return ($game_system.defend_button && Input.press?(Input::Defend))
    end
    #--------------------------------------------------------------------------
    # check_attack_condition?
    #  Checks whether attack should be executed or not.
    #--------------------------------------------------------------------------
    def check_attack_condition?
      # attack button enabled and attack button is pressed
      return ($game_system.attack_button && Input.trigger?(Input::Attack))
    end
    #--------------------------------------------------------------------------
    # check_skill_condition?
    #  Checks whether a skill should be executed or not.
    #--------------------------------------------------------------------------
    def check_skill_condition?
      # disallow usage if skill button disabled
      return false if !$game_system.skill_button
      # disallow usage
      skill_condition = false
      # if using direct hotkeys
      if BlizzABS::Config::DIRECT_HOTKEYS
        # check direct hotkeys
        skill_condition = self.skill_hotkeys?
      # if skill button pressed
      elsif Input.trigger?(Input::Skill)
        # allow usage
        skill_condition = true
      end
      # return result
      return skill_condition
    end
    #--------------------------------------------------------------------------
    # check_item_condition?
    #  Checks whether a item should be executed or not.
    #--------------------------------------------------------------------------
    def check_item_condition?
      # disallow usage if item button disabled
      return false if !$game_system.item_button
      # disallow usage
      item_condition = false
      # if using direct hotkeys
      if BlizzABS::Config::DIRECT_HOTKEYS
        # check direct hotkeys
        item_condition = self.item_hotkeys?
      # if item button pressed
      elsif Input.trigger?(Input::Item)
        # allow usage
        item_condition = true
      end
      # return result
      return item_condition
    end
    #--------------------------------------------------------------------------
    # skill_hotkeys?
    #  Checks direct hotkey usage for skills.
    #--------------------------------------------------------------------------
    def skill_hotkeys?
      # find all triggered keys
      triggered = BlizzABS::Cache::Keys.find_all {|i|
          Input.trigger?(Input::Key[i.to_s]) &&
          $game_player.skill_hotkeys[i] != 0}
      # no usage if usage invalid
      return false if triggered.size == 0
      # set as usable item
      $game_player.battler.skill = $game_player.skill_hotkeys[triggered[0]]
      # allow usage
      return true
    end
    #--------------------------------------------------------------------------
    # item_hotkeys?
    #  Checks direct hotkey usage for item.
    #--------------------------------------------------------------------------
    def item_hotkeys?
      # find all triggered keys
      triggered = BlizzABS::Cache::Keys.find_all {|i|
          Input.trigger?(Input::Key[i.to_s]) &&
          $game_player.item_hotkeys[i] != 0}
      # no usage if usage invalid
      return false if triggered.size == 0
      # set as usable item
      $game_player.battler.item = $game_player.item_hotkeys[triggered[0]]
      # allow usage
      return true
    end
    
  end
  
end

module BlizzABS
  
  #============================================================================
  # BlizzABS::Utility
  #----------------------------------------------------------------------------
  #  This class provides methods for Blizz-ABS's additional capabilities that
  #  can't be categorized elsewhere.
  #============================================================================
  
  class Utility
    
    # constants
    SQRT_2 = Math.sqrt(2)
    
    #--------------------------------------------------------------------------
    # get_weapon_area
    #  ch   - map character
    #  d    - distance
    #  type - area affection type
    #  Returns area data for the given character, range and type.
    #--------------------------------------------------------------------------
    def get_attack_area(ch, d, type)
      return case type
      when SWORD then get_circle_area(ch, d, ch.direction)
      when SPEAR then get_front_area(ch, d)
      when FLAIL then get_skipped_front_area(ch, d)
      when BOOMERANG, BOW, BOW_ARROW, SHURIKEN then get_projectile_area(ch, d)
      end
    end
    #--------------------------------------------------------------------------
    # get_skillitem_area
    #  ch    - map character
    #  d     - distance
    #  type  - area affection type
    #  scope - object scope
    #  Returns area data for the given character, range and type.
    #--------------------------------------------------------------------------
    def get_skillitem_area(ch, d, type, scope)
      # all flag
      all = (scope == 2 || scope == 4 || scope == 6)
      # if circle skill
      if type == HOMING || type == DIRECT || type != SHOOT &&
          type != BEAM && all
        # create circle area
        area = get_circle_area(ch, d)
      # if fullscreen skill
      elsif type == BEAM && all
        # create fullscreen rectangle shape
        area = get_fullscreen_area
      # if beam
      elsif type == BEAM
        # determine affection area depending on facing direction for beam area
        area = get_front_area(ch, d)
      else
        # create affection area rectangle for projectiles
        area = get_projectile_area(ch, d)
      end
      # return result
      return area
    end
    #--------------------------------------------------------------------------
    # get_circle_area
    #  ch  - map character
    #  d   - distance
    #  dir - direction of the circle slice if necessary
    #  Returns area data for the given character and range for circle area.
    #--------------------------------------------------------------------------
    def get_circle_area(ch, d, dir = 0)
      return Circle.new(ch.real_x / 4 + 16, ch.real_y / 4 + 16, d * 32, dir)
    end
    #--------------------------------------------------------------------------
    # get_projectile_area
    #  ch - map character
    #  d  - distance
    #  Returns area data for the given character and range for projectiles.
    #--------------------------------------------------------------------------
    def get_projectile_area(ch, d)
      return case ch.direction
      when 2 then Rect.new(ch.real_x / 4 + 8, ch.real_y / 4 + 16, 16, d * 32)
      when 4 then Rect.new(ch.real_x / 4 + 16 - d * 32, ch.real_y / 4 + 8, d * 32, 16)
      when 6 then Rect.new(ch.real_x / 4 + 16, ch.real_y / 4 + 8, d * 32, 16)
      when 8 then Rect.new(ch.real_x / 4 + 8, ch.real_y / 4 + 16 - d * 32, 16, d * 32)
      end
    end
    #--------------------------------------------------------------------------
    # get_projectile_hit_area
    #  ch - projectile character
    #  Returns area data for the given projectile.
    #--------------------------------------------------------------------------
    def get_projectile_hit_area(ch)
      pix = $BlizzABS.pixel
      return case ch.direction
      when 2
        Rect.new(ch.real_x / 4 + 8, ch.real_y / 4 + 8, 16, ch.y * 32 / pix - ch.real_y / 4 + 24)
      when 4
        Rect.new(ch.x * 32 / pix + 8, ch.y * 32 / pix + 8, ch.real_x / 4 - ch.x * 32 / pix + 24, 16)
      when 6
        Rect.new(ch.real_x / 4 + 8, ch.real_y / 4 + 8, ch.x * 32 / pix-ch.real_x / 4 + 24, 16)
      when 8
        Rect.new(ch.x * 32 / pix + 8, ch.y * 32 / pix + 8, 16, ch.real_y / 4 - ch.y * 32 / pix + 24)
      end
    end
    #--------------------------------------------------------------------------
    # get_front_area
    #  ch - map character
    #  d  - distance
    #  Returns area data for the given character and range of the front area.
    #--------------------------------------------------------------------------
    def get_front_area(ch, d)
      return case ch.direction
      when 2 then Rect.new(ch.real_x / 4, ch.real_y / 4 + 16, 32, d * 32)
      when 4 then Rect.new(ch.real_x / 4 + 16 - d * 32, ch.real_y / 4, d * 32, 32)
      when 6 then Rect.new(ch.real_x / 4 + 16, ch.real_y / 4, d * 32, 32)
      when 8 then Rect.new(ch.real_x / 4, ch.real_y / 4 + 16 - d * 32, 32, d * 32)
      end
    end
    #--------------------------------------------------------------------------
    # get_skipped_front_area
    #  ch - map character
    #  d  - distance
    #  Returns area data for the given character and range of second half of
    #  the front area.
    #--------------------------------------------------------------------------
    def get_skipped_front_area(ch, d)
      return case ch.direction
      when 2 then Rect.new(ch.real_x / 4, ch.real_y / 4 + 16 + d * 16, 32, d * 16)
      when 4 then Rect.new(ch.real_x / 4 + 16 - d * 32, ch.real_y / 4, d * 16, 32)
      when 6 then Rect.new(ch.real_x / 4 + 16 + d * 16, ch.real_y / 4, d * 16, 32)
      when 8 then Rect.new(ch.real_x / 4, ch.real_y / 4 + 16 - d * 32, 32, d * 16)
      end
    end
    #--------------------------------------------------------------------------
    # get_fullscreen_area
    #  Returns area data for the entire screen.
    #--------------------------------------------------------------------------
    def get_fullscreen_area
      return Rect.new($game_map.display_x / 4, $game_map.display_y / 4, 640, 480)
    end
    #--------------------------------------------------------------------------
    # get_scope_data
    #  scope - the targeting scope
    #  Returns the data for scopes "enemy, dead, all".
    #--------------------------------------------------------------------------
    def get_scope_data(scope)
      return case scope
      when 0 then [false, false, false]
      when 1 then [true, false, false]
      when 2 then [true, false, true]
      when 3 then [false, false, false]
      when 4 then [false, false, true]
      when 5 then [false, true, false]
      when 6 then [false, true, true]
      when 7 then [false, false, false]
      else
        [false, false, false]
      end
    end
    #--------------------------------------------------------------------------
    # get_player_radius
    #  Returns the distance of the farthest point from the player on the
    #  screen.
    #--------------------------------------------------------------------------
    def get_player_radius
      # if in the right half of the screen
      if $game_player.screen_x > 320
        # get screen x
        x_max = $game_player.screen_x
      else
        # get other screen x
        x_max = 640 - $game_player.screen_x
      end
      # if in the lower half of the screen
      if $game_player.screen_y > 240
        # get screen y
        y_max = $game_player.screen_y
      else
        # get other screen y
        y_max = 480 - $game_player.screen_y
      end
      # return distance
      return Math.hypot(x_max, y_max) / 32
    end
    #--------------------------------------------------------------------------
    # get_damage_data
    #  battler - battler or direct damage string
    #  Returns an array of colors for each damage sprite.
    #--------------------------------------------------------------------------
    def get_damage_data(battler)
      # if not a battler
      if !battler.is_a?(Game_Battler)
        # if a color exists for this object
        if Cache::DMGColors.has_key?(battler)
          # return color and string
          return [[Cache::DMGColors[battler]], [battler.to_s]]
        else
          # return color and string
          return [[Cache::DMGColors['Default']], [battler.to_s]]
        end
      end
      # if color cache exists
      if Cache::DMGColors.has_key?(battler.damage)
        # get color
        colors = [Cache::DMGColors[battler.damage]]
        # get string
        damages = [battler.damage.to_s]
      # normal damage
      elsif battler.damage.is_a?(Numeric)
        # no colors and no strings
        colors, damages = [], []
      else
        # default color
        colors = [Cache::DMGColors['Default']]
        # get string
        damages = [battler.damage.to_s]
      end
      # color key sign
      sign = (battler.is_a?(Game_Enemy) ? 'E' : 'A')
      # if HP change
      if battler.hpdamage != 0
        # if critical
        if battler.critical
          # critical damage color
          colors.push(Cache::DMGColors['Critical'])
        # if losing HP
        elsif battler.hpdamage > 0
          # normal color
          colors.push(Cache::DMGColors['HP-' + sign])
        elsif battler.hpdamage < 0
          # normal color
          colors.push(Cache::DMGColors['HP+' + sign])
        end
        # create damage for HP change
        damages.push(battler.hpdamage.abs.to_s)
      end
      # if SP change
      if battler.spdamage != 0
        # if critical
        if battler.critical
          # critical damage color
          colors.push(Cache::DMGColors['Critical'])
        # if losing SP
        elsif battler.spdamage > 0
          # normal color
          colors.push(Cache::DMGColors['SP-' + sign])
        # if restoring SP
        elsif battler.spdamage < 0
          # normal color
          colors.push(Cache::DMGColors['SP+' + sign])
        end
        # create damage for SP change
        damages.push("#{battler.spdamage.abs} #{$data_system.words.sp}")
      end
      # return colors
      return [colors, damages]
    end
    #--------------------------------------------------------------------------
    # request_damage_sprite
    #  char - map character
    #  Requests a sprite for damage display.
    #--------------------------------------------------------------------------
    def request_damage_sprite(char, damage = nil)
      # if map battler
      if damage != nil
        # get damage text colors and strings
        colors, damages = self.get_damage_data(damage)
      else
        # get damage text colors and strings
        colors, damages = self.get_damage_data(char.battler)
      end
      # for each existing color
      colors.each_index {|i|
          # create one damage sprite request
          $BlizzABS.cache.damages.push(DamageRequest.new(char, damages[i],
              colors[i], char.battler.critical))}
    end
    #----------------------------------------------------------------------------
    # reset_alignment_group
    #  id - group ID
    #  Resets the given alignment groups setup to default.
    #----------------------------------------------------------------------------
    def reset_alignment_group(id)
      # create new alignment data
      $game_system.alignments[id] = BlizzABS::AlignmentData.new(id)
      # for all battlers of this group on the map
      $game_map.battlers_group(id).each {|b|
          # reset the alignment setup
          b.ai.setup_group(id)
          # delete moving commands
          b.force_move = []
          # reset the alignment setup
          b.reset_action}
    end
    #--------------------------------------------------------------------------
    # display_levelup
    #  actor - the actor that leveled up.
    #  Creates a damage sprite request for level up display.
    #--------------------------------------------------------------------------
    def display_levelup(actor)
      # get damage text colors and strings
      colors, damages = self.get_damage_data(Cache::TXTLvlUp)
      # for each existing color
      colors.each_index {|i|
          # create one damage sprite request
          $BlizzABS.cache.damages.push(DamageRequest.new(actor, damages[i],
              colors[i]))}
    end
    #--------------------------------------------------------------------------
    # intersection
    #  shape - either rectangle or a data array with circle data
    #  rect  - rectangle
    #  Processes and test intersection of rectangles, a rectangle with a full
    #  circle and a rectangle with a fourth of a circle in which the user of an
    #  attack/skill/item is facing. The shapes get tested on whether at least
    #  one point of the rectangle is within the shape and if not, then this
    #  method checks whether the shape's characteristic lines determined by the
    #  center points and a few point on the borders intersect with the
    #  rectangle. This polygon intersection determination is a simplified
    #  version, sufficient for Blizz-ABS that needs less CPU time than a full
    #  determination algorithm.
    #--------------------------------------------------------------------------
    def intersection(shape, rect)
      # if both are rectangles return rectangle intersection result
      return rect_intersection(shape, rect) if shape.is_a?(Rect)
      # temporary variables
      x, y, r, d = shape.x, shape.y, shape.radius, shape.direction
      # iterate through all of rectangle's points
      [rect.x, rect.x+rect.width-1].each {|i| [rect.y, rect.y+rect.height-1].each {|j|
          # if within special circle radius
          if Math.hypot(x - i, y - j) < r ||
              Math.hypot(x - i - 1, y - j) < r ||
              Math.hypot(x - i, y - j - 1) < r ||
              Math.hypot(x - i - 1, y - j - 1) < r
            case d
            when 2 then return true if j - y >= 0 && i - x <= j - y && x - i - 1 <= j - y
            when 4 then return true if x - i - 1 >= 0 && j - y <= x - i - 1 && y - j - 1 <= x - i - 1
            when 6 then return true if i - x >= 0 && j - y <= i - x && y - j - 1 <= i - x
            when 8 then return true if y - j -1 >= 0 && i - x <= y - j - 1 && x - i - 1 <= y - j - 1
            else
              # full circle, intersection exists
              return true
            end
          end}}
      # initialize arrays
      rects, coos, rad = [], [], (r / SQRT_2).to_i
      # radius line end coordinates and rectangles depending on which circle part
      case d
      when 2
        coos.push([x - 1 - rad, y + rad])
        coos.push([2 * x - coos[0][0] - 1, coos[0][1]])
        rects.push(Rect.new(x - 1, y, 2, r))
      when 4
        coos.push([x - 1 - rad, y - 1 - rad])
        coos.push([coos[0][0], 2 * y - coos[0][1] - 1])
        rects.push(Rect.new(x - r, y - 1, r, 2))
      when 6
        coos.push([x+rad.to_i, y - 1 - rad])
        coos.push([coos[0][0], 2 * y - coos[0][1] - 1])
        rects.push(Rect.new(x, y - 1, r, 2))
      when 8
        coos.push([x - 1 - rad, y - 1 - rad])
        coos.push([2 * x - coos[0][0] - 1, coos[0][1]])
        rects.push(Rect.new(x - 1, y - r, 2, r))
      else
        rects.push(Rect.new(x - 1, y, 2, r), Rect.new(x - r - 1, y - 1, r, 2),
            Rect.new(x, y - 1, r, 2), Rect.new(x - 1, y - r - 1, 2, r))
      end
      # intersection exists if intersecting with any of the radius rectangles
      return true if rects.any? {|rec| rect_intersection(rect, rec)}
      # rectangle's border lines
      top_left = [rect.x, rect.y]
      bottom_right = [rect.x + rect.width - 1, rect.y + rect.height - 1]
      bottom_left = [rect.x, rect.y + rect.height - 1]
      top_right = [rect.x + rect.width - 1, rect.y]
      # iterate through rectangle's border lines
      [top_left, bottom_right].each {|i| [bottom_left, top_right].each {|j|
          # iterate through the characteristic lines
          coos.each {|c|
              # if borderline of rectangle intersects with diagonal radius line
              if line_intersection(i[0], i[1], j[0], j[1], c[0], c[1], x, y)
                # intersection exists
                return true
              end}}}
      # intersection does not exist
      return false
    end
    #--------------------------------------------------------------------------
    # rect_intersection
    #  r1 - rectangle 1
    #  r2 - rectangle 2
    #  Quickly determines intersection of two rectangles. It is faster than the
    #  algorithm to determine line intersection as both rectangles are always
    #  rectangles with a rotation angle of 0, 90, 180 or 270.
    #--------------------------------------------------------------------------
    def rect_intersection(r1, r2)
      return (r1.x + r1.width > r2.x && r1.x < r2.x + r2.width &&
              r1.y + r1.height > r2.y && r1.y < r2.y + r2.height)
    end
    #--------------------------------------------------------------------------
    # line_intersection
    #  x1 - x-coordinate of the line 1's first point
    #  y1 - y-coordinate of the line 1's first point
    #  x1 - x-coordinate of the line 1's second point
    #  y1 - y-coordinate of the line 1's second point
    #  x1 - x-coordinate of the line 2's first point
    #  y1 - y-coordinate of the line 2's first point
    #  x1 - x-coordinate of the line 2's second point
    #  y1 - y-coordinate of the line 2's second point
    #  Uses a quick algorithm to test whether two lines intersect.
    #--------------------------------------------------------------------------
    def line_intersection(x1, y1, x2, y2, x3, y3, x4, y4)
      # calculate vector products
      d1 = (x3 - x1) * (y4 - y1) - (x4 - x1) * (y3 - y1)
      d2 = (x3 - x2) * (y4 - y2) - (x4 - x2) * (y3 - y2)
      d3 = (x1 - x3) * (y2 - y3) - (x2 - x3) * (y1 - y3)
      d4 = (x1 - x4) * (y2 - y4) - (x2 - x4) * (y1 - y4)
      # check vector product results
      if (d1 > 0 && d2 < 0 || d1 < 0 && d2 > 0) &&
          (d3 > 0 && d4 < 0 || d3 < 0 && d4 > 0)
        # intersection exists
        return true
      end
      # if at least one point of one line lies on the other line
      if d1 == 0 && (x3 < x4 ? x3 : x4) <= x1 && x1 <= (x3 > x4 ? x3 : x4) &&
                     (y3 < y4 ? y3 : y4) <= y1 && y1 <= (y3 > y4 ? y3 : y4) ||
          d2 == 0 && (x3 < x4 ? x3 : x4) <= x2 && x2 <= (x3 > x4 ? x3 : x4) &&
                     (y3 < y4 ? y3 : y4) <= y2 && y2 <= (y3 > y4 ? y3 : y4) ||
          d3 == 0 && (x1 < x2 ? x1 : x2) <= x3 && x3 <= (x1 > x2 ? x1 : x2) &&
                     (y1 < y2 ? y1 : y2) <= y3 && y3 <= (y1 > y2 ? y1 : y2) ||
          d4 == 0 && (x1 < x2 ? x1 : x2) <= x4 && x4 <= (x1 > x2 ? x1 : x2) &&
                     (y1 < y2 ? y1 : y2) <= y4 && y4 <= (y1 > y2 ? y1 : y2)
        # intersection exists
        return true
      end
      # intersection does not exist
      return false
    end
    #--------------------------------------------------------------------------
    # range_array_union
    #  a - this array of intervals
    #  b - other array of intervals
    #  Returns an array of time intervals that is the union of two other
    #  arrays. Both arrays' intervals are united.
    #--------------------------------------------------------------------------
    def range_array_union(a, b)
      # convert starting numbers to ranges
      a[a.size-1] = a[a.size-1]..Graphics.frame_count if a[a.size-1].is_a?(Numeric)
      b[b.size-1] = b[b.size-1]..Graphics.frame_count if b[b.size-1].is_a?(Numeric)
      # initialize indices
      i = j = 0
      # stop if either interval doesn't exist
      return if a[i] == nil || b[j] == nil
      # start iteration
      loop do
        # if both arrays' last element
        if a[i + 1] == nil && b[j + 1] == nil
          # if not intersecting intervals
          if a[i].first > b[j].last + 1 || b[j].first > a[i].last + 1
            # add both ranges sorted
            a[i].first < b[j].first ? a[i + 1] = b[j] : (a[i + 1], a[i] = a[i], b[j])
          else
            # get range borders
            min_pos = (a[i].first < b[j].first ? a[i].first : b[j].first)
            max_pos = (a[i].last > b[j].last ? a[i].last : b[j].last)
            # interval union is the last element
            a[i] = min_pos..max_pos
          end
          # abort iteration
          break
        # if no more elements in this array
        elsif a[i] == nil
          # add all elements from other array
          a += b[j, b.size - j]
          # abort iteration
          break
        # if no more elements in other array
        elsif b[j] == nil
          # abort iteration
          break
        # if other intervals is after this interval
        elsif b[j].first > a[i].last + 1
          # check next interval of this array
          i += 1
        # if array is after other array or other interval is within this one
        elsif a[i].first > b[j].last + 1
          # add other interval into this array
          a.insert(i, b[j])
          # check next interval of this array
          i += 1
          # check next interval of other array
          j += 1
        elsif a[i].first >= b[j].first && a[i].last <= b[j].last
          # check next interval of other array
          j += 1
        # if other interval starts before and ends before this interval
        elsif a[i].first < b[j].first && a[i].last > b[j].last
          # unite intervals
          a[i] = b[j].first..a[i].last
          # check next interval of other array
          j += 1
        # if other interval ends after this interval
        else
          # get range borders
          min_pos = (a[i].first < b[j].first ? a[i].first : b[j].first)
          # unite intervals
          a[i] = min_pos..b[j].last
          # as longs as intervals of this array intersect with this interval
          while a[i + 1] != nil && a[i].last + 1 >= a[i + 1].first
            # get range borders
            max_pos = (a[i].last > a[i + 1].last ? a[i].last : a[i + 1].last)
            # unite this interval and next interval of this array
            a[i] = a[i].first..max_pos
            # delete next interval of this array
            a.delete_at(i + 1)
          end
          # check next interval of other array
          j += 1
        end
      end
      # if last range is a converted start number
      if a.size > 0 && a[a.size - 1].last == Graphics.frame_count
        # convert back
        a[a.size - 1] = a[a.size - 1].first
      end
    end
    #--------------------------------------------------------------------------
    # closest_floor
    #  x - x start coordinate
    #  y - y start coordinate
    #  Finds the closest tile relative to the starting coordinates that does
    #  not have a terrain tag indicating that there is no floor beneath. If
    #  none is found, the method returns the starting coordinates.
    #--------------------------------------------------------------------------
    def closest_floor(x, y)
      # create mark table and pending array
      table, pending = Table.new($game_map.width, $game_map.height), [[x, y]]
      # as long as there are pending coordinates
      while pending.size > 0
        # current coordinates
        cx, cy = pending.shift
        # if floor beneath
        if !Config::NO_FLOOR_TAGS.include?($game_map.terrain_tag(cx, cy))
          # return found coordinates
          return [cx, cy]
        end
        # mark current coordinates as checked
        table[cx, cy] = 1
        # add tiles around current coordinates if they were not marked yet
        pending.push([cx, cy+1]) if table[cx, cy+1] == 0
        pending.push([cx-1, cy]) if table[cx-1, cy] == 0
        pending.push([cx+1, cy]) if table[cx+1, cy] == 0
        pending.push([cx, cy-1]) if table[cx, cy-1] == 0
      end
      return [x, y]
    end
    #--------------------------------------------------------------------------
    # get_actor_skills
    #  actor - the actor
    #  Safe method to return all skills that an actor can use. It's main
    #  purpose is overriding so other scripts (like CRLS) can add their own
    #  skill sets without changing vital parts of Blizz-ABS.
    #--------------------------------------------------------------------------
    def get_actor_skills(actor)
      return actor.skills.clone
    end
    #--------------------------------------------------------------------------
    # decode_triggers
    #  list - event commands list
    #  Returns specified custom event triggers.
    #--------------------------------------------------------------------------
    def get_triggers(list)
      # initialize
      triggers, special = [], {}
      # iteratre through all event commands
      (0...list.size).each {|i|
          # as long as they are comments
          break if list[i].code != 108
          # no ID
          id = nil
          # get the comment
          comment = list[i].parameters[0].clone
          # stop if not a trigger setup comment
          break if comment.gsub!('Trigger:') {''} == nil
          # get possible ID
          if comment.clone.gsub!(/=(\d+)/) {"$1"} != nil
            # remove the ID from the comment
            comment.gsub!(/=(\d+)/) {''}
            # get the ID
            id = $1.to_i
          end
          # get actual trigger number
          trigger = eval('BlizzABS::CET' + comment)
          # if special trigger
          if BlizzABS::CETSpecial.include?(trigger)
            # if no ID specified
            if id == nil
              # any ID trigger
              special[trigger] = []
            # if first trigger of this kind
            elsif !special.has_key?(trigger)
              # create this special trigger with the ID
              special[trigger] = [id]
            # if already ecisting
            elsif special[trigger].size > 0
              # add this ID
              special[trigger].push(id)
            end
          # if no normal trigger exists yet
          elsif triggers.size == 0
            # add the normal trigger
            triggers.push(trigger)
          end}
      # if not triggers specified
      if triggers.size == 0 && special.keys.size == 0
        # return default trigger
        return [BlizzABS::CETDefault, {}]
      end
      # add NONE trigger if no normal trigger exists
      triggers.push(BlizzABS::CETNone) if triggers.size == 0
      # remove duplicates
      special.each_key {|key| special[key] = (special[key] | special[key])}
      # add special triggers
      triggers.push(special)
      # return triggers
      return triggers
    end
    #--------------------------------------------------------------------------
    # add_weapon_text
    #  text - original text
    #  id   - weapon ID
    #  type - name or description
    #  Generates additional data display for weapons.
    #--------------------------------------------------------------------------
    def add_weapon_text(text, id, type)
      # return normal text if range is 0 or the option isn't for this type
      return text if Weapons.range(id) == 0
      # iterate through configuration
      Config::WEAPON_DATA_MODE.each_index {|i|
          # if current option was set up for this type
          if Config::WEAPON_DATA_MODE[i] == type
            # add extra information to result text
            case i
            when 0
              text += case Weapons.type(id)
              when SWORD then ' (Melee)'
              when SPEAR then ' (Thrusting)'
              when FLAIL then ' (Flail)'
              when BOOMERANG then ' (Returning Projectile)'
              when BOW then ' (Projectile)'
              when BOW_ARROW then ' (Shooter)'
              when SHURIKEN then ' (Throwing)'
              end
            when 1
              number = Weapons.range(id)
              number = 1 if number < 1
              text += " R: #{number}"
            end
          end}
      # return result text
      return text
    end
    #--------------------------------------------------------------------------
    # add_skill_text
    #  text - original text
    #  id   - skill ID
    #  type - name or description
    #  Generates additional data display for skills.
    #--------------------------------------------------------------------------
    def add_skill_text(text, id, type)
      # return normal text if range is 0 or the option isn't used for this type
      return text if Skills.range(id) == 0
      # get scope
      scope = $data_skills[id].scope
      # iterate through configuration
      Config::SKILL_DATA_MODE.each_index {|i|
          # if current option was set up for this type
          if Config::SKILL_DATA_MODE[i] == type
            # add extra information to result text
            case i
            when 0
              next if scope == 0 || scope == 7
              text += case Skills.type(id)[0]
              when SHOOT then Cache::ScopeOne.include?(scope) ? ' (Shooter)' : ' (Thruster)'
              when HOMING then Cache::ScopeOne.include?(scope) ? ' (Homing)' : ' (S. Homing)'
              when DIRECT then Cache::ScopeOne.include?(scope) ? ' (Selector)' : ' (Shockwave)'
              when BEAM then Cache::ScopeOne.include?(scope) ? ' (Beam)' : ' (Fullscreen)'
              when TRAP then ' (Trap)'
              when TIMED then ' (Timed)'
              when SUMMON then ' (Summoner)'
              end
            when 1 then text += ' (explodes)' if Skills.type(id)[1] > 0
            when 2
              number = Skills.range(id)
              number = 1.0 if number < 1.0
              text += " R: #{number}"
            end
          end}
      # return result text
      return text
    end
    #--------------------------------------------------------------------------
    # add_item_text
    #  text - original text
    #  id   - item ID
    #  type - name or description
    #  Generates additional data display for items.
    #--------------------------------------------------------------------------
    def add_item_text(text, id, type)
      # return normal text if range is 0 or the option isn't used for this type
      return text if Items.range(id) == 0
      # get scope
      scope = $data_items[id].scope
      # iterate through configuration
      Config::ITEM_DATA_MODE.each_index {|i|
          # if current option was set up for this type
          if Config::ITEM_DATA_MODE[i] == type
            # add extra information to result text
            case i
            when 0
              next if scope == 0 || scope == 7
              text += case Items.type(id)[0]
              when SHOOT then Cache::ScopeOne.include?(scope) ? ' (Shooter)' : ' (Thruster)'
              when HOMING then Cache::ScopeOne.include?(scope) ? ' (Homing)' : ' (S. Homing)'
              when DIRECT then Cache::ScopeOne.include?(scope) ? ' (Selector)' : ' (Shockwave)'
              when BEAM then Cache::ScopeOne.include?(scope) ? ' (Beam)' : ' (Fullscreen)'
              when TRAP then ' (Trap)'
              when TIMED then ' (Timed)'
              when SUMMON then ' (Summoner)'
              end
            when 1 then text += ' (explodes)' if Items.type(id)[1] > 0
            when 2
              number = Items.range(id)
              number = 1.0 if number < 1.0
              text += " R: #{number}"
            end
          end}
      # return result text
      return text
    end
    #--------------------------------------------------------------------------
    # animations_size_down
    #  Sizes down all the animations to 50%.
    #-------------------------------------------------------------------------- 
    def animations_size_down
      # iterate through all animations
      $data_animations[1, $data_animations.size-1].each {|animation|
          # iterate through all frames and all cells
          animation.frames.each {|frame| (0...frame.cell_data.xsize).each {|i|
              # if cell contains image
              if frame.cell_data[i, 0] != nil && frame.cell_data[i, 0] != -1
                # size down x position, y position and zoom by half
                (1..3).each {|j| frame.cell_data[i, j] /= 2}
              end}}}
    end
    #--------------------------------------------------------------------------
    # rotate
    #  old_bitmap - bitmap to rotate
    #  Returns a bitmap rotated by 90° counterclockwise.
    #-------------------------------------------------------------------------- 
    def rotate(old_bitmap)
      # abort if no bitmap
      return nil unless old_bitmap.is_a?(Bitmap)
      # create new bitmap
      bitmap = Bitmap.new(old_bitmap.height, old_bitmap.width)
      # draw rotated
      (0...old_bitmap.width).each {|x| (0...old_bitmap.height).each {|y|
          # get pixel
          pixel = old_bitmap.get_pixel(x, y)
          # draw pixel if pixel is visible
          bitmap.set_pixel(y, bitmap.height-x-1, pixel) if pixel.alpha > 0}}
      # return rotated bitmap
      return bitmap
    end
    #--------------------------------------------------------------------------
    # setup_passability
    #  map - database map
    #  Returns a data hash with coordinates for the minimap drawing.
    #-------------------------------------------------------------------------- 
    def setup_passability(map)
      # set map for further use and initialize
      @map, result = map, Table.new(map.width, map.height)
      # iterate through all each horizontal element
      (0...@map.height).each {|y|
          # prevent "Script is hanging" error if large map
          Graphics.update if @map.height * @map.width >= 19200 && y % 10 == 0
          # iterate through all each vertical element
          (0...@map.width).each {|x|
              # initialize value
              val = 0x00
              # add to value if virtually passable in each direction
              val |= 0x01 if passable?(x, y, 2) && passable?(x, y+1, 8)
              val |= 0x02 if passable?(x, y, 4) && passable?(x-1, y, 6)
              val |= 0x04 if passable?(x, y, 6) && passable?(x+1, y, 4)
              val |= 0x08 if passable?(x, y, 8) && passable?(x, y-1, 2)
              # add coordinate if passable anyhow
              result[x, y] = val if val != 0x00}}
      # remove map from memory
      @map = nil
      # return passable coordinates
      return result
    end
    #--------------------------------------------------------------------------
    # passable?
    #  x - x-coordinate
    #  y - y-coordinate
    #  d - direction
    #  Checks virtual passability for the minimap.
    #--------------------------------------------------------------------------
    def passable?(x, y, d)
      # "passable" if out of map border
      return true if x < 0 || x >= @map.width || y < 0 || y >= @map.height
      # set bit
      bit = (1 << (d / 2 - 1)) & 0x0f
      # iterate through all layers
      Cache::MapLayers.each {|i|
          # get tile ID
          tile_id = @map.data[x, y, i]
          # if tile ID not valid
          if tile_id == nil
            # impassable
            return false
          # if obstacle bit is set
          elsif $data_tilesets[@map.tileset_id].passages[tile_id] & bit != 0
            # impassable
            return false
          # if obstacle bit is set in all directions
          elsif $data_tilesets[@map.tileset_id].passages[tile_id] & 0x0F == 0x0F
            # impassable
            return false
          # if priority is 0
          elsif $data_tilesets[@map.tileset_id].priorities[tile_id] == 0
            # passable
            return true
          end}
      # passable
      return true
    end
    #--------------------------------------------------------------------------
    # check_map_data
    #  Updates the passability file.
    #--------------------------------------------------------------------------
    def check_map_data
      # stop if not using intelligent passability mode
      return unless BlizzABS::Config::INTELLIGENT_PASSABILITY
      # load tileset data
      $data_tilesets = load_data('Data/Tilesets.rxdata')
      # get current map states
      new_data = load_data('Data/MapInfos.rxdata')
      # if first time intelligent passability is being used
      if !File.exist?('Data/Map_Data.abs')
        # initialize
        data, dates = {}, {}
        # all map IDs
        ids = new_data.keys.sort
      else
        # get passability data and "modified time" data from old data file
        data, dates = load_data('Data/Map_Data.abs')
        # get a sorted array of all map IDs
        keys = new_data.keys.sort
        # iterate through all current map IDs
        keys.each_index {|i|
            # if game not encrypted
            if File.exist?(sprintf('Data/Map%03d.rxdata', keys[i]))
              # open map file for reading
              file = File.open(sprintf('Data/Map%03d.rxdata', keys[i]), 'r')
              # if map was edited
              if dates[keys[i]] != file.mtime
                # remove map ID from data
                data.delete(keys[i])
                # remove map ID from dates
                dates.delete(keys[i])
              end
              # close file
              file.close
            end
            # prevent "Script is hanging" error
            Graphics.update if i % 20 == 0}
        # iterate through all map IDs that were deleted
        (data.keys - keys).each {|id|
              # remove map ID from data
              data.delete(keys[id])
              # remove map ID from dates
              dates.delete(keys[id])}
        # get all map IDs that need to be updated
        ids = keys - data.keys
      end
      # iterate through all IDs
      ids.each {|id|
          # load map
          map = load_data(sprintf('Data/Map%03d.rxdata', id))
          # create one map data pack
          data[id] = setup_passability(map)
          # if game not encrypted
          if File.exist?(sprintf('Data/Map%03d.rxdata', id))
            # open map file for reading
            f = File.open(sprintf('Data/Map%03d.rxdata', id), 'r')
            # get map file modified time
            dates[id] = f.mtime
            # close file
            f.close
          end
          # prevent "Script is hanging" error
          Graphics.update}
      # open new file
      file = File.open('Data/Map_Data.abs', 'wb')
      # save all data to file
      Marshal.dump([data, dates], file)
      # save and close file
      file.close
      # remove variables from memory completely
      $data_tilesets = nil
    end
    
  end
  
end

module BlizzABS
  
  #============================================================================
  # BlizzABS::AI
  #----------------------------------------------------------------------------
  #  This class processes Map_Enemy AI based upon AI Data, character position
  #  and battler status. It includes complete AI control for both actors and
  #  enemies.
  #============================================================================
  
  class AI
    
    # possible AI states
    Idle = 0
    Request = 1
    Ready = 2
    Return = 3
    MoveOnly = 4
    Defend = 21
    Escape = 22
    Knockback = 30
    Abort = 90
    Invalid = 99
    
    #==========================================================================
    # BlizzABS::AI::Data
    #--------------------------------------------------------------------------
    #  This class serves as superclass for Data classes.
    #==========================================================================
    
    class Data
      
      # setting all accessible variables
      attr_accessor :state
      attr_accessor :host
      attr_accessor :in_action
      attr_accessor :attacked
      attr_accessor :aggressive
      attr_accessor :sight
      attr_accessor :memory
      attr_accessor :minions
      attr_accessor :lead
      attr_accessor :act
      attr_accessor :target
      attr_accessor :group
      attr_accessor :negative
      attr_accessor :positive
      attr_accessor :neutral
      attr_accessor :altered_alignment
      attr_reader   :attributes
      attr_reader   :custom
      attr_reader   :delay_time
      attr_reader   :view_range
      attr_reader   :hearing_range_ratio
      attr_writer   :observation
      #------------------------------------------------------------------------
      # AI initialization
      #------------------------------------------------------------------------
      def initialize(host, group, custom, delay, view, hear)
        # set AI timers
        @custom, @delay_time = custom, delay
        # set Perception Range
        @view_range, @hearing_range_ratio, @attributes = view, hear, 0x00
        # the data carrier, battlers in sight and battler data in memory
        @host, @sight, @memory = host, [], {}
        # AI state for convenience and Blizz-ABS action data
        @state, @act = BlizzABS::AI::Idle, BlizzABS::Action.new
        # set alignment group
        setup_group(group)
      end
      #------------------------------------------------------------------------
      # setup_group
      #  Extra method for alignment setup.
      #------------------------------------------------------------------------
      def setup_group(new_group)
        # original alignment
        @altered_alignment = false
        # set new own group
        @group = new_group
        # set up enemy groups
        @negative = $game_system.alignments[@group].enemies.clone
        # set up ally groups
        @positive = $game_system.alignments[@group].allies.clone
        # set up always-neutral groups
        @neutral = $game_system.alignments[@group].neutral.clone
      end
      #------------------------------------------------------------------------
      # add_to_memory
      #  bs - the battlers to memorize
      #  Memorizes all battlers and creates memory data.
      #------------------------------------------------------------------------
      def add_to_memory(bs)
        # if array of battlers
        if bs.is_a?(Array)
          # add memory data for each battler
          bs.each {|b| @memory[b] = MemoryData.new(b.x, b.y)}
        else
          # add memory data for battler
          @memory[bs] = MemoryData.new(bs.x, bs.y)
        end
      end
      #------------------------------------------------------------------------
      # lifeless?
      #  Encapsulation method for lifeless groups.
      #------------------------------------------------------------------------
      def lifeless?
        return BlizzABS::Alignments::LIFELESS_GROUPS.include?(@group)
      end
      #------------------------------------------------------------------------
      # linked?
      #  Encapsulation method for linked groups.
      #------------------------------------------------------------------------
      def linked?
        return BlizzABS::Alignments::LINKED_GROUPS.include?(@group)
      end
      #------------------------------------------------------------------------
      # permanent?
      #  Encapsulation method for permanently linked groups.
      #------------------------------------------------------------------------
      def permanent?
        return BlizzABS::Alignments::PERMANENT_GROUPS.include?(@group)
      end
      #------------------------------------------------------------------------
      # origin_aggressive
      #  Encapsulation method for the "aggressive" attribute.
      #------------------------------------------------------------------------
      def origin_aggressive
        return (@attributes & 0x80 == 0x00)
      end
      #------------------------------------------------------------------------
      # actions
      #  Encapsulation method for the "actions" attribute.
      #------------------------------------------------------------------------
      def actions
        return (@attributes & 0x40 == 0x40)
      end
      #------------------------------------------------------------------------
      # observe
      #  Encapsulation method for the "observe" attribute.
      #------------------------------------------------------------------------
      def observe
        return (@attributes & 0x20 == 0x20)
      end
      #------------------------------------------------------------------------
      # defensive
      #  Encapsulation method for the "defensive" attribute.
      #------------------------------------------------------------------------
      def defensive
        return (@attributes & 0x10 == 0x10)
      end
      #------------------------------------------------------------------------
      # leader
      #  Encapsulation method for the "leader" attribute.
      #------------------------------------------------------------------------
      def leader
        return (@attributes & 0x08 == 0x08)
      end
      #------------------------------------------------------------------------
      # call_help
      #  Encapsulation method for the "call_help" attribute.
      #------------------------------------------------------------------------
      def call_help
        return (@attributes & 0x04 == 0x04)
      end
      #------------------------------------------------------------------------
      # healer
      #  Encapsulation method for the "healer" attribute.
      #------------------------------------------------------------------------
      def healer
        return (@attributes & 0x02 == 0x02)
      end
      #------------------------------------------------------------------------
      # full_power
      #  Encapsulation method for the "full_power" attribute.
      #------------------------------------------------------------------------
      def full_power
        return (@attributes & 0x01 == 0x01)
      end
      
    end
    
    #==========================================================================
    # BlizzABS::AI::Data_Actor
    #--------------------------------------------------------------------------
    #  This class holds all data important for the actor AI.
    #==========================================================================
    
    class Data_Actor < Data
      
      #------------------------------------------------------------------------
      # Initialization
      #------------------------------------------------------------------------
      def initialize(host)
        # call superclass method
        super(host, BlizzABS::Alignments::ACTOR_GROUP, false, 0, 5, 100)
      end
      #------------------------------------------------------------------------
      # negative
      #  Encapsulation method since the player can attack any opponent group
      #  while normal actors can't.
      #------------------------------------------------------------------------
      def negative
        # return player group enemies if self is player
        return BlizzABS::Alignments::GROUPS - [@group] if @host == $game_player
        # normal enemy group
        return @negative
      end
      #------------------------------------------------------------------------
      # offensive
      #  Encapsulation that allows the override of the offensive attribute.
      #------------------------------------------------------------------------
      def offensive
        return (@host.battler == nil ? false : (@host.battler.force_offensive > 0 ?
            @host.battler.force_offensive : @host.battler.offensive))
      end
      #------------------------------------------------------------------------
      # aggressive
      #  Encapsulation that allows the override of the aggressive attribute.
      #------------------------------------------------------------------------
      def aggressive
        return (@host.battler == nil ? false : (@host.battler.force_aggressive > 0 ?
            @host.battler.force_aggressive : @host.battler.aggressive))
      end
      #------------------------------------------------------------------------
      # delay_time
      #  Encapsulation that allows the override of the delay_time attribute.
      #  Passive allies have a higher delay.
      #------------------------------------------------------------------------
      def delay_time
        return (self.aggressive == false ? 0 : (15 - self.aggressive) * 3)
      end
      #------------------------------------------------------------------------
      # defensive
      #  Defensive actors will defend more often.
      #------------------------------------------------------------------------
      def defensive
        return (self.offensive && self.offensive < 8)
      end
      #------------------------------------------------------------------------
      # healer
      #  Defensive actors will heal more often.
      #------------------------------------------------------------------------
      def healer
        return (self.offensive && self.offensive < 5)
      end
      
    end
    
    #==========================================================================
    # BlizzABS::AI::Data_Enemy
    #--------------------------------------------------------------------------
    #  This class holds all data important for the enemy AI.
    #==========================================================================
    
    class Data_Enemy < Data
      
      #------------------------------------------------------------------------
      # AI initialization
      #------------------------------------------------------------------------
      def initialize(host, group, attributes, custom, delay, view, hear)
        # call superclass method
        super(host, group, custom, delay, view, hear)
        # determines if enemy has an aggressive or a passive nature
        @aggressive = (attributes & 0x80 == 0x00)
        # set attributes and initialize minions array and observation data
        @attributes, @minions, @observation = attributes, [], {}
      end
      #------------------------------------------------------------------------
      # sight
      #  Encapsulation method for sight data.
      #------------------------------------------------------------------------
      def sight
        return (@lead != nil ? @lead.ai.sight : @sight)
      end
      #------------------------------------------------------------------------
      # memory
      #  Encapsulation method for memorized battlers.
      #------------------------------------------------------------------------
      def memory
        return (@lead != nil ? @lead.ai.memory : @memory)
      end
      #------------------------------------------------------------------------
      # observation
      #  Encapsulation method for observation data.
      #------------------------------------------------------------------------
      def observation
        return (@lead != nil ? @lead.ai.observation : @observation)
      end
      
    end

    #--------------------------------------------------------------------------
    # wall?
    #  char - the character
    #  x    - x-coordinate
    #  y    - y-coordinate
    #  Checks if between the char and the target is a "wall". Walls prevent
    #  perception.
    #--------------------------------------------------------------------------
    def wall?(char, x, y)
      # abort instantly if not using this option
      return false if Config::WALL_TAGS.size == 0
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # get coordinate difference
      dx, dy = (x-char.x)/pix, (y-char.y)/pix
      # if x difference is not 0 and x difference is greater
      if dx != 0 && dx.abs > dy.abs
        # return any wall tile between
        return (0..dx.abs).any? {|i| Config::WALL_TAGS.include?($game_map.
            terrain_tag(char.x/pix+dx.sgn*i, char.y/pix+(i.to_f*dy/dx).round))}
      # if y difference is not 0 and y difference is greater
      elsif dy != 0 && dy.abs > dx.abs
        # return any wall tile between
        return (0..dy.abs).any? {|i| Config::WALL_TAGS.include?($game_map.
            terrain_tag(char.x/pix+(i.to_f*dx/dy).round, char.y/pix+dy.sgn*i))}
      end
      # no wall between
      return false
    end
    #--------------------------------------------------------------------------
    # can_see_char?
    #  char   - the character
    #  real_x - x-coordinate
    #  real_y - y-coordinate
    #  Checks if the player can be seen.
    #--------------------------------------------------------------------------
    def can_see_char?(char, real_x, real_y)
      # calculate differences of x and y and get inner perception range
      dx, dy = real_x - char.real_x, real_y - char.real_y
      # check facing direction and determine whether can see or not
      case char.direction
      when 2 then return (dy >= 0 && dx.abs <= dy.abs)
      when 4 then return (dx <= 0 && dx.abs >= dy.abs)
      when 6 then return (dx >= 0 && dx.abs >= dy.abs)
      when 8 then return (dy <= 0 && dx.abs <= dy.abs)
      end
      # can't see
      return false
    end
    #--------------------------------------------------------------------------
    # can_hear_char?
    #  char   - the character
    #  real_x - x-coordinate
    #  real_y - y-coordinate
    #  Checks if the player can be heard while being close.
    #--------------------------------------------------------------------------
    def can_hear_char?(char, real_x, real_y)
      # calculate differences of x and y and get inner perception range
      dx, dy = real_x - char.real_x, real_y - char.real_y
      r = char.ai.view_range * 128 * char.ai.hearing_range_ratio / 100
      # can't be heard if out of range
      return false if dx * dx + dy * dy > r * r
      # check facing direction and determine whether can hear or not
      case char.direction
      when 2 then return (dy >= 0)
      when 4 then return (dx <= 0)
      when 6 then return (dx >= 0)
      when 8 then return (dy <= 0)
      end
      # can't see
      return false
    end
    #--------------------------------------------------------------------------
    # can_perceive_char?
    #  char   - the character
    #  real_x - x-coordinate
    #  real_y - y-coordinate
    #  Checks if the player can be heard while being close.
    #--------------------------------------------------------------------------
    def can_perceive_char?(char, real_x, real_y)
      # calculate differences of x and y and get perception range
      dx, dy = real_x - char.real_x, real_y - char.real_y
      r = char.ai.view_range * 128
      # can't be perceived if out of range
      return (dx * dx + dy * dy <= r * r)
    end
    #--------------------------------------------------------------------------
    # update
    #  char - the map character
    #  This is the first phase of the AI update. It determines whether a
    #  character is able to act at all or if an exception has occured and
    #  needs to expire first.
    #--------------------------------------------------------------------------
    def prepare(char)
      # temporary variables
      x, y, ai = char.x, char.y, char.ai
      # if char was attacked
      if char.attacked > 0
        # set state
        ai.state = Knockback
        # stop if force moving knockback already
        return if char.moving?
        # if forced to move
        if char.move_type == 3
          # delete pending movement commands
          char.force_move = []
        # if not moving already
        elsif !char.moving?
          # add throw back moving commands
          char.force_move = [Cache::FDirs[10 - char.direction]]
        end
        # cancel action
        char.in_action = 0
        # decrease attacked counter
        char.attacked -= 1
      # if char in action
      elsif char.in_action > 0
        # set state
        ai.state = Abort
        # if defending
        if char.ai.act.defend?
          # decrease shock count
          char.in_action -= 1
          # set state
          ai.state = Defend
        # if not freeze action and no action sprite
        elsif !char.freeze_action && char.current_sprite == ''
          # decrease shock count
          char.in_action -= 1
        end
      # if char is moving or restricted to move
      elsif char.moving? || char.restriction == 4
        # set state
        ai.state = (char.ai.act.escape? ? Escape : Abort)
      # if char needs to move
      elsif char.force_move.size > 0
        # set state
        ai.state = (char.ai.act.escape? ? Escape : MoveOnly)
      # if target exists
      elsif ai.target != nil
        # set pre-state
        ai.state = Ready
      else
        # set pre-state
        ai.state = Return
      end
    end
    #--------------------------------------------------------------------------
    # perception
    #  char            - the map character
    #  update_priority - determines the update priority
    #  This is the second phase of the AI update. It updates the character's
    #  perception.
    #--------------------------------------------------------------------------
    def perception(char, update_priority = BlizzABS::UPDFull)
      # temporary variables
      dir, x, y, ai, in_range = char.direction, char.x, char.y, char.ai, []
      # if enemy
      if char.is_a?(Map_Enemy)
        # if heavy update required
        if update_priority >= BlizzABS::UPDHeavy
          # find all battlers within perception range
          in_range = ($game_map.battlers + $BlizzABS.battlers - [char]).
              find_all {|b| b.valid? && !b.battler.dead? && ai.view_range * 128 >=
              Math.hypot(b.real_x-char.real_x, b.real_y-char.real_y) &&
              !wall?(char, b.x, b.y)}
          # find all who are in sight
          ai.sight = in_range.find_all {|b| b.in_action > 0 ||
              can_see_char?(char, b.real_x, b.real_y) ||
              can_hear_char?(char, b.real_x, b.real_y)}
          # if full update required
          if update_priority == BlizzABS::UPDFull
            # memorize all unmemorized, seen battlers
            ai.add_to_memory(ai.sight - ai.memory.keys)
          end
        end
        # if medium update required
        if update_priority >= BlizzABS::UPDMedium
          # if observing attribute is active
          if ai.observe
            # valid and lost actors
            valid_actors, lost_actors = [], []
            # for each battler in sight
            ai.sight.each {|b|
                # if actor
                if b.is_a?(Map_Actor)
                  # add the appropriate array
                  (b.valid? ? valid_actors : lost_actors).push(b)
                end}
            # add all actors lost out of sight
            lost_actors |= (ai.memory.keys - ai.sight).find_all {|b|
                b.is_a?(Map_Actor)}
            # for each actor in sight
            valid_actors.each {|key|
                # get observation logs
                data = ai.observation[key.battler]
                # if no observation log exists
                if data == nil
                  # create an observation log
                  ai.observation[key.battler] = [Graphics.frame_count]
                # if interval not started yet
                elsif !data[data.size - 1].is_a?(Numeric)
                  # start observation interval right now
                  data.push(Graphics.frame_count)
                end}
            # for all actors that need to be forgotten
            lost_actors.each {|key|
                # get observation logs
                data = ai.observation[key.battler]
                # if logs exist, last log is a number and time has passed
                if data != nil && data[data.size-1].is_a?(Numeric) &&
                    data[data.size-1] < Graphics.frame_count
                  # convert number into inteval
                  data.push(data.pop..Graphics.frame_count)
                end}
          end
        end
      # if actor
      elsif char.is_a?(Map_Actor)
        # in sight are all battlers in range
        ai.sight = ($game_map.battlers + $BlizzABS.battlers - [char]).
            find_all {|b| b.valid? && b.in_screen?}
      end
      # get alignment setup
      negative, positive = ai.negative, ai.positive
      # invert setup if confused
      negative, positive = positive, negative if char.restriction == 3
      # if a target exists
      if ai.target != nil
        # if force moving
        if char.move_type == 3
          # if delay counter expired
          if ai.act.ready?
            # execute action
            try_execute(char)
            # if nobody around
            if ai.memory.keys.size == 0 && ai.sight.size == 0
              # reset action
              char.reset_action
            # if about to move and target exists
            elsif char.force_move.size == 0 && ai.target != nil
              # get pixel movement rate and initialize flag
              pix, found = $BlizzABS.pixel, false
              # find the target in memory
              ai.memory.each_key {|key|
                  # if this is the target
                  if key == ai.target
                    # if lost target completely
                    if ai.memory[key].x / pix == char.x / pix &&
                        ai.memory[key].y / pix == char.y / pix
                      # reset action
                      char.reset_action
                      # abort method
                      return
                    end
                    # found the target
                    found = true
                    break
                  end}
              # reset action if not found in memory
              char.reset_action unless found
            end
          end
        else
          # face the target
          char.turn_toward(ai.target)
          # if running away
          if char.ai.act.escape?
            # move away from reference target
            char.move_away_random(ai.target, true, ai.act.range)
          # if delay counter expired
          elsif ai.act.ready?
            # execute action
            try_execute(char)
            # if nobody around
            if ai.memory.keys.size == 0 && ai.sight.size == 0
              # reset action
              char.reset_action
            # if about to move and target exists
            elsif char.force_move.size == 0 && ai.target != nil
              # if within sight
              if ai.sight.include?(ai.target)
                # request path to target
                request_path(char, ai.target)
              else
                # get pixel movement rate and initialize flag
                pix, found = $BlizzABS.pixel, false
                # find the target in memory
                ai.memory.each_key {|key|
                    # if this is the target
                    if key == ai.target
                      # temporary variables
                      x, y = ai.memory[key].x / pix, ai.memory[key].y / pix
                      # if lost target completely
                      if x == char.x / pix && y == char.y / pix
                        # reset action
                        char.reset_action
                        # abort method
                        return
                      end
                      # find path to last known coordinates
                      request_path(char, x, y)
                      found = true
                      break
                    end}
                # reset action if not found in memory
                char.reset_action unless found
              end
            end
          # if negative action and too close
          elsif negative.include?(ai.target.ai.group) &&
              Math.hypot(char.real_x-ai.target.real_x,
              char.real_y-ai.target.real_y) < 384
            # delete movement commands
            char.force_move = []
            # back off from reference target
            char.move_away_random(ai.target, false, ai.act.range)
          end
          # exit method
          return
        end
      end
      # if not actor
      unless char.is_a?(Map_Actor)
        # call for help
        call_for_help(char, in_range, negative, positive)
      end
    end
    #--------------------------------------------------------------------------
    # call_for_help
    #  char     - the map character
    #  in_range - array of battlers in range
    #  negative - perceived enemies
    #  positive - perceived allies
    #  Executes calling for help procedure.
    #--------------------------------------------------------------------------
    def call_for_help(char, in_range, negative, positive)
      # temporary variable
      ai = char.ai
      # stop if confused, not help calling enemy or not newly sighted enemies
      return if !ai.call_help || char.restriction == 3 || ai.target != nil
      # get all enemies in sight
      in_sight_e = ai.sight.find_all {|b| negative.include?(b.ai.group)}
      # stop if no sighted enemies
      return if in_sight_e.size == 0
      # find all allied battlers
      allies = in_range.find_all {|b| ai.positive.include?(b.ai.group)}
      # stop if no allies exist
      return if allies.size == 0
      # iterate through all allies
      allies.each {|ally|
          # ally memorizes each battler in sight not in ally's memory already
          ally.ai.add_to_memory(ai.sight - ally.ai.memory.keys)
          # for each memorized battler
          ai.memory.each_key {|key|
              # if not memorized by ally yet
              if ally.ai.memory[key] == nil
                # copy memory data for battler
                ally.ai.memory[key] = ai.memory[key].clone
              end}
          # copy real negative group to ally's negative group
          ally.ai.negative = ally.ai.negative | ai.negative}
      # if using help calling animation
      if Config::CALL_HELP_ANIMATION_ID > 0
        # setup help calling animation
        char.animation_id = Config::CALL_HELP_ANIMATION_ID
      end
    end
    #--------------------------------------------------------------------------
    # decide_action
    #  char - the map character
    #  This is the fourth phase of the AI update. When a character is ready to
    #  act and has no action defined yet, this method decides a new action.
    #--------------------------------------------------------------------------
    def decide_action(char)
      # temporary variables
      dir, x, y, ai = char.direction, char.x, char.y, char.ai
      pix = $BlizzABS.pixel
      # get alignment setup
      negative, positive = ai.negative, ai.positive
      # invert setup if confused
      negative, positive = positive, negative if char.restriction == 3
      # get all enemies in sight
      in_sight_e = ai.sight.find_all {|b| negative.include?(b.ai.group)}
      # if no enemies are available
      if in_sight_e.size == 0
        # initialize
        in_sight_a, in_range = [], ai.memory.keys
        # get all allies and enemies in range
        in_range.each {|b|
            in_sight_a.push(b) if positive.include?(b.ai.group)
            in_sight_e.push(b) if negative.include?(b.ai.group)}
        # if still no enemies are available
        if in_sight_e.size == 0
          # initialize again
          in_sight_a = []
          # get all allies and enemies from memory
          ai.memory.each_key {|b|
              in_sight_a.push(b) if positive.include?(b.ai.group)
              in_sight_e.push(b) if negative.include?(b.ai.group)}
        end
      else
        # get all allies in sight
        in_sight_a = ai.sight.find_all {|b| positive.include?(b.ai.group)}
      end
      # exit if no enemies are in sight
      return if in_sight_e.size == 0
      # if actor
      if char.is_a?(Map_Actor)
        # exit if "no enemies" are in sight
        return if in_sight_e.size == 0
        # get radius reach of player
        rad = $BlizzABS.util.get_player_radius
        # find all enemies within radius according to aggressiveness
        in_radius = in_sight_e.find_all {|e|
            Math.hypot(char.x / pix - e.x / pix, char.y / pix - e.y / pix) <=
                rad * char.ai.aggressive / 15}
        # check next trigger if action can't be executed
        return if in_radius.size == 0
        # add self as ally
        in_sight_a.push(char)
        # if confused or no trigger action was set up
        if char.restriction == 3 ||
            !trigger_actor_action(char, in_sight_a, in_sight_e)
          # set up advanced action based on Blizz-ABS AI
          advanced_actor_action(char)
        end
      # if enemy
      elsif char.is_a?(Map_Enemy)
        # if action attribute is not active
        if !ai.actions
          # decide normal action
          char.battler.make_action
          # temporary variable
          act = char.battler.current_action
          # set up the action in Blizz-ABS as normal action
          normal_action(char, in_sight_a, in_sight_e, (act.kind == 0),
              act.basic, rand(31) + 70, 80, act.skill_id)
        else
          # set up advanced action based on Blizz-ABS AI
          advanced_enemy_action(char)
        end
      end
      # if target doesn't exist or forced moving
      if ai.target == nil || !ai.target.valid?
        # reset action
        char.reset_action
      # if not being force moved
      elsif char.is_a?(Map_Enemy) && char.move_type != 3
        # set path request state
        ai.state = Request
        # turn toward the target not to lose it out of sight
        char.turn_toward(ai.target)
        # request a path
        request_path(char, ai.target)
      end
    end
    #--------------------------------------------------------------------------
    # trigger_actor_action
    #  char - the map actor
    #  Analyzes what the enemy is capable of and uses that data to determine an
    #  action.
    #--------------------------------------------------------------------------
    def trigger_actor_action(char, in_sight_a, in_sight_e)
      # make copies of the original perception arrays
      in_sight_a_org, in_sight_e_org = in_sight_a, in_sight_e
      # check each trigger
      char.battler.triggers.each {|trigger|
          # restore percepted battlers
          in_sight_a, in_sight_e = in_sight_a_org.clone, in_sight_e_org.clone
          # reset target
          target = nil
          # get triggering battlers
          activators = case trigger.activator
          when TRGLeader then [$game_player]
          when TRGAlly then $BlizzABS.battlers.find_all {|b| b.valid?}
          when TRGSelf then [char]
          when TRGEnemy then in_sight_e.clone
          when TRGProbability then nil
          end
          # if battler activator
          if trigger.battler_activator?
            # if any trigger exists
            if activators.size > 0
              # get a target from the trigger
              target = trigger.get_a_target(char, activators)
            end
          # if probability worked
          elsif rand(100) < trigger.value
            # default target flag
            target = true
          end
          # check next trigger if this one hasn't been activated
          next if target == nil
          # temporary variables
          basic, type, skill, scope, id = nil, 0, false, 0, trigger.action_data
          # check trigger action type
          case trigger.action_type
          when TRGAttack
            # set attack data for later processing if can attack
            basic, type, scope = true, 0, 1 if char.attack_can_use?
          when TRGDefend
            # set defend data for later processing
            basic, type, scope = true, 1, 0
          when TRGSkill
            # if can use skill
            if char.skill_can_use?(id)
              # set skill data for later processing
              basic, skill, scope = false, true, $data_skills[id].scope
            end
          when TRGItem
            # if can use item
            if char.item_can_use?(id)
              # set item data for later processing
              basic, scope = false, $data_items[id].scope
            end
          end
          # check next trigger if action can't be executed
          next if basic == nil
          # get targeting scope data
          enemy, dead, all = $BlizzABS.util.get_scope_data(scope)
          # if actual target exists and not targeting multiple battlers
          if target != true && !all
            # if targeting enemies
            if enemy
              # if chosen target is not part of enemy group
              unless in_sight_e.include?(target)
                # get a new target
                target = in_sight_e[rand(in_sight_e.size)]
              end
            else
              # filter all dead allies if targeting dead allies
              in_sight_a = in_sight_a.find_all {|a| a.battler.dead?} if dead
              # if chosen target is not part of ally group
              unless in_sight_a.include?(target)
                # get a new target
                target = in_sight_a[rand(in_sight_a.size)]
              end
            end
            # force this target to be the only one targetable
            in_sight_a, in_sight_e = [target], [target]
          end
          # set up action data
          normal_action(char, in_sight_a, in_sight_e, basic, type,
              (15 - char.ai.offensive) * 10, 0, id, skill, false)
          # trigger has been activated, abort
          return true}
      # no trigger has been activated
      return false
    end
    #--------------------------------------------------------------------------
    # advanced_actor_action
    #  char - the map actor
    #  Analyzes what the actor is capable of and uses that data to determine an
    #  action.
    #--------------------------------------------------------------------------
    def advanced_actor_action(char)
      # initialize skill action
      dmg, heal, neutral = [], [], []
      # iterate through all actions
      $BlizzABS.util.get_actor_skills(char.battler).each {|id|
          # if skill can be used
          if char.skill_can_use?(id)
            # if damaging skill
            if $data_skills[id].power > 0
              # add to array of damaging skills
              dmg.push(id)
            # if healing skill
            elsif $data_skills[id].power < 0
              # add to array of healing skills
              heal.push(id)
            else
              # add to array of neutral skills
              neutral.push(id)
            end
          end}
      # decide a target
      decide_target(char, dmg, heal, neutral, true, true, false)
    end
    #--------------------------------------------------------------------------
    # advanced_enemy_action
    #  char - the map enemy
    #  Analyzes what the enemy is capable of and uses that data to determine an
    #  action.
    #--------------------------------------------------------------------------
    def advanced_enemy_action(char)
      # initialize basic action
      attack = defend = escape = false
      # initialize skill action
      dmg, heal, neutral = [], [], []
      # iterate through all actions
      char.battler.actions.each {|action|
          # conditions
          n = $game_temp.battle_turn
          a = action.condition_turn_a
          b = action.condition_turn_b
          # skip if conditions are not fulfilled
          next if b == 0 && n != a || b > 0 && (n < 1 || n < a || n % b != a % b)
          next if char.battler.hp * 100.0 / char.battler.maxhp > action.condition_hp
          next if $game_party.max_level < action.condition_level
          switch_id = action.condition_switch_id
          next if switch_id > 0 && !$game_switches[switch_id]
          # depending on which basic type of action
          case action.kind
          when 0 # basic action
            case action.basic
            when 0 then attack = true
            when 1 then defend = true
            when 2 then escape = true
            end
          when 1 # skill action
            # if skill can be used
            if char.skill_can_use?(action.skill_id)
              # if damaging skill
              if $data_skills[action.skill_id].power > 0
                # add to array of damaging skills
                dmg.push(action.skill_id)
              # if healing skill
              elsif $data_skills[action.skill_id].power < 0
                # add to array of healing skills
                heal.push(action.skill_id)
              else
                # add to array of neutral skills
                neutral.push(action.skill_id)
              end
            end
          end}
      # decide a target
      decide_target(char, dmg, heal, neutral, attack, defend, escape)
    end
    #--------------------------------------------------------------------------
    # normal_action
    #  char       - the map character
    #  in_sight_a - allies in sight
    #  in_sight_e - enemies in sight
    #  basic      - basic type or not
    #  type       - which type
    #  def_time   - defending time
    #  run_time   - running away time
    #  object_id  - skill ID or item ID to use
    #  skill      - whether skill or item
    #  self_flag  - can target self
    #  Used to setup the action handling depending on which action was decided
    #  by using the normal way without the action attribute.
    #--------------------------------------------------------------------------
    def normal_action(char, in_sight_a, in_sight_e, basic, type, def_time,
                      run_time, object_id, skill = true, self_flag = true)
      # temporary variables
      x, y, ai = char.x, char.y, char.ai
      # if no data exists
      if in_sight_a == nil || in_sight_e == nil
        # get alignment setup
        negative, positive = ai.negative, ai.positive
        # invert setup if confused
        negative, positive = positive, negative if char.restriction == 3
        # if not basic action
        unless basic
          # get all allies in sight
          in_sight_a = ai.sight.find_all {|b| positive.include?(b.ai.group)}
        end
        # get all enemies in sight
        in_sight_e = ai.sight.find_all {|b| negative.include?(b.ai.group)}
      end
      # if basic action type
      if basic
        # depending on which enhanced type
        case type
        when ATTACK
          # set AI state
          ai.state = Ready
          # if skill
          if char.is_a?(Map_Actor)
            # get weapon data
            range = Weapons.range(char.battler.weapon_id)
            type = Weapons.type(char.battler.weapon_id)
          else
            # get enemy attack data
            range = Enemies.range(char.battler_id)
            type = Enemies.type(char.battler_id)
          end
          # set action data
          ai.act.set(range, ACTAttack, 0, type, ai.delay_time)
          # determine a random target from all enemies in sight
          ai.target = in_sight_e[rand(in_sight_e.size)]
        when DEFEND
          # set AI state
          ai.state = Defend
          # target the closest enemy
          ai.target = in_sight_e.min {|a, b|
              Math.hypot(x - b.x, y - b.y) <=> Math.hypot(x - a.x, y - a.y)}
          # turn toward the target if target exists and not being force moved
          char.turn_toward(ai.target) if ai.target != nil && char.move_type != 3
          # use defend action
          char.use_defend
          # set action data
          ai.act.set(3, ACTDefend, 0, 0, def_time)
        when ESCAPE
          # get a reference target from which to run away
          ai.target = in_sight_e[rand(in_sight_e.size)]
          # if reference target exists
          if ai.target != nil
            # set AI state
            ai.state = Escape
            # set action data
            ai.act.set(ai.view_range - 1, ACTEscape, 0, 0, run_time)
            # stop execution
            return
          end
        end
      else
        # if skill
        if skill
          # get skill data
          range, type = Skills.range(object_id), Skills.type(object_id)[0]
          # get skill and action
          object, action = $data_skills[object_id], ACTSkill
        else
          # get item data
          range, type = Items.range(object_id), Items.type(object_id)[0]
          # get item and action
          object, action = $data_items[object_id], ACTItem
        end
        # set action data
        ai.act.set(range, action, object.id, type, ai.delay_time)
        # if instant object
        if ai.act.type == SUMMON || ai.act.type != SHOOT &&
            (object.scope == 0 || object.scope == 2 || object.scope == 4 ||
            object.scope == 6 || object.scope == 7)
          # instant execution of the skill or item
          skill ? char.use_skill(object) : char.use_item(object)
          # reset action
          char.reset_action
          # reset action
          char.battler.current_action.clear
        # if targeting enemies
        elsif object.scope == 1 || object.scope == 2 && ai.act.type == SHOOT
          # set an enemy target
          ai.target = in_sight_e[rand(in_sight_e.size)]
        # if targeting allies
        elsif object.scope == 3
          # add self if allowed to consider self as ally
          in_sight_a += [char] if self_flag
          # set an ally target
          ai.target = in_sight_a[rand(in_sight_a.size)]
        # if targeting dead allies
        elsif object.scope == 5 && in_sight_a[0].is_a?(Map_Actor)
          # set a dead ally target
          ai.target = in_sight_a[rand(in_sight_a.size)]
        end
      end
      ### 2DO
      # if player with valid target
      if char == $game_player && ai.target != nil
        # force in_battle flag
        in_battle, $game_temp.in_battle = $game_temp.in_battle, true
        # force selection override
        $game_temp.select_data = true
        # no delay
        self.try_execute(char)
        # restore flag
        $game_temp.in_battle = in_battle
        # remove dummy selection data
        $game_temp.select_data = nil
      end
      # if target doesn't exist or forced moving
      if ai.target == nil || !ai.target.valid?
        # reset action
        char.reset_action
      # if not being force moved
      elsif char.move_type != 3
        # set path request state
        ai.state = Request
        # turn toward the target not to lose it out of sight
        char.turn_toward(ai.target)
        # request a path
        request_path(char, ai.target)
      end
    end
    #--------------------------------------------------------------------------
    # decide_target
    #  char    - the map character
    #  dmg     - damaging actions
    #  heal    - healing actions
    #  neutral - actions without healing or damage
    #  attack  - can the character attack
    #  defend  - can the character defend
    #  escape  - can the character escape
    #  This is the fifth phase of the AI update. After a character has chosen
    #  to perform an action, this method finds an appropriate target for the
    #  character.
    #--------------------------------------------------------------------------
    def decide_target(char, dmg, heal, neutral, attack, defend, escape)
      # temporary variables
      x, y, ai = char.x, char.y, char.ai
      # get alignment setup
      negative, positive = ai.negative, ai.positive
      # invert setup if confused
      negative, positive = positive, negative if char.restriction == 3
      # initialize arrays
      allies, enemies = [char], []
      # if enemy
      if char.is_a?(Map_Enemy)
        # find all allies and all enemies in memory
        ai.memory.each_key {|b|
            allies.push(b) if positive.include?(b.ai.group)
            enemies.push(b) if negative.include?(b.ai.group)}
      # if actor
      elsif char.is_a?(Map_Actor)
        # find all allies and all enemies in sight
        ai.sight.each {|b|
            allies.push(b) if positive.include?(b.ai.group)
            enemies.push(b) if negative.include?(b.ai.group)}
      end
      # find all allies who need healing
      to_heal = allies.find_all {|b| b.valid? && b.battler.hp < b.battler.maxhp}
      # if decided to heal
      if (heal.size > 0 && to_heal.size > 0 && (ai.healer || rand(3) == 0) &&
          rand(5) == 0)
        # find all skills that heal all allies
        allheal = heal.find_all {|id|
            $data_skills[id].scope == 2 || $data_skills[id].scope == 4 ||
            $data_skills[id].scope == 6}
        # test again flag
        test_again = true
        # if more than 1 ally who needs healing exists and allheal skills exist
        if to_heal.size > 1 && allheal.size > 0
          # initialize data
          decided, now, new = nil, [], []
          # iterate through all all-healing skills
          allheal.each {|id|
              # fake Blizz-ABS action setup
              ai.act.set(Skills.range(id), ACTSkill, id, Skills.type(id)[0],
                  ai.delay_time)
              # all allies who can be targeted by this skill
              new = to_heal.find_all {|b| $BlizzABS.can_execute?(char, b, ai.act)}
              # if not decided yet
              if decided == nil
                # decide this skill and those allies
                decided, now = id, new
              # 50% chance
              elsif rand(2) == 0
                # intialize damage counters
                dmg1 = dmg2 = 0
                # sum up all damage for last decided targets
                now.each {|b| dmg1 += b.battler.maxhp - b.battler.hp}
                # sum up all damage for new targets
                new.each {|b| dmg2 += b.battler.maxhp - b.battler.hp}
                # decide this skill if it contains battlers with more damaged HP
                decided, now = id, new if dmg2 > dmg1
              # if more battlers would be affected by this skill
              elsif new.size > now.size
                # decide this skill and those allies
                decided, now = id, new
              end}
          # if more than one battler can be healed
          if now.size > 1
            # setup Blizz-ABS action
            ai.act.set(Skills.range(decided), ACTSkill, decided,
                Skills.type(decided)[0], ai.delay_time / 2)
            # don't test for one battler
            test_again = false
          end
        end
        # if should test for one battler
        if test_again
          # find all skills that heal one ally
          oneheal = heal.find_all {|id|
              $data_skills[id].scope == 1 || $data_skills[id].scope == 3 ||
              $data_skills[id].scope == 5}
          # if any skill exists
          if oneheal.size > 0
            # decided action
            decided = oneheal[rand(oneheal.size)]
            # decided target
            ai.target = to_heal[rand(to_heal.size)]
          else
            # decided action
            decided = heal[rand(heal.size)]
          end
          # stop execution if no skill decided
          return false if decided == nil
          # setup Blizz-ABS action
          ai.act.set(Skills.range(decided), ACTSkill, decided,
              Skills.type(decided)[0], ai.delay_time / 2)
        end
        # confirm execution
        return true
      end
      # not decided to escape yet
      escaping = false
      # if able to run away
      if escape && rand(5) == 0
        # if observation attribute is active
        if ai.observe && char.restriction != 3
          # iterate through all enemies
          enemies.each {|b|
              # if actor
              if b.is_a?(Map_Actor) && ai.observation[b.battler] != nil
                # get damage per second rate
                dps = get_observation(b.battler, ai.observation[b.battler].clone)
                # 20% chance or damage per second-distance rate high enough
                if rand(5) == 0 || dps * 128 / Math.hypot(b.real_x-
                    char.real_x, b.real_y-char.real_y) > char.battler.hp / 2
                  # set this battler as escape reference
                  ai.target = b
                  # running away
                  escaping = true
                  # abort iteration
                  break
                end
              end}
        # 20% chance
        elsif rand(5) == 0
          # initialize minimum range
          min = nil
          # iterate through all enemies
          enemies.each {|b|
              # if closer than anybody else
              if (b.is_a?(Map_Actor) && (min == nil ||
                  Math.hypot(b.real_x-char.real_x, b.real_y-char.real_y) < min))
                # set this battler as escape reference
                ai.target = b
                # set new minimum range
                min = Math.hypot(b.real_x-char.real_x, b.real_y-char.real_y)
                # running away
                escaping = true
                # abort iteration
                break
              end}
        end
      end
      # if decided to escape
      if escaping
        # set AI state
        ai.state = Escape
        # set action data
        ai.act.set(ai.view_range - 1, ACTEscape, 0, 0, 80)
        # confirm execution
        return true
      end
      # not decided to defend yet
      defending = false
      # if able to defend
      if defend && rand(5) == 0
        # probability factor if higher if defensive and reset defend flag
        factor = rand(ai.defensive ? 10 : 30)
        # if decided to defend
        if char.battler.hp * 100 / char.battler.maxhp < factor
          # if observation attribute is active
          if ai.observe && char.restriction != 3
            # iterate through all enemies
            enemies.each {|b|
                # if actor
                if b.is_a?(Map_Actor) && ai.observation[b.battler] != nil
                  # get damage per second rate
                  dps = get_observation(b.battler,
                      ai.observation[b.battler].clone)
                  # 20% chance or damage per second-distance rate high enough
                  if rand(5) == 0 || dps * 128 / Math.hypot(b.real_x-
                      char.real_x, b.real_y-char.real_y) > char.battler.hp / 3
                    # defending
                    defending = true
                    # abort iteration
                    break
                  end
                end}
          # 33% chance
          elsif enemies.size > 0 && rand(5) == 0
            # decided to defend
            defending = true
          end
        end
      end
      # if decided to defend
      if defending
        # set AI state
        ai.state = Defend
        # target the closest enemy
        ai.target = enemies.min {|a, b|
            Math.hypot(x-b.x, y-b.y) <=> Math.hypot(x-a.x, y-a.y)}
        # turn toward the target if target exists and not being force moved
        char.turn_toward(ai.target) if ai.target != nil && char.move_type != 3
        # use defend action
        char.use_defend
        # set action data
        ai.act.set(3, ACTDefend, 0, 0, rand(31) + 70)
        # confirm execution
        return true
      end
      # number of skills
      skill_number = dmg.size + heal.size + neutral.size
      # if able to attack and chosen to attack
      if attack && (skill_number == 0 || rand(skill_number) == 0)
        # if enemy
        if char.is_a?(Map_Enemy)
          # set AI state
          ai.state = Ready
          # setup Blizz-ABS action
          ai.act.set(Enemies.range(char.battler_id), ACTAttack, 0,
              Enemies.type(char.battler_id), ai.delay_time)
          # if observing attribute and not confused
          if ai.observe && char.restriction != 3
            # decide a target based upon observation experience
            observation_target(char, ai, enemies)
          end
        # if actor
        elsif char.is_a?(Map_Actor)
          # set AI state
          ai.state = Ready
          # setup Blizz-ABS action
          ai.act.set(Weapons.range(char.battler.weapon_id), ACTAttack, 0,
              Weapons.type(char.battler.weapon_id), ai.delay_time)
        end
        # if no target exists
        if ai.target == nil || !ai.target.valid?
          # get any enemy
          ai.target = enemies[rand(enemies.size)]
        end
        # confirm execution
        return true
      end
      # decide a random skill action
      decided = (dmg + neutral)[rand(dmg.size + neutral.size)]
      # if action exists
      if decided != nil
        # if observing
        if ai.observe && char.restriction != 3
          # decide a target based upon observation experience
          observation_target(char, ai, enemies)
        end
        # if no target was decided
        if ai.target == nil || !ai.target.valid?
          # if targeting enemies
          if $data_skills[decided].scope == 0 ||
              $data_skills[decided].scope == 1 ||
              $data_skills[decided].scope == 2
            # select a random enemy target
            ai.target = enemies[rand(enemies.size)]
          else
            # select a random ally target
            ai.target = allies[rand(allies.size)]
          end
        end
      end
      # stop execution if no target selected
      return false if ai.target == nil || !ai.target.valid?
      # setup Blizz-ABS action
      ai.act.set(Skills.range(decided), ACTSkill, decided,
          Skills.type(decided)[0], ai.delay_time)
      # confirm execution
      return true
    end
    #--------------------------------------------------------------------------
    # observation_target
    #  char    - the map character
    #  ai      - ai of the map character
    #  enemies - array of enemies
    #  The method decide_target calls this method to decide a target based
    #  upon observation experience.
    #--------------------------------------------------------------------------
    def observation_target(char, ai, enemies)
      # initialize dps array
      dps = {}
      # iterate through all enemies
      enemies.each {|b|
          # if being observed
          if b.is_a?(Map_Actor) && ai.observation[b.battler] != nil
            # associate battler with his dps within observation intervals
            dps[b] = get_observation(b.battler, ai.observation[b.battler].clone)
          end}
      # find the battler closest to a dps of 1/5 of the maxhp
      ai.target = dps.keys.min {|a, b|
          (char.battler.maxhp/5 - dps[a]).abs <=> (char.battler.maxhp/5 - dps[b]).abs}
    end
    #--------------------------------------------------------------------------
    # try_execute
    #  char - the map character
    #  If a character has a target defined or is about to execute a static
    #  action, this method controls it. It is called over and over until the
    #  target is within range.
    #--------------------------------------------------------------------------
    def try_execute(char)
      # temporary variables
      x, y, ai = char.x, char.y, char.ai
      # if battler doesn't exist or action is not valid
      if !ai.target.valid? || !ai.act.valid?
        # reset movement
        char.force_move = []
        # reset action
        char.reset_action
        # abort state
        ai.state = Abort
      # if charging and not charged yet
      elsif char.charging? && !char.charged?
        # abort state
        ai.state = Abort
      # if character can execute action
      elsif $BlizzABS.can_execute?(char)
        # if attack
        if ai.act.attack?
          # use attack
          char.use_attack
        # if skill
        elsif ai.act.skill?
          # use skill
          char.use_skill($data_skills[ai.act.id])
        # if item
        elsif ai.act.item?
          # use item
          char.use_item($data_items[ai.act.id])
        end
        # reset movement
        char.force_move = []
        # reset action
        char.reset_action
        # abort state
        ai.state = Abort
      end
    end
    #--------------------------------------------------------------------------
    # evade_projectiles
    #  char - the character
    #  Checks whether there are projectiles that could hit the character and
    #  determines the reaction of the character at the threat.
    #--------------------------------------------------------------------------
    def evade_projectiles(char)
      # temporary variable and get pixel movement rate
      ai, pix = char.ai, $BlizzABS.pixel
      # find all projectiles within sight or close hearing that can hit char
      projectiles = $BlizzABS.cache.remotes.find_all {|p|
          p.is_a?(Map_Projectile) &&
          p.type != REMOnReturn && p.type != REMInitSkill &&
          p.type != REMHomingSkill && p.type != REMInitItem &&
          p.type != REMHomingItem && p.group.include?(ai.group)}
      # filter projectiles depending on facing direction
      projectiles = case char.direction
      when 2 then projectiles.find_all {|p| p.real_y > char.real_y}
      when 4 then projectiles.find_all {|p| p.real_x < char.real_x}
      when 6 then projectiles.find_all {|p| p.real_x > char.real_x}
      when 8 then projectiles.find_all {|p| p.real_y < char.real_y}
      end
      # if enemy
      if char.is_a?(Map_Enemy)
        # filter projectiles
        projectiles = projectiles.find_all {|p| !wall?(char, p.x, p.y) &&
            can_perceive_char?(char, p.real_x, p.real_y)}
      end
      # check every projectile
      projectiles.each {|proj|
          # create affection area rectangle for projectile
          area = $BlizzABS.util.get_projectile_hit_area(proj)
          # if this projectile will hit character
          if $BlizzABS.util.intersection(area, Rect.new(char.real_x/4,
              char.real_y/4, 32, 32))
            # depending on how to quicker evade it
            dir = case proj.direction
            when 2, 8 then (char.x >= proj.x ? 6 : 4)
            when 4, 6 then (char.y >= proj.y ? 2 : 8)
            end
            # if actually passable
            if char.passable?(char.x, char.y, dir)
              # move in that direction now
              char.force_move.unshift(Cache::FDirs[dir])
            # if passable in opposite direction
            elsif char.passable?(char.x, char.y, proj.direction)
              # move away now
              char.force_move.unshift(Cache::FDirs[proj.direction])
            end
          end}
    end
    #--------------------------------------------------------------------------
    # leader_update
    #  char - the leading map character
    #  The leader keeps updating every of his minions with the memory data of
    #  the other minions and shares their observation experience, so they can
    #  rate the actors and decide their actions better.
    #--------------------------------------------------------------------------
    def leader_update(char)
      # temporary variable
      ai = char.ai
      # if not leader
      if !ai.leader
        # minion releases self if leader has ceased to exist
        ai.lead = nil if ai.lead != nil && !ai.lead.valid?
        # stop
        return
      end
      # if confused
      if char.restriction == 3
        # release all minions
        ai.minions.each {|b| b.ai.lead = nil}
        ai.minions = []
        # stop updating
        return
      end
      # initialize
      in_range, delays, override = [], [], []
      # add all battlers in memory that have a matching group
      ai.memory.each_key {|b| in_range.push(b) if b.ai.group == ai.group}
      # release all battlers that are out of range with expired counter
      (ai.minions - in_range).each {|b| b.ai.lead = nil}
      # minions are allies that are not leaders and don't have leaders
      ai.minions = in_range
      # remove other leaders
      ai.minions = in_range.find_all {|battler|
          !battler.ai.leader && battler.ai.lead == nil}
      # stop if no assigned minions
      return if ai.minions.size == 0
      # iterate through all minions
      ai.minions.each {|b|
          # if minion is not confused
          if b.restriction != 3
            # if action exists
            if b.ai.act.valid?
              # add delay time
              delays.push(b.ai.act.ready? ? 3 : b.ai.act.delay)
              # remember this minion
              override.push(b)
            end
            # set character as leader
            b.ai.lead = char
            # add battlers in sight
            ai.sight |= b.ai.sight
            # add minion's memorized battlers not memorized by leader yet
            ai.add_to_memory(b.ai.memory.keys - ai.memory.keys)
            # if battler observes
            if b.ai.observe
              # iterate through all observed battlers
              b.ai.observation.each_key {|key|
                  # if no data exists for this battler
                  if ai.observation[key] == nil
                    # copy data
                    ai.observation[key] = b.ai.observation[key]
                  else
                    # unite time intervals
                    $BlizzABS.util.range_array_union(ai.observation[key],
                        b.ai.observation[key])
                  end}
            end
          end}
      # calculate average delay timer value
      average = delays.sum.to_f / delays.size
      # set each minion's delay timer to the average value
      override.each {|b| b.ai.act.delay = average}
    end
    #--------------------------------------------------------------------------
    # observe
    #  battler - the acting actor
    #  dmg     - damage done
    #  Stores actor damage. It Keeps track of all actor actions for enemy
    #  observations.
    #--------------------------------------------------------------------------
    def observe(battler, dmg)
      # create observer hash if none exists
      @observer = {} if @observer == nil
      # create battler hash if none exists
      @observer[battler] = [] if @observer[battler] == nil
      # if damage is numeric and there is damage
      if dmg.is_a?(Numeric) && dmg != 0
        # damage done at this moment if any damage done
        @observer[battler].push(ObserveData.new(dmg.abs, Graphics.frame_count))
      end
      # remove oldest if more than 1000 logs exist for this battler
      @observer[battler].shift if @observer[battler].size > 1000
    end
    #--------------------------------------------------------------------------
    # get_observation
    #  battler   - the requested actor
    #  intervals - time ranges where the actor was observed
    #  Returns the DPS (damage per second) rate for the given actor observed
    #  within the given intervals of time.
    #--------------------------------------------------------------------------
    def get_observation(battler, intervals = [])
      # create observer hash if none exists
      @observer = {} if @observer == nil
      # create battler hash if none exists
      @observer[battler] = [] if @observer[battler] == nil
      # initialize damage, time factors and temporary variable
      damage, time, tmp = 0, 1, intervals[intervals.size - 1]
      # if still observing
      if tmp.is_a?(Numeric)
        # convert starting observation time to interval until now
        intervals[intervals.size - 1] = tmp..Graphics.frame_count
      end
      # sum all damage within observation intervals
      @observer[battler].each {|data|
          damage += data.damage if intervals.any? {|int| data.time === int}}
      # sum up time of observation
      intervals.each {|int| time += int.last - int.first}
      # return damage per second rate
      return (damage * 40 / time)
    end
    #--------------------------------------------------------------------------
    # path_requesting_parameters
    #  x - x target coordinate or target character
    #  y - y target coordinate or nothing
    #  Prepares the parameters for path finding requests.
    #--------------------------------------------------------------------------
    def path_requesting_parameters(x, y)
      # if target is a character
      if x.is_a?(Map_Battler)
        # get pixel movement coordinates
        y = x.y
        x = x.x
      else
        # get pixel movement rate
        pix = $BlizzABS.pixel
        # if target is a normal character
        if x.is_a?(Game_Character)
          # create pixel movement coordinates from actual coordinates
          y = x.y * pix
          x = x.x * pix
        # if actual coordinates
        elsif x.is_a?(Numeric) && y.is_a?(Numeric)
          # create pixel movement coordinates from actual coordinates
          y *= pix
          x *= pix
        end
      end
      # return coordinates
      return [x, y]
    end
    #--------------------------------------------------------------------------
    # request_path
    #  a - character (point A) requesting a path
    #  x - x target coordinate or target character
    #  y - y target coordinate or nothing
    #  Logs requests for path finding.
    #--------------------------------------------------------------------------
    def request_path(a, x, y = nil)
      # get target coordinates from parameters
      x, y = path_requesting_parameters(x, y)
      # create requesting hash if none exists
      @request = {} if @request == nil
      # if request does not exist yet
      if a != nil && x != nil && y != nil && @request[a] == nil
        # add request
        @request[a] = PathRequest.new(a.x, a.y, x, y)
      end
    end
    #--------------------------------------------------------------------------
    # requesting
    #  char - character requesting a path
    #  Serves for quick determination if a character is waiting for a path to
    #  be calculated.
    #--------------------------------------------------------------------------
    def path_requesting?(char)
      return (@request != nil && @request[char] != nil)
    end
    #--------------------------------------------------------------------------
    # update
    #  Here is where the path calculation and observation is being done. The
    #  observer updates the data and the pathfinder calculation is being
    #  executed 5 times. It is called every frame while on the map.
    #--------------------------------------------------------------------------
    def update
      # create observer hash if none exists
      @observer = {} if @observer == nil
      # remove all observed actors that are not in the party (to save memory)
      @observer.clone.each_key {|battler|
          @observer.delete(battler) unless $game_party.actors.include?(battler)}
      # create requesting hash if none exists
      @request = {} if @request == nil
      # get an array of all requesting characters
      characters = @request.keys
      # max of 4 calculations per frame to avoid lag
      count = 4
      # start calculation
      while characters.size > 0 && count > 0
        # get a hash key
        char = characters.shift
        # do path calculation for this character and his target
        result = find_path(char)
        # if result exists, add path to character, else add character to query
        result != nil ? char.force_move = result : characters.push(char)
        # decrease countdown
        count -= 1
      end
    end
    #--------------------------------------------------------------------------
    # find_path
    #  char - character requesting a path
    #  Implementation of the A* algorithm. It tests only one node and is called
    #  only 5 times per frame to prevent lag.
    #--------------------------------------------------------------------------
    def find_path(char)
      # get pixel movement rate
      pix = $BlizzABS.pixel
      # use request
      request = @request[char]
      # if no nodes to test
      if request.open.size == 0
        # abort testing for this character
        @request.delete(char)
        # resets state
        char.ai.state = (char.ai.state == Invalid ? Return : Ready)
        # stop execution
        return []
      end
      # found
      found = false
      # find minimal key
      key = request.open.keys.min {|a, b|
          Math.hypot(a[0] - request.tx, a[1] - request.ty) <=>
          Math.hypot(b[0] - request.tx, b[1] - request.ty)}
      # this node is now logged as checked
      request.closed[key[0], key[1]] = request.open[key]
      # remove this node from the pending array
      request.open.delete(key)
      # iterate through all possible directions with relative offsets
      Cache::PathDirs.each {|dir|
          # coordinates of new position
          kx, ky = key[0] + dir[0], key[1] + dir[1]
          # if new coordinates are destination
          if kx == request.tx && ky == request.ty
            # the new node was checked
            request.closed[kx, ky] = dir[2]
            # path was found
            found = true
            # stop checking
            break
          # if new node not checked yet and coordinates are passable
          elsif request.closed[kx, ky] == 0 &&
              char.passable?(key[0] * pix, key[1] * pix, dir[2])
            # add new node to be checked
            request.open[[kx, ky]] = dir[2]
          end}
      # stop execution except if found path
      return nil unless found
      # backtrack the path
      result = request.backtrack
      # finish testing for this character
      @request.delete(char)
      # resets state
      char.ai.state = (char.ai.state == Invalid ? Return : Ready)
      # return movement command array
      return result
    end
    
  end
  
end

#==============================================================================
# module Input
#==============================================================================

module Input
  
  #----------------------------------------------------------------------------
  # Simple ASCII table
  #----------------------------------------------------------------------------
  Key = {'A' => 65, 'B' => 66, 'C' => 67, 'D' => 68, 'E' => 69, 'F' => 70, 
         'G' => 71, 'H' => 72, 'I' => 73, 'J' => 74, 'K' => 75, 'L' => 76, 
         'M' => 77, 'N' => 78, 'O' => 79, 'P' => 80, 'Q' => 81, 'R' => 82, 
         'S' => 83, 'T' => 84, 'U' => 85, 'V' => 86, 'W' => 87, 'X' => 88, 
         'Y' => 89, 'Z' => 90,
         '0' => 48, '1' => 49, '2' => 50, '3' => 51, '4' => 52, '5' => 53,
         '6' => 54, '7' => 55, '8' => 56, '9' => 57,
         'NumberPad 0' => 45, 'NumberPad 1' => 35, 'NumberPad 2' => 40,
         'NumberPad 3' => 34, 'NumberPad 4' => 37, 'NumberPad 5' => 12,
         'NumberPad 6' => 39, 'NumberPad 7' => 36, 'NumberPad 8' => 38,
         'NumberPad 9' => 33,
         'F1' => 112, 'F2' => 113, 'F3' => 114, 'F4' => 115, 'F5' => 116,
         'F6' => 117, 'F7' => 118, 'F8' => 119, 'F9' => 120, 'F10' => 121,
         'F11' => 122, 'F12' => 123,
         ';' => 186, '=' => 187, ',' => 188, '-' => 189, '.' => 190, '/' => 220,
         '\\' => 191, '\'' => 222, '[' => 219, ']' => 221, '`' => 192,
         'Backspace' => 8, 'Tab' => 9, 'Enter' => 13, 'Shift' => 16,
         'Left Shift' => 160, 'Right Shift' => 161, 'Left Ctrl' => 162,
         'Right Ctrl' => 163, 'Left Alt' => 164, 'Right Alt' => 165, 
         'Ctrl' => 17, 'Alt' => 18, 'Esc' => 27, 'Space' => 32, 'Page Up' => 33,
         'Page Down' => 34, 'End' => 35, 'Home' => 36, 'Insert' => 45,
         'Delete' => 46, 'Arrow Left' => 37, 'Arrow Up' => 38,
         'Arrow Right' => 39, 'Arrow Down' => 40,
         'Mouse Left' => 1, 'Mouse Right' => 2, 'Mouse Middle' => 4,
         'Mouse 4' => 5, 'Mouse 5' => 6}
  # default button configuration
  UP = [Key['Arrow Up']]
  LEFT = [Key['Arrow Left']]
  DOWN = [Key['Arrow Down']]
  RIGHT = [Key['Arrow Right']]
  A = [Key['Shift']]
  B = [Key['Esc'], Key['NumberPad 0'], Key['X']]
  C = [Key['Space'], Key['Enter'], Key['C']]
  X = [Key['A']]
  Y = [Key['S']]
  Z = [Key['D']]
  L = [Key['Q'], Key['Page Down']]
  R = [Key['W'], Key['Page Up']]
  F5 = [Key['F5']]
  F6 = [Key['F6']]
  F7 = [Key['F7']]
  F8 = [Key['F8']]
  F9 = [Key['F9']]
  SHIFT = [Key['Shift']]
  CTRL = [Key['Ctrl']]
  ALT = [Key['Alt']]
  # All keys
  ALL_KEYS = (0...256).to_a
  # Win32 API calls
  GetKeyboardState = Win32API.new('user32','GetKeyboardState', 'P', 'I')
  GetKeyboardLayout = Win32API.new('user32', 'GetKeyboardLayout','L', 'L')
  MapVirtualKeyEx = Win32API.new('user32', 'MapVirtualKeyEx', 'IIL', 'I')
  ToUnicodeEx = Win32API.new('user32', 'ToUnicodeEx', 'LLPPILL', 'L')
  # some other constants
  DOWN_STATE_MASK = 0x80
  DEAD_KEY_MASK = 0x80000000
  # data
  @state = "\0" * 256
  @triggered = Array.new(256, false)
  @pressed = Array.new(256, false)
  @released = Array.new(256, false)
  @repeated = Array.new(256, 0)
  #----------------------------------------------------------------------------
  # update
  #  Updates input.
  #----------------------------------------------------------------------------
  def self.update
    # get current language layout
    @language_layout = GetKeyboardLayout.call(0)
    # get new keyboard state
    GetKeyboardState.call(@state)
    # for each key
    ALL_KEYS.each {|key|
        # if pressed state
        if @state[key] & DOWN_STATE_MASK == DOWN_STATE_MASK
          # not released anymore
          @released[key] = false
          # if not pressed yet
          if !@pressed[key]
            # pressed and triggered
            @pressed[key] = true
            @triggered[key] = true
          else
            # not triggered anymore
            @triggered[key] = false
          end
          # update of repeat counter
          @repeated[key] < 17 ? @repeated[key] += 1 : @repeated[key] = 15
        # not released yet
        elsif !@released[key]
          # if still pressed
          if @pressed[key]
            # not triggered, pressed or repeated, but released
            @triggered[key] = false
            @pressed[key] = false
            @repeated[key] = 0
            @released[key] = true
          end
        else
          # not released anymore
          @released[key] = false
        end}
  end
  #----------------------------------------------------------------------------
  # dir4
  #  4 direction check.
  #----------------------------------------------------------------------------
  def Input.dir4
    return 2 if Input.press?(DOWN)
    return 4 if Input.press?(LEFT)
    return 6 if Input.press?(RIGHT)
    return 8 if Input.press?(UP)
    return 0
  end
  #----------------------------------------------------------------------------
  # dir8
  #  8 direction check.
  #----------------------------------------------------------------------------
  def Input.dir8
    down = Input.press?(DOWN)
    left = Input.press?(LEFT)
    return 1 if down && left
    right = Input.press?(RIGHT)
    return 3 if down && right
    up = Input.press?(UP)
    return 7 if up && left
    return 9 if up && right
    return 2 if down
    return 4 if left
    return 6 if right
    return 8 if up
    return 0
  end
  #----------------------------------------------------------------------------
  # trigger?
  #  Test if key was triggered once.
  #----------------------------------------------------------------------------
  def Input.trigger?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @triggered[key]}
  end
  #----------------------------------------------------------------------------
  # press?
  #  Test if key is being pressed.
  #----------------------------------------------------------------------------
  def Input.press?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @pressed[key]}
  end
  #----------------------------------------------------------------------------
  # repeat?
  #  Test if key is being pressed for repeating.
  #----------------------------------------------------------------------------
  def Input.repeat?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @repeated[key] == 1 || @repeated[key] == 16}
  end
  #----------------------------------------------------------------------------
  # release?
  #  Test if key was released.
  #----------------------------------------------------------------------------
  def Input.release?(keys)
    keys = [keys] unless keys.is_a?(Array)
    return keys.any? {|key| @released[key]}
  end
  #----------------------------------------------------------------------------
  # get_character
  #  vk - virtual key
  #  Gets the character from keyboard input using the input locale identifier
  #  (formerly called keyboard layout handles).
  #----------------------------------------------------------------------------
  def self.get_character(vk)
    # get corresponding character from virtual key
    c = MapVirtualKeyEx.call(vk, 2, @language_layout)
    # stop if character is non-printable and not a dead key
    return '' if c < 32 && (c & DEAD_KEY_MASK != DEAD_KEY_MASK)
    # get scan code
    vsc = MapVirtualKeyEx.call(vk, 0, @language_layout)
    # result string is never longer than 2 bytes (Unicode)
    result = "\0" * 2
    # get input string from Win32 API
    length = ToUnicodeEx.call(vk, vsc, @state, result, 2, 0, @language_layout)
    return (length == 0 ? '' : result)
  end
  #----------------------------------------------------------------------------
  # get_input_string
  #  Gets the string that was entered using the keyboard over the input locale
  #  identifier (formerly called keyboard layout handles).
  #----------------------------------------------------------------------------
  def self.get_input_string
    result = ''
    # check every key
    ALL_KEYS.each {|key|
        # if repeated
        if self.repeat?(key)
          # get character from keyboard state
          c = self.get_character(key)
          # add character if there is a character
          result += c if c != ''
        end}
    # empty if result is empty
    return '' if result == ''
    # convert string from Unicode to UTF-8
    return self.unicode_to_utf8(result)
  end
  #----------------------------------------------------------------------------
  # get_input_string
  #  string - string in Unicode format
  #  Converts a string from Unicode format to UTF-8 format as RGSS does not
  #  support Unicode.
  #----------------------------------------------------------------------------
  def self.unicode_to_utf8(string)
    result = ''
    string.unpack('S*').each {|c|
        # characters under 0x80 are 1 byte characters
        if c < 0x0080
          result += c.chr
        # other characters under 0x800 are 2 byte characters
        elsif c < 0x0800
          result += (0xC0 | (c >> 6)).chr
          result += (0x80 | (c & 0x3F)).chr
        # the rest are 3 byte characters
        else
          result += (0xE0 | (c >> 12)).chr
          result += (0x80 | ((c >> 12) & 0x3F)).chr
          result += (0x80 | (c & 0x3F)).chr
        end}
    return result
  end
  
end

#==============================================================================
# module Input
#------------------------------------------------------------------------------
# Added Blizz-ABS controls and control override.
#==============================================================================

module Input
  
  # Blizz-ABS control setup
  if BlizzABS::Control::CUSTOM_CONTROLS
    eval("Up       = [#{BlizzABS::Control::UP}]")
    eval("Left     = [#{BlizzABS::Control::LEFT}]")
    eval("Down     = [#{BlizzABS::Control::DOWN}]")
    eval("Right    = [#{BlizzABS::Control::RIGHT}]")
    eval("Prevpage = [#{BlizzABS::Control::PREVPAGE}]")
    eval("Nextpage = [#{BlizzABS::Control::NEXTPAGE}]")
    eval("Confirm  = [#{BlizzABS::Control::CONFIRM}]")
    eval("Cancel   = [#{BlizzABS::Control::CANCEL}]")
    eval("Attack   = [#{BlizzABS::Control::ATTACK}]")
    eval("Defend   = [#{BlizzABS::Control::DEFEND}]")
    eval("Skill    = [#{BlizzABS::Control::SKILL}]")
    eval("Item     = [#{BlizzABS::Control::ITEM}]")
    eval("Select   = [#{BlizzABS::Control::SELECT}]")
    eval("Hud      = [#{BlizzABS::Control::HUD}]")
    eval("Hotkey   = [#{BlizzABS::Control::HOTKEY}]")
    eval("Minimap  = [#{BlizzABS::Control::MINIMAP}]")
    eval("Run      = [#{BlizzABS::Control::RUN}]")
    eval("Sneak    = [#{BlizzABS::Control::SNEAK}]")
    eval("Jump     = [#{BlizzABS::Control::JUMP}]")
    eval("Turn     = [#{BlizzABS::Control::TURN}]")
  # default controls
  else
    Up       = [Key['W']]
    Left     = [Key['A']]
    Down     = [Key['S']]
    Right    = [Key['D']]
    Prevpage = [Key['Q']]
    Nextpage = [Key['E']]
    Confirm  = [Key['H']]
    Cancel   = [Key['F']]
    Attack   = [Key['K']]
    Defend   = [Key['L']]
    Skill    = [Key['J']]
    Item     = [Key['I']]
    Select   = [Key['O']]
    Hud      = [Key['Z']]
    Hotkey   = [Key['X']]
    Minimap  = [Key['C']]
    Run      = [Key['M']]
    Sneak    = [Key['.']]
    Jump     = [Key[',']]
    Turn     = [Key['U']]
  end
  if BlizzABS::Control::DISABLE_DEFAULT
    UP = Up
    LEFT = Left
    DOWN = Down
    RIGHT = Right
    B = Cancel
    C = Confirm
    L = Prevpage
    R = Nextpage
  else
    UP |= Up
    LEFT |= Left
    DOWN |= Down
    RIGHT |= Right
    B = (B - [Key['X']]) | Cancel
    C = (C - [Key['C']]) | Confirm
    L = (L - [Key['Page Down']]) | Prevpage
    R = (R - [Key['Page Up']]) | Nextpage
  end

end

#==============================================================================
# Numeric
#------------------------------------------------------------------------------
#  This class serves as superclass for all numbers. It was enhanced with a
#  utility method.
#==============================================================================

class Numeric
  
  #--------------------------------------------------------------------------
  # sgn
  #  Returns the sign of the number or 0 if the number is 0.
  #-------------------------------------------------------------------------- 
  def sgn
    return (self == 0 ? 0 : self / self.abs)
  end
  
end

#==============================================================================
# Array
#------------------------------------------------------------------------------
#  This class handles array data structures. It was modified to support the
#  utility operations sum and squares.
#==============================================================================

class Array
  
  #----------------------------------------------------------------------------
  # sum
  #  Sums up all the numeric values of the array.
  #----------------------------------------------------------------------------
  def sum
    # initialize
    sum = 0
    # add each element that's a number to sum
    self.each {|i| sum += i if i.is_a?(Numeric)}
    # return sum as float
    return sum
  end
  
end

#==============================================================================
# Hash
#------------------------------------------------------------------------------
#  This class handles hash data structures. It was modified to support the
#  utility operations sum and squares.
#==============================================================================

class Hash
  
  #----------------------------------------------------------------------------
  # sum
  #  Sums up all the numeric values of the array.
  #----------------------------------------------------------------------------
  def sum
    # initialize
    sum = 0
    # add each element that's a number to sum
    self.each_value {|i| sum += i if i.is_a?(Numeric)}
    # return sum as float
    return sum
  end
  
end

#============================================================================
# Circle
#----------------------------------------------------------------------------
#  This class represents a circle.
#============================================================================

class Circle
  
  # setting all accessible variables
  attr_accessor :x
  attr_accessor :y
  attr_accessor :radius
  attr_accessor :direction
  #--------------------------------------------------------------------------
  # Initialization
  #  x      - center x-coordinate
  #  y      - center y-coordinate
  #  radius - circle radius
  #--------------------------------------------------------------------------
  def initialize(x = 0, y = 0, radius = 1, direction = 0)
    @x, @y, @radius, @direction = x, y, radius, direction
  end
  
end

#==============================================================================
# Sprite
#------------------------------------------------------------------------------
#  This class was enhanced with quick color access, a critical animation flag
#  and special viewport coordinate calculation that is used by all HUD
#  elements.
#==============================================================================

class Sprite
  
  # setting all accessible variables
  attr_accessor :critical
  #----------------------------------------------------------------------------
  # system_color
  #  Returns the system color.
  #----------------------------------------------------------------------------
  def system_color
    return Color.new(192, 224, 255)
  end
  #----------------------------------------------------------------------------
  # normal_color
  #  Returns the normal color.
  #----------------------------------------------------------------------------
  def normal_color
    return Color.new(255, 255, 255)
  end
  #----------------------------------------------------------------------------
  # disabled_color
  #  Returns the disabled color.
  #----------------------------------------------------------------------------
  def disabled_color
    return Color.new(255, 255, 255, 128)
  end
  #----------------------------------------------------------------------------
  # crisis_color
  #  Returns the crisis color.
  #----------------------------------------------------------------------------
  def crisis_color
    return Color.new(255, 255, 64)
  end
  #----------------------------------------------------------------------------
  # knockout_color
  #  Returns the knockout color.
  #----------------------------------------------------------------------------
  def knockout_color
    return Color.new(255, 64, 0)
  end
  #----------------------------------------------------------------------------
  # vx
  #  Returns the x position on the screen.
  #----------------------------------------------------------------------------
  def vx
    return (self.x + (viewport == nil ? 0 : viewport.rect.x))
  end
  #----------------------------------------------------------------------------
  # vy
  #  Returns the y position on the screen.
  #----------------------------------------------------------------------------
  def vy
    return (self.y + (viewport == nil ? 0 : viewport.rect.y))
  end
  #----------------------------------------------------------------------------
  # vw
  #  Returns the width visible on the screen.
  #----------------------------------------------------------------------------
  def vw
    return (viewport == nil ? self.bitmap.width : viewport.rect.width)
  end
  #----------------------------------------------------------------------------
  # vh
  #  Returns the height visible on the screen.
  #----------------------------------------------------------------------------
  def vh
    return (viewport == nil ? self.bitmap.height : viewport.rect.height)
  end
  #----------------------------------------------------------------------------
  # in_screen?
  #  Checks if the sprite is visible on the screen.
  #----------------------------------------------------------------------------
  def in_screen?
    return (self.x.between?(0, 639) && (self.y-16).between?(0, 479))
  end
  
end

#==============================================================================
# RPG::Weapon
#------------------------------------------------------------------------------
#  This class was enhanced with optional data drawing either in name or in
#  description.
#==============================================================================

class RPG::Weapon
  
  #----------------------------------------------------------------------------
  # name
  #  Encapsulation of the name variable to provide the possibility of
  #  additional display.
  #----------------------------------------------------------------------------
  def name
    return $BlizzABS.util.add_weapon_text(@name, @id, 1)
  end
  #----------------------------------------------------------------------------
  # description
  #  Encapsulation of the description variable to provide the possibility of
  #  additional display.
  #----------------------------------------------------------------------------
  def description
    return $BlizzABS.util.add_weapon_text(@description, @id, 2)
  end
  
end

#==============================================================================
# RPG::Skill
#------------------------------------------------------------------------------
#  This class was enhanced with optional data drawing either in name or in
#  description.
#==============================================================================

class RPG::Skill
  
  #----------------------------------------------------------------------------
  # name
  #  Encapsulation of the name variable to provide the possibility of
  #  additional display.
  #----------------------------------------------------------------------------
  def name
    return $BlizzABS.util.add_skill_text(@name, @id, 1)
  end
  #----------------------------------------------------------------------------
  # description
  #  Encapsulation of the description variable to provide the possibility of
  #  additional display.
  #----------------------------------------------------------------------------
  def description
    return $BlizzABS.util.add_skill_text(@description, @id, 2)
  end
  
end

#==============================================================================
# RPG::Item
#------------------------------------------------------------------------------
#  This class was enhanced with optional data drawing either in name or in
#  description.
#==============================================================================

class RPG::Item
  
  #----------------------------------------------------------------------------
  # name
  #  Encapsulation of the name variable to provide the possibility of
  #  additional display.
  #----------------------------------------------------------------------------
  def name
    return $BlizzABS.util.add_item_text(@name, @id, 1)
  end
  #----------------------------------------------------------------------------
  # description
  #  Encapsulation of the description variable to provide the possibility of
  #  additional display.
  #----------------------------------------------------------------------------
  def description
    return $BlizzABS.util.add_item_text(@description, @id, 2)
  end
  
end

#============================================================================== 
# Interpreter
#------------------------------------------------------------------------------
#  This class was enhanced with battleflow controlling commands. It was also
#  enhanced to support pixel movement for the force move command in case the
#  player is affected. It was also enhanced to support Blizz-ABS battle
#  handling and ABSEAL limitation.
#============================================================================== 

class Interpreter
  
  # constants to help the user
  PARTY    = BlizzABS::PARTY
  TROOP    = BlizzABS::TROOP
  INCREASE = BlizzABS::INCREASE
  DECREASE = BlizzABS::DECREASE
  CONSTANT = BlizzABS::CONSTANT
  VARIABLE = BlizzABS::VARIABLE
  KILL     = BlizzABS::KILL
  NO_KILL  = BlizzABS::NO_KILL
  ADD      = BlizzABS::ADD
  REMOVE   = BlizzABS::REMOVE
  ATTACK   = BlizzABS::ATTACK
  DEFEND   = BlizzABS::DEFEND
  ESCAPE   = BlizzABS::ESCAPE
  SKILL    = BlizzABS::SKILL
  ITEM     = BlizzABS::ITEM
  ENEMIES  = BlizzABS::ENEMIES
  ACTORS   = BlizzABS::ACTORS
  NONE     = BlizzABS::NONE
  
  #----------------------------------------------------------------------------
  # override setup
  #----------------------------------------------------------------------------
  alias setup_blizzabs_later setup
  def setup(list, event_id, page_number)
    # call original method
    setup_blizzabs_later(list, event_id, page_number)
    # for battleflow control commands
    @SELF = @event_id
  end
  #----------------------------------------------------------------------------
  # override command_end
  #----------------------------------------------------------------------------
  alias cmd_end_blizzabs_later command_end
  def command_end
    # delete event code
    @list = nil
    # call original method if event exists and return result or return true
    return ($game_map.events[@event_id] != nil ? cmd_end_blizzabs_later : true)
  end
  #----------------------------------------------------------------------------
  # override execute_command
  #----------------------------------------------------------------------------
  alias execute_command_blizzabs_later execute_command
  def execute_command
    # if on the map
    if $scene.is_a?(Scene_Map)
      # store old in_battle flag and set to false
      flag, $game_temp.in_battle = $game_temp.in_battle, false
    end
    # call original method
    result = execute_command_blizzabs_later
    # set in_battle flag back if on the map
    $game_temp.in_battle = flag if flag != nil
    # result of the command
    return result
  end
  #----------------------------------------------------------------------------
  # override command_209
  #----------------------------------------------------------------------------
  alias cmd_209_blizzabs_later command_209
  def command_209
    # call original method
    result = cmd_209_blizzabs_later
    # if REPAIR_MOVEMENT is turned on and character is player
    if $game_system.move_fix && get_character(@parameters[0]).is_a?(Map_Battler)
      # create command list duplicate
      old_list = @parameters[1].list.clone
      # remove original command list
      @parameters[1].list = []
      # iterate through all commands
      old_list.each {|command|
          # add command to command list
          @parameters[1].list.push(command)
          # if one of the movement commands
          if command.code.between?(1, 13)
            # add pixel movement rate - 1 times to correct movement
            ($BlizzABS.pixel - 1).times{@parameters[1].list.push(command)}
          end}
    end
    # return result
    return result
  end
  
end

#==============================================================================
# Game_Temp
#------------------------------------------------------------------------------
#  This class was enhanced with a data pack that holds everything needed for
#  the character selection exception handling.
#==============================================================================

class Game_Temp
  
  attr_accessor :select_data
  attr_accessor :hud_refresh
  
end

#==============================================================================
# Game_System
#------------------------------------------------------------------------------
#  This class was enhanced with Blizz-ABS system settings, enemy creation and
#  destruction process handling.
#==============================================================================

class Game_System
  
  # setting all accessible variables
  attr_accessor :controls
  attr_accessor :auto_gameover
  attr_accessor :hud
  attr_accessor :hotkeys
  attr_accessor :minimap
  attr_accessor :move_fix
  attr_accessor :_8_way
  attr_accessor :bar_style
  attr_accessor :alignments
  attr_accessor :blizzabs
  attr_accessor :respawn_time
  attr_accessor :attack_button
  attr_accessor :defend_button
  attr_accessor :skill_button
  attr_accessor :item_button
  attr_accessor :select_button
  attr_accessor :hud_button
  attr_accessor :hotkey_button
  attr_accessor :minimap_button
  attr_accessor :turn_button
  attr_accessor :running_button
  attr_accessor :sneaking_button
  attr_accessor :jumping_button
  attr_reader   :killed
  attr_reader   :caterpillar
  attr_reader   :caterpillar_active
  attr_reader   :pixel_rate
  attr_reader   :bar_opacity
  # compatibility with ccoa's UMS
  attr_accessor :ums_mode
  #----------------------------------------------------------------------------
  # override initiliaze
  #----------------------------------------------------------------------------
  alias init_blizzabs_later initialize
  def initialize
    # call original method
    init_blizzabs_later
    # turn HUD on, Hotkey Assignment Display off and Minimap off
    @hud, @hotkeys, @minimap = true, false, 0
    # set auto gameover
    @auto_gameover = BlizzABS::Config::AUTO_GAMEOVER
    # set movement fix
    @move_fix = BlizzABS::Config::REPAIR_MOVEMENT
    # set 8-way movement
    @_8_way = BlizzABS::Config::EIGHT_WAY_MOVEMENT
    # set respawn time
    @respawn_time = BlizzABS::Config::RESPAWN_TIME
    # all action buttons available
    @attack_button = @defend_button = @skill_button = @item_button =
        @select_button = @hud_button = @hotkey_button = @minimap_button =
        @turn_button = true
    # movement buttons available depending on their configuration
    @running_button = (BlizzABS::Config::RUN_SPEED > 0)
    @sneaking_button = (BlizzABS::Config::SNEAK_SPEED > 0)
    @jumping_button = (BlizzABS::Config::JUMPING > 0)
    # set caterpillar
    @caterpillar = BlizzABS::Config::CATERPILLAR
    # set caterpillar active
    @caterpillar_active = true
    # set pixel movement rate
    self.pixel_rate = BlizzABS::Config::PIXEL_MOVEMENT_RATE
    # set up alignments
    @alignments = {}
    # create all initial alignment group setups
    BlizzABS::Alignments::GROUPS.each {|id|
        @alignments[id] = BlizzABS::AlignmentData.new(id)}
    # reset ABS data
    reset_abs_data
  end
  #----------------------------------------------------------------------------
  # override update
  #----------------------------------------------------------------------------
  alias upd_blizzabs_later update
  def update
    # call original method
    upd_blizzabs_later
    # delete removed alignment groups
    (@alignments.keys - BlizzABS::Alignments::GROUPS).each {|id|
        @alignments.delete(id)}
    # add all new alignment groups
    (BlizzABS::Alignments::GROUPS - @alignments.keys).each {|id|
        @alignments[id] = BlizzABS::AlignmentData.new(id)}
    # update Blizz-ABS Processor
    $BlizzABS.update
  end
  #----------------------------------------------------------------------------
  # caterpillar_active=
  #  Sets the caterpillar active mode.
  #----------------------------------------------------------------------------
  def caterpillar_active=(val)
    # dismantle caterpillar if deactivating
    $BlizzABS.actors.each {|actor| actor.remove_from_caterpillar} unless val
    # set new value
    @caterpillar_active = val
  end
  #----------------------------------------------------------------------------
  # caterpillar=
  #  Sets the caterpillar value and makes sure that the displayed characters
  #  are being refreshed.
  #----------------------------------------------------------------------------
  def caterpillar=(val)
    # if value has changed
    if @caterpillar != val
      # set new value
      @caterpillar = val
      # refresh player
      $game_player.refresh
    end
  end
  #----------------------------------------------------------------------------
  # pixel_rate=
  #  val - new pixel movement rate
  #  Changes the pixel movement rate is necessary.
  #----------------------------------------------------------------------------
  def pixel_rate=(val)
    if val > 5
      @pixel_rate = 5
    elsif val < 0
      @pixel_rate = 0
    else
      @pixel_rate = val
    end
  end
  #----------------------------------------------------------------------------
  # add_battlers_number
  #  group - group of the battler
  #  val   - the value to add
  #  Adds a count to the battler group count.
  #----------------------------------------------------------------------------
  def add_battler_number(group, val)
    @battlers_number[group] = battlers_number_group(group) + val
    @battlers_number[group] = 0 if @battlers_number[group] < 0
  end
  #----------------------------------------------------------------------------
  # battlers_number
  #  Returns the number of battlers on the current map.
  #----------------------------------------------------------------------------
  def battlers_number
    return @battlers_number.sum
  end
  #----------------------------------------------------------------------------
  # battlers_number_group
  #  group - group of the battler
  #  Returns the number of battlers on the current map from a specific type.
  #----------------------------------------------------------------------------
  def battlers_number_group(group)
    return (@battlers_number[group] != nil ? @battlers_number[group] : 0)
  end
  #----------------------------------------------------------------------------
  # reset_abs_data
  #  Resets ABS map data.
  #----------------------------------------------------------------------------
  def reset_abs_data
    # reset killed battlers arrays and the counters
    @killed, @battlers_number = {}, {}
  end
  
end

#==============================================================================
# Game_Screen
#------------------------------------------------------------------------------
#  This class was modified to correctly update pictures.
#==============================================================================

class Game_Screen
  
  #--------------------------------------------------------------------------
  # override update
  #--------------------------------------------------------------------------
  alias upd_blizzabs_later update
  def update
    # if on the map
    if $scene.is_a?(Scene_Map)
      # store old in_battle flag and set to false
      flag, $game_temp.in_battle = $game_temp.in_battle, false
    end
    # call original method
    upd_blizzabs_later
    # set in_battle flag back if on the map
    $game_temp.in_battle = flag if $scene.is_a?(Scene_Map)
  end
  
end

#==============================================================================
# Game_BattleAction
#------------------------------------------------------------------------------
#  This class was modified to prevent a bug where deciding a random target
#  for an enemy would cause the action to be cleared.
#==============================================================================

class Game_BattleAction
  
  #--------------------------------------------------------------------------
  # decide_random_target_for_enemy
  #  Dummy method.
  #--------------------------------------------------------------------------
  def decide_random_target_for_enemy
  end
  
end

#==============================================================================
# Game_Battler
#------------------------------------------------------------------------------
#  This class was enhanced with helping variables and methods.
#==============================================================================

class Game_Battler
  
  # setting all accessible variables
  attr_accessor :group
  attr_accessor :state_time
  attr_writer   :hpdamage
  attr_writer   :spdamage
  #----------------------------------------------------------------------------
  # override hp=
  #----------------------------------------------------------------------------
  alias hp_is_blizzabs_later hp=
  def hp=(val)
    # store difference
    @hpdamage = @hp-val
    # call original method
    hp_is_blizzabs_later(val)
  end
  #----------------------------------------------------------------------------
  # override sp=
  #----------------------------------------------------------------------------
  alias sp_is_blizzabs_later sp=
  def sp=(val)
    # store difference
    @spdamage = @sp-val
    # call original method
    sp_is_blizzabs_later(val)
  end
  #----------------------------------------------------------------------------
  # hpdamage
  #  Returns hpdamage encapsulated.
  #----------------------------------------------------------------------------
  def hpdamage
    return (@hpdamage == nil ? 0 : @hpdamage)
  end
  #----------------------------------------------------------------------------
  # spdamage
  #  Returns spdamage encapsulated.
  #----------------------------------------------------------------------------
  def spdamage
    return (@spdamage == nil ? 0 : @spdamage)
  end
  
end

#============================================================================== 
# Game_Actor
#------------------------------------------------------------------------------
#  This class was enhanced with helping variables and methods.
#============================================================================== 

class Game_Actor
  
  # setting all accessible variables
  attr_accessor :skill
  attr_accessor :item
  attr_accessor :offensive
  attr_accessor :aggressive
  attr_reader   :skill_hotkeys
  attr_reader   :item_hotkeys
  attr_reader   :force_offensive
  attr_reader   :force_aggressive
  attr_reader   :triggers
  #----------------------------------------------------------------------------
  # override setup
  #----------------------------------------------------------------------------
  alias setup_blizzabs_later setup
  def setup(id)
    # call original method
    setup_blizzabs_later(id)
    # skill and item IDs on hotkeys
    @skill, @item = 0, 0
    # skills -> skill ID on key index
    @skill_hotkeys = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    # items -> item ID on key index
    @item_hotkeys = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    # last known level
    @old_level = @level
    # normal AI setup attributes
    @offensive, @aggressive, @force_offensive, @force_aggressive = 8, 8, 0, 0
    # hash for state time
    @state_time = {}
    # trigger AI conditions
    @triggers = []
  end
  #----------------------------------------------------------------------------
  # force_offensive=
  #  Encapsulation method that corrects the offensive attribute's value.
  #----------------------------------------------------------------------------
  def force_offensive=(val)
    if val > 15
      @force_offensive = 15
    elsif val < 0
      @force_offensive = 0
    else
      @force_offensive = val
    end
  end 
  #----------------------------------------------------------------------------
  # force_aggressive=
  #  Encapsulation method that corrects the aggressive attribute's value.
  #----------------------------------------------------------------------------
  def force_aggressive=(val)
    if val > 15
      @force_aggressive = 15
    elsif val < 0
      @force_aggressive = 0
    else
      @force_aggressive = val
    end
  end 
  #----------------------------------------------------------------------------
  # now_exp
  #  Returns the current EXP as number.
  #----------------------------------------------------------------------------
  def now_exp
    return (@exp - @exp_list[@level])
  end 
  #----------------------------------------------------------------------------
  # next_exp
  #  Returns the EXP needed to level up or 0 is there are no more levels.
  #----------------------------------------------------------------------------
  def next_exp
    return (@exp_list[@level+1] > 0 ? @exp_list[@level+1]-@exp_list[@level] : 0)
  end
  #----------------------------------------------------------------------------
  # full_next_exp
  #  Returns the EXP needed to reach the next level.
  #----------------------------------------------------------------------------
  def full_next_exp
    return (@exp_list[@level+1] > 0 ? @exp_list[@level+1] : 0)
  end
  #----------------------------------------------------------------------------
  # level_up?
  #  Compares current level to lastly known level and returns a level up.
  #----------------------------------------------------------------------------
  def level_up?
    # result of level up and set current level is now last known level
    result, @old_level = (@old_level < @level), @level
    # return result
    return result
  end
  
end

#==============================================================================
# Game_Enemy
#------------------------------------------------------------------------------
#  This class was enhanced with helping variables.
#==============================================================================

class Game_Enemy
  
  # setting all accessible variables
  attr_writer :enemy_id
  #----------------------------------------------------------------------------
  # Override Initialization
  #  enemy - enemy in the database
  #----------------------------------------------------------------------------
  alias init_blizzabs_later initialize
  def initialize(enemy, other = nil)
    # if Blizz-ABS enemy initialization
    if other == nil
      # call superclass method
      super()
      # the enemy ID, no troop and not member in troop
      @enemy_id, @troop_id, @member_index = enemy.id, 0, 0
      # battler spriteset name and spriteset hue
      @battler_name, @battler_hue = enemy.battler_name, enemy.battler_hue
      # current HP and SP
      @hp, @sp = maxhp, maxsp
      # not hidden and not immortal
      @hidden = @immortal = false
    else
      # call normal enemy initialization
      init_blizzabs_later(enemy, other)
    end
    # hash for state time
    @state_time = {}
  end
  
end

#==============================================================================
# Game_Map
#------------------------------------------------------------------------------
#  This class was redefined by large parts for pixel movement handling and
#  quick minimap passability access.
#==============================================================================

class Game_Map
  
  # setting all accessible variables
  attr_reader :virtual_passability
  attr_reader :map
  attr_reader :respawns
  #----------------------------------------------------------------------------
  # override setup
  #----------------------------------------------------------------------------
  alias setup_blizzabs_later setup
  def setup(map_id)
    # array of Respawn Points
    @respawns = []
    # call original method
    setup_blizzabs_later(map_id)
    # setup enemies on the map
    $BlizzABS.battlers_refresh
    # if using the intelligent minimap system
    if BlizzABS::Config::INTELLIGENT_PASSABILITY && File.exist?('Data/Map_Data.abs')
      # load virtual passability map from file
      @virtual_passability = load_data('Data/Map_Data.abs')[0][map_id]
    else
      # create virtual passability map
      @virtual_passability = $BlizzABS.util.setup_passability(@map)
    end
    # reset remotes, damage and beam sprites and clear observation data
    $BlizzABS.cache.clean
  end
  #----------------------------------------------------------------------------
  # events_only
  #  Returns an array of events that have no battler.
  #----------------------------------------------------------------------------
  def events_only
    return (@events.values - self.battlers)
  end
  #----------------------------------------------------------------------------
  # battlers
  #  Returns an array of all map battlers.
  #----------------------------------------------------------------------------
  def battlers
    return (@events.values.find_all {|e| e.is_a?(Map_Battler)})
  end
  #----------------------------------------------------------------------------
  # battlers_group
  #  group - alignment group of the battler
  #  Returns an array of map battlers from a specific alignment group.
  #----------------------------------------------------------------------------
  def battlers_group(group)
    return (battlers.find_all {|battler| battler.ai.group == group})
  end
  #----------------------------------------------------------------------------
  # battlers_in_range
  #  Checks how many battler instances are within ABSEAL range.
  #----------------------------------------------------------------------------
  def battlers_in_range
    return (battlers.find_all {|battler| battler.valid? && battler.update?})
  end
  #----------------------------------------------------------------------------
  # rename_event
  #  id   - event ID
  #  name - new name for the event
  #  Allows the renaming of specific events and applies Blizz-ABS update
  #  handling.
  #----------------------------------------------------------------------------
  def rename_event(id, name)
    # stop if event doesn't exist
    return if @events[id] == nil
    # set new name
    self.map.events[id].name = name
    # store old event
    character = @events[id]
    # update event by using name
    $BlizzABS.check_event_name(id)
    # clone position of the old character
    @events[id].clone_position(character)
    # stop if scene not Scene_Map or spriteset doesn't exist
    return if !$scene.is_a?(Scene_Map) || $scene.spriteset == nil
    # find this event's sprite
    $scene.spriteset.character_sprites.each {|sprite|
        # if sprite found
        if sprite.character == character
          # dispose old sprites
          sprite.dispose
          # set new character
          sprite.character = @events[id]
          # update sprite
          sprite.update
          # event found, stop here
          break
        end}
  end
  #----------------------------------------------------------------------------
  # self_valid?
  #  x - x-coordinate
  #  y - y-coordinate
  #  Checks if coordinates are valid. (pixel movement)
  #----------------------------------------------------------------------------
  def self_valid?(x, y)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # checks if coordinates are valid
    return (x >= 0 && x < width * pix - pix + 1 && y >= 0 && y < height * pix - pix + 1)
  end
  #----------------------------------------------------------------------------
  # direction_valid?
  #  x - x-coordinate
  #  y - y-coordinate
  #  Checks if coordinates are valid. (pixel movement)
  #----------------------------------------------------------------------------
  def direction_valid?(x, y)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # checks if coordinates are valid
    return (x >= 0 && x < width * pix && y >= 0 && y < height * pix)
  end
  #----------------------------------------------------------------------------
  # self_passable?
  #  x          - x-coordinate
  #  y          - y-coordinate
  #  d          - direction
  #  self_event - self event
  #  Checks if passable. (pixel movement)
  #----------------------------------------------------------------------------
  def self_passable?(x, y, d, self_event)
    # get pixel movement rate and set bit
    pix, bit = $BlizzABS.pixel, (1 << (d / 2 - 1)) & 0x0F
    # if not in horizontal center of 32x32 pixel tile
    if x != x / pix * pix
      # if current two tiles are impassable from one to another
      unless direction_passable?(x / pix * pix, y, 6) &&
          direction_passable?((x + pix) / pix * pix, y, 4)
        # impassable
        return false
      end
    end
    # if not in vertical center of 32x32 pixel tile
    if y != y / pix * pix
      # if current two tiles are impassable from one to another
      unless direction_passable?(x, y / pix * pix, 2) &&
          direction_passable?(x, (y + pix) / pix * pix, 8)
        # impassable
        return false
      end
    end
    # if jumping
    if d == 0
      # return passability on forced jump location or in any direction
      return (BlizzABS::Config::ALLOW_JUMP_TAGS.include?(
          $game_map.terrain_tag(x / pix, y / pix)) ||
          direction_passable?(x, y + pix - 1, 2) ||
          direction_passable?(x, y, 4) ||
          direction_passable?(x + pix - 1, y, 6) ||
          direction_passable?(x, y, 8))
    end
    # if changing tile and either no tile or no event exception
    if changing_tiles(x, y, d) && (!tile_exception(x, y, d) ||
        !event_exception(x, y, d, bit))
      # impassable
      return false
    end
    # iterate through all corners
    (0...4).each {|i|
        # gets coordinates to check
        xr, yr = x + (pix - 1) * (i % 2), y + (pix - 1) * (i / 2)
        # unless checking event and checking tile
        unless event_check(xr, yr, d, self_event) && tile_check(xr, yr, d)
          # impassable
          return false
        end}
    # passable
    return true
  end
  #----------------------------------------------------------------------------
  # direction_passable?
  #  x          - x-coordinate
  #  y          - y-coordinate
  #  d          - direction
  #  self_event - self event
  #  Checks if passable. (pixel movement)
  #----------------------------------------------------------------------------
  def direction_passable?(x, y, d)
    # impassable if coordinates not valid
    return false unless direction_valid?(x, y)
    # return event check and tile check result
    return (event_check(x, y, d) && tile_check(x, y, d))
  end
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
        if event.character_name != "" && event.x == x / pix && 
           event.y == y / pix && !event.through &&
           (!self_event.is_a?(Map_Battler) || event.tile_id >= 384)
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
  #----------------------------------------------------------------------------
  # tile_check
  #  x - x-coordinate
  #  y - y-coordinate
  #  d - direction
  #  Checks if passable tile. (pixel movement)
  #----------------------------------------------------------------------------
  def tile_check(x, y, d)
    # get pixel movement rate and set bit
    pix, bit = $BlizzABS.pixel, (1 << (d / 2 - 1)) & 0x0F
    # passable if virtual passability works
    return true if ($game_map.virtual_passability[x / pix, y / pix] & bit != 0x00)
    # get x and y of next tile
    case d
    when 2 then nx, ny = x / pix, (y + 1) / pix
    when 4 then nx, ny = (x - 1) / pix, y / pix
    when 6 then nx, ny = (x + 1) / pix, y / pix
    when 8 then nx, ny = x / pix, (y - 1) / pix
    else
      nx = ny = nil
    end
    # passable if still on the same tile
    return (x / pix == nx && y / pix == ny)
  end
  #----------------------------------------------------------------------------
  # event_exception
  #  x          - x-coordinate
  #  y          - y-coordinate
  #  d          - direction
  #  bit        - passability attributes
  #  Checks if passable events. (pixel movement)
  #----------------------------------------------------------------------------
  def event_exception(x, y, d, bit)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # iterate trough all events
    self.events_only.each {|event|
        # if there's an event that's a tile and not through
        if !event.through && event.tile_id >= 384
          # get data depending on direction
          case d
          when 2
            x1, y1, bit1 = x / pix, (y + pix) / pix, 0x04
            x2, y2, bit2 = (x + pix) / pix, y1, 0x02
          when 4
            x1, y1, bit1 = (x - pix) / pix, y / pix, 0x01
            x2, y2, bit2 = x1, (y + pix) / pix, 0x08
          when 6
            x1, y1, bit1 = (x + pix) / pix, y / pix, 0x01
            x2, y2, bit2 = x1, (y + pix) / pix, 0x08
          when 8
            x1, y1, bit1 = x / pix, (y - pix) / pix, 0x04
            x2, y2, bit2 = (x + pix) / pix, y1, 0x02
          end
          # temporary variable
          passage = @passages[event.tile_id]
          # if tile is at right position and impassable
          if event.x == x1 && event.y == y1 && passage & bit1 == bit1 ||
              event.x == x2 && event.y == y2 && passage & bit2 == bit2
            # impassable
            return false
          end
        end}
    # passable
    return true
  end
  #----------------------------------------------------------------------------
  # tile_exception
  #  x       - x-coordinate
  #  y       - y-coordinate
  #  d       - direction
  #  Checks if passable when changing tiles. (pixel movement)
  #----------------------------------------------------------------------------
  def tile_exception(x, y, d)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # check direction and return map passability depending on direction
    return case d
    when 2
      (($game_map.virtual_passability[x / pix, (y + pix) / pix] & 0x04 == 0x04) &&
      ($game_map.virtual_passability[(x + pix) / pix, (y + pix) / pix] & 0x02 == 0x02))
    when 4
      (($game_map.virtual_passability[(x - pix) / pix, y / pix] & 0x01 == 0x01) &&
      ($game_map.virtual_passability[(x - pix) / pix, (y + pix) / pix] & 0x08 == 0x08))
    when 6
      (($game_map.virtual_passability[(x + pix) / pix, y / pix] & 0x01 == 0x01) &&
      ($game_map.virtual_passability[(x + pix) / pix, (y + pix) / pix] & 0x08 == 0x08))
    when 8
      (($game_map.virtual_passability[x / pix, (y - pix) / pix] & 0x04 == 0x04) &&
      ($game_map.virtual_passability[(x + pix) / pix, (y - pix) / pix] & 0x02 == 0x02))
    end
  end
  #----------------------------------------------------------------------------
  # changing_tiles
  #  x       - x-coordinate
  #  y       - y-coordinate
  #  d       - direction
  #  Checks if changing tiles. (pixel movement)
  #----------------------------------------------------------------------------
  def changing_tiles(x, y, d)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if not changing the tile (up/down)
    if (y / pix != (y + pix - 1) / pix || x / pix == (x + pix - 1) / pix) &&
        (d == 2 || d == 8)
      # not changing 
      return false
    end
    # if not changing the tile (left/right)
    if (x / pix != (x + pix - 1) / pix || y / pix == (y + pix - 1) / pix) &&
        (d == 4 || d == 6)
      # not changing 
      return false
    end
    # changing
    return true
  end
  #----------------------------------------------------------------------------
  # pixel_counter?
  #  x - x-coordinate
  #  y - y-coordinate
  #  Checks if counter. (pixel movement)
  #----------------------------------------------------------------------------
  def pixel_counter?(x, y)
    # no counter if map ID is invalid
    return false if @map_id == 0
    # get pixel movement rate and initialize result
    pix, result = $BlizzABS.pixel, false
    # iterate through all layers and check each modified tile (pixel movement)
    BlizzABS::Cache::MapLayers.each {|i| (0...pix).each {|j| (0...pix).each {|k|
              # if tile is not valid ID
              if data[(x+j)/pix, (y+k)/pix, i] == nil
                # no counter
                return false
              # if counter bit is set
              elsif @passages[data[(x+j)/pix, (y+k)/pix, i]] & 0x80 == 0x80
                # counter
                result = true
              else
                # no counter
                return false
              end}}
          # return the result
          return result}
    # no counter
    return false
  end
  #----------------------------------------------------------------------------
  # pixel_bush?
  #  x - x-coordinate
  #  y - y-coordinate
  #  Checks if bush. (pixel movement)
  #----------------------------------------------------------------------------
  def pixel_bush?(x, y)
    # no bush if map ID is invalid
    return false if @map_id == 0
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # iterate through all layers
    BlizzABS::Cache::MapLayers.each {|i|
        # if tile ID not valid
        if data[(x+pix/2)/pix, (y+pix/2)/pix, i] == nil
          # no bush
          return false
        # if bush bit is set
        elsif @passages[data[(x+pix/2)/pix, (y+pix/2)/pix, i]] & 0x40 == 0x40
          # bush
          return true
        end}
    # no bush
    return false
  end
  #----------------------------------------------------------------------------
  # jump_passable?
  #  x  - x-coordinate
  #  y  - y-coordinate
  #  nx - new x-coordinate
  #  ny - new y-coordinate
  #  Checks if there is a tile with NO_JUMP_TAGS or WALL_TAGS tag, so jumping
  #  isn't possible.
  #----------------------------------------------------------------------------
  def jump_passable?(x, y, nx, ny)
    # passable if tags are not being used at all (to save process time)
    return true if BlizzABS::Config::NO_JUMP_TAGS.size == 0
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # get jump direction
    xdir, ydir = (nx - x).sgn, (ny - y).sgn
    # iterate
    loop do
      # if tile has one of the terrain tags
      if BlizzABS::Config::NO_JUMP_TAGS.include?(terrain_tag(x / pix, y / pix))
        # impassable 
        return false
      # if all tiles are passable
      elsif x == nx && y == ny
      # passable
        return true
      end
      # next tile
      x += xdir * pix
      y += ydir * pix
    end
  end
  #----------------------------------------------------------------------------
  # event_passable?
  #  x - x-coordinate
  #  y - y-coordinate
  #  Checks if the given tile is passable in any direction right now.
  #----------------------------------------------------------------------------
  def event_passable?(x, y)
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # iterate trough all events
    self.events_only.each {|event|
        # if there's an event that's no enemy/actor/dropped item and not through
        if event.tile_id >= 0 && event.x == x / pix && event.y == y / pix &&
            !event.through
          # if obstacle bit is set
          if @passages[event.tile_id] & 0x0F == 0x0F
            # impassable tile in the given direction
            return false
          # if priority is 0
          elsif @priorities[event.tile_id] == 0
            # passable in the given direction
            return true
          end
        end}
    # passable
    return true
  end
  
end
  
#==============================================================================
# Game_Party
#------------------------------------------------------------------------------
#  This class was redefined to create characters used by the caterpillar and to
#  delete all remotes when a saved game was loaded.
#==============================================================================

class Game_Party
  
  #----------------------------------------------------------------------------
  # override setup_starting_members
  #----------------------------------------------------------------------------
  alias setup_starting_members_blizzabs_later setup_starting_members
  def setup_starting_members
    # call original method
    setup_starting_members_blizzabs_later
    # initialize caterpillar
    $BlizzABS.init_caterpillar
  end
  #----------------------------------------------------------------------------
  # override refresh
  #----------------------------------------------------------------------------
  alias refresh_blizzabs_later refresh
  def refresh
    # call original method
    refresh_blizzabs_later
    # reset remotes and damage sprites
    $BlizzABS.cache.clean
    # reinitialize caterpillar
    $BlizzABS.init_caterpillar
  end
  
end

#==============================================================================
# Game_Character
#------------------------------------------------------------------------------
#  This class was redefined to support name event command input, looping
#  animations, ABSEAL update limitation and relational movement commands.
#==============================================================================

class Game_Character
  
  # constants to help the user
  PARTY    = BlizzABS::PARTY
  TROOP    = BlizzABS::TROOP
  INCREASE = BlizzABS::INCREASE
  DECREASE = BlizzABS::DECREASE
  CONSTANT = BlizzABS::CONSTANT
  VARIABLE = BlizzABS::VARIABLE
  KILL     = BlizzABS::KILL
  NO_KILL  = BlizzABS::NO_KILL
  ADD      = BlizzABS::ADD
  REMOVE   = BlizzABS::REMOVE
  ATTACK   = BlizzABS::ATTACK
  DEFEND   = BlizzABS::DEFEND
  ESCAPE   = BlizzABS::ESCAPE
  SKILL    = BlizzABS::SKILL
  ITEM     = BlizzABS::ITEM
  ENEMIES  = BlizzABS::ENEMIES
  ACTORS   = BlizzABS::ACTORS
  NONE     = BlizzABS::NONE
  # setting all accessible variables
  attr_accessor :erased
  attr_accessor :loop_animation_id
  attr_accessor :terminate
  attr_accessor :teleport
  attr_accessor :icondrop
  attr_reader   :move_route
  attr_reader   :move_type
  attr_reader   :pattern_size
  #----------------------------------------------------------------------------
  # override initialize
  #----------------------------------------------------------------------------
  alias init_blizzabs_later initialize
  def initialize
    # call original method
    init_blizzabs_later
    # set loop animation
    @loop_animation_id = 0
    # default number of frames on a spriteset
    @pattern_size = 4
    # last moving flag
    @last_moving = false
  end
  #----------------------------------------------------------------------------
  # update?
  #  Checks whether the character should be updated or not.
  #----------------------------------------------------------------------------
  def update?
    # if this map has ABSEAL disabled or it's the player or an actor
    if BlizzABS::Config::DISABLE_ANTILAG_IDS.include?($game_map.map_id)
      # update
      return true
    end
    # if auto-start or parallel process or excluded from ABSEAL
    if @trigger == 3 || @trigger == 4 || self.name.clone.gsub!('\\eal') {''}
      # update
      return true
    end
    # if autokiller is on and no character sprite and no tile sprite
    if BlizzABS::Config::ABSEAL_AUTOKILL && @character_name == '' &&
        @tile_id < 384 && !@teleport
      # don't update
      return false
    end
    # check ABSEAL range
    return in_abseal_range?
  end
  #----------------------------------------------------------------------------
  # in_abseal_range?
  #  Checks if the character is within ABSEAL range.
  #----------------------------------------------------------------------------
  def in_abseal_range?
    # correct value out of range for ABSEAL factor
    factor = BlizzABS::Config::ABSEAL_FACTOR < 1 ? 1 :
        BlizzABS::Config::ABSEAL_FACTOR.to_i
    # don't update if outside of screen (left, up, right, down)
    return false if @real_x < $game_map.display_x - factor * 128
    return false if @real_y < $game_map.display_y - factor * 128
    return false if @real_x >= $game_map.display_x + 2560 + factor * 128
    return false if @real_y >= $game_map.display_y + 1920 + factor * 128
    # update
    return true
  end
  #----------------------------------------------------------------------------
  # clone_position
  #  character - the other character
  #  Sets own position to that of the other character with correction of pixel
  #  movement.
  #----------------------------------------------------------------------------
  def clone_position(character)
    # copy real_x and real_y
    @real_x, @real_y = character.real_x, character.real_y
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if battler and not battler before
    if self.is_a?(Map_Battler) && !character.is_a?(Map_Battler)
      # copy coordinates with correction
      @x, @y = character.x * pix, character.y * pix
    # if not battler and battler before
    elsif !self.is_a?(Map_Battler) && character.is_a?(Map_Battler)
      # copy coordinates with correction
      @x, @y = character.x / pix, character.y / pix
    else
      # just copy coordinates
      @x, @y = character.x, character.y
    end
  end
  #----------------------------------------------------------------------------
  # name
  #  Returns the event's name if the is one.
  #----------------------------------------------------------------------------
  def name
    return (@event != nil ? @event.name : '')
  end
  #----------------------------------------------------------------------------
  # move_toward_player
  #  Rerouting method.
  #----------------------------------------------------------------------------
  def move_toward_player
    move_toward($game_player)
  end
  #----------------------------------------------------------------------------
  # move_away_from_player
  #  Rerouting method.
  #----------------------------------------------------------------------------
  def move_away_from_player
    move_away_from($game_player)
  end
  #----------------------------------------------------------------------------
  # turn_toward_player
  #  Rerouting method.
  #----------------------------------------------------------------------------
  def turn_toward_player
    turn_toward($game_player)
  end
  #----------------------------------------------------------------------------
  # turn_away_from_player
  #  Rerouting method.
  #----------------------------------------------------------------------------
  def turn_away_from_player
    turn_away_from($game_player)
  end
  #----------------------------------------------------------------------------
  # move_toward
  #  character - the character
  #  Moves towards a character. (pixel movement)
  #----------------------------------------------------------------------------
  def move_toward(character)
    # calculate differences in x and y
    dx, dy = @real_x - character.real_x, @real_y - character.real_y
    # determines where to move according to the x and y differences
    if dx > 0 && dy > 0 # player is up left
      move_upper_left
    elsif dx > 0 && dy < 0 # player is down left
      move_lower_left
    elsif dx < 0 && dy > 0 # player is up right
      move_upper_right
    elsif dx < 0 && dy < 0 # player is down right
      move_lower_right
    elsif dx < 0 && dy == 0 # player is right
      move_right
    elsif dx > 0 && dy == 0 # player is left
      move_left
    elsif dx == 0 && dy < 0 # player is down
      move_down
    elsif dx == 0 && dy > 0 # player is up
      move_up
    end
  end
  #----------------------------------------------------------------------------
  # move_away_from
  #  character - the character
  #  Moves away from a character. (pixel movement)
  #----------------------------------------------------------------------------
  def move_away_from(character)
    # calculate differences in x and y
    dx, dy = @real_x - character.real_x, @real_y - character.real_y
    # determines where to move according to the x and y differences
    if dx > 0 && dy > 0 # character is up left
      move_lower_right
    elsif dx > 0 && dy < 0 # character is down left
      move_upper_right
    elsif dx < 0 && dy > 0 # character is up right
      move_lower_left
    elsif dx < 0 && dy < 0 # character is down right
      move_upper_left
    elsif dx < 0 && dy == 0 # character is right
      move_left
    elsif dx > 0 && dy == 0 # character is left
      move_right
    elsif dx == 0 && dy < 0 # character is down
      move_up
    elsif dx == 0 && dy > 0 # character is up
      move_down
    end
  end
  #----------------------------------------------------------------------------
  # move_away_random
  #  character    - the character
  #  turn_enabled - determines whether the character should turn as well
  #  distance     - distance
  #  Moves away from a character randomly. (pixel movement)
  #----------------------------------------------------------------------------
  def move_away_random(character, turn_enabled = true, distance = 1)
    # calculate differences in x and y
    dx, dy = @real_x - character.real_x, @real_y - character.real_y
    # array of directions
    dirs = ($game_system._8_way ? [1, 2, 3, 4, 6, 7, 8, 9] : [2, 4, 6, 8])
    # determines where can't move according to the x and y differences
    if dx > 0 && dy > 0 # character is up left
      dirs -= [4, 7, 8]
    elsif dx > 0 && dy < 0 # character is down left
      dirs -= [1, 2, 4]
    elsif dx < 0 && dy > 0 # character is up right
      dirs -= [6, 8, 9]
    elsif dx < 0 && dy < 0 # character is down right
      dirs -= [2, 3, 6]
    elsif dx < 0 && dy == 0 # character is right
      dirs -= [3, 6, 9]
    elsif dx > 0 && dy == 0 # character is left
      dirs -= [1, 4, 7]
    elsif dx == 0 && dy < 0 # character is down
      dirs -= [1, 2, 3]
    elsif dx == 0 && dy > 0 # character is up
      dirs -= [7, 8, 9]
    end
    # choose a random direction from available directions
    return case dirs[rand(dirs.size)]
    when 1 then distance.to_i.times {move_lower_left}
    when 2 then distance.to_i.times {move_down(turn_enabled)}
    when 3 then distance.to_i.times {move_lower_right}
    when 4 then distance.to_i.times {move_left(turn_enabled)}
    when 6 then distance.to_i.times {move_right(turn_enabled)}
    when 7 then distance.to_i.times {move_upper_left}
    when 8 then distance.to_i.times {move_up(turn_enabled)}
    when 9 then distance.to_i.times {move_upper_right}
    end
  end
  #----------------------------------------------------------------------------
  # turn_toward
  #  character - the character
  #  Turn towards a character. (pixel movement)
  #----------------------------------------------------------------------------
  def turn_toward(character)
    # calculate differences in x and y
    dx, dy = @real_x - character.real_x, @real_y - character.real_y
    # determines where to turn according to the x and y differences
    if dx < 0 && dx.abs >= dy.abs # character is right
      turn_right
    elsif dx > 0 && dx.abs >= dy.abs # character is left
      turn_left
    elsif dy < 0 # character is down
      turn_down
    elsif dy > 0 # character is up
      turn_up
    end
  end
  #----------------------------------------------------------------------------
  # turn_away_from
  #  character - the character
  #  Turn away from a character. (pixel movement)
  #----------------------------------------------------------------------------
  def turn_away_from(character)
    # calculate differences in x and y
    dx, dy = @real_x - character.real_x, @real_y - character.real_y
    # determines where to turn according to the x and y differences
    if dx < 0 && dx.abs >= dy.abs # character is right
      turn_left
    elsif dx > 0 && dx.abs >= dy.abs # character is left
      turn_right
    elsif dy < 0 # character is down
      turn_up
    elsif dy > 0 # character is up
      turn_down
    end
  end
  #----------------------------------------------------------------------------
  # dropped?
  #  Checks if the character is a dropped event.
  #----------------------------------------------------------------------------
  def dropped?
    return (@terminate_count != nil)
  end
  
end

#==============================================================================
# Game_Event
#------------------------------------------------------------------------------
#  This class was redefined as non-pixel movement character to support pixel
#  movement from other character types and ABSEAL update limitation in case
#  Tons of Add-ons is not available.
#==============================================================================

class Game_Event
  
  # setting all accessible variables
  attr_accessor :respawn_ids
  attr_accessor :respawn_time
  attr_accessor :icon
  attr_reader   :event
  attr_writer   :lock_time
  #----------------------------------------------------------------------------
  # override update
  #----------------------------------------------------------------------------
  alias upd_player_blizzabs_later update
  def update
    # if event lock exists, not expired and no other event is running
    if @event_lock != nil && @event_lock > 0 &&
        !$game_system.map_interpreter.running?
      # decrease event lock timer
      @event_lock -= 1
    end
    # if termination counter exists
    if @terminate_count != nil
      # decrease stay time if stay time is greater than 0
      @terminate_count -= 1 if @terminate_count > 0
      # set deletion flag if item taken or stay time expired
      erase if @terminate_count <= 0
    end
    # call original method if within ABSEAL range
    upd_player_blizzabs_later if update?
  end
  #----------------------------------------------------------------------------
  # override refresh
  #  A flag addition was added to this method.
  #----------------------------------------------------------------------------
  alias refresh_blizzabs_later refresh
  def refresh
    # call original method
    refresh_blizzabs_later
    # test command list on teleport command if command list exists
    @teleport = (@list != nil && @list.any? {|i| i.code == 201})
    # activate drop mode if dropped
    activate_drop_mode if dropped?
  end
  #----------------------------------------------------------------------------
  # override start
  #  Has been enhanced to support the event lock feature.
  #----------------------------------------------------------------------------
  alias start_blizzabs_later start
  def start
    # stop if event lock not expired yet
    return if @event_lock != nil && @event_lock > 0
    # call original method
    start_blizzabs_later
    # set event lock if activated by touch
    @event_lock = @lock_time if @trigger == 1 || @trigger == 2
  end
  #----------------------------------------------------------------------------
  # override erase
  #----------------------------------------------------------------------------
  alias erase_blizzabs_later erase
  def erase
    @terminate = true
    erase_blizzabs_later
  end
  #----------------------------------------------------------------------------
  # passable?
  #  x - x-coordinate
  #  y - y-coordinate
  #  d - facing direction
  #  Checks if the tile is passable.
  #----------------------------------------------------------------------------
  def passable?(x, y, d)
    # get new coordinates
    nx, ny = x+(d == 6 ? 1 : d == 4 ? -1 : 0), y+(d == 2 ? 1 : d == 8 ? -1 : 0)
    # not passable if coordinates are outside of map
    return false unless $game_map.valid?(nx, ny)
    # passable if through is ON
    return true if @through
    # not passable if unable to leave current tile in designated direction
    return false unless $game_map.passable?(x, y, d, self)
    # not passable if unable to enter move tile in designated direction
    return false unless $game_map.passable?(nx, ny, 10 - d)
    # if any event on new position and not through
    if $game_map.events_only.any? {|event|
        !event.through && event.x == nx && event.y == ny}
      # impassable
      return false
    end
    # passable if no spriteset
    return true if @character_name == ''
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # rectangle
    rect = Rect.new(nx * pix, ny * pix, pix, pix)
    # if any battler in the way
    if ($BlizzABS.battlers + $game_map.battlers).any? {|battler|
        !battler.through && battler.character_name != '' &&
        $BlizzABS.util.rect_intersection(rect,
        Rect.new(battler.x, battler.y, pix, pix))}
      # impassable
      return false
    end
    # passable
    return true
  end
  #----------------------------------------------------------------------------
  # check_event_trigger_touch
  #  x - x-coordinate
  #  y - y-coordinate
  #  Check event if was triggered by touch. (pixel movement)
  #----------------------------------------------------------------------------
  def check_event_trigger_touch(x, y)
    # stop check if map interpreter is already running
    return false if $game_system.map_interpreter.running? || @trigger != 2
    # get pixel movement rate
    pix = $BlizzABS.pixel
    # if player touched this event and not jumping and not over_trigger
    if !jumping? && !over_trigger? &&
        $BlizzABS.util.rect_intersection(Rect.new(x * pix, y * pix, pix, pix),
        Rect.new($game_player.x, $game_player.y, pix, pix))
      # start
      #raise @trigger.to_s
      start
      # started
      return true
    end
    # not started
    return false
  end
  #----------------------------------------------------------------------------
  # check_event_trigger_auto
  #  Check event if was triggered automatically. (pixel movement)
  #----------------------------------------------------------------------------
  def check_event_trigger_auto
    # if triggered by event touch
    if @trigger == 2
      # check player touch
      return check_event_trigger_at($game_player.x, $game_player.y)
    # if autorun
    elsif @trigger == 3
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
        Rect.new(@x * pix, @y * pix, pix, pix), Rect.new(x, y, pix, pix))
      # start
      start
      # started
      return true
    end
    # not started
    return false
  end
  #----------------------------------------------------------------------------
  # set_real_position
  #  real_x - new real x-coordinate
  #  real_y - new real y-coordinate
  #  Sets the real positions of the event.
  #----------------------------------------------------------------------------
  def set_real_position(real_x, real_y)
    @real_x, @real_y = real_x, real_y
  end
  #----------------------------------------------------------------------------
  # activate_drop_mode
  #  time - countdown timer
  #  Sets up everything for an event to act like a dropped event.
  #----------------------------------------------------------------------------
  def activate_drop_mode(time = @terminate_count)
    # set disappearance counter
    @terminate_count = time
    # set moving speed
    @move_speed = 6
    # set moving frequency
    @move_frequency = 6
    # set step anime
    @step_anime = true
    # set direction fix
    @direction_fix = true
  end

end
