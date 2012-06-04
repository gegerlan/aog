#===============================================================================
# Filename:    rgss_rpg.rb
#
# Description: This file contains the default implementations of all of the
#    RGSS classes in the RPG module.  They are needed here because we use them
#    outside of RMXP to dump and load the .rxdata files.
#===============================================================================

module RPG
  class Actor
	def initialize
	  @id = 0
	  @name = ""
	  @class_id = 1
	  @initial_level = 1
	  @final_level = 99
	  @exp_basis = 30
	  @exp_inflation = 30
	  @character_name = ""
	  @character_hue = 0
	  @battler_name = ""
	  @battler_hue = 0
	  @parameters = Table.new(6,100)
	  for i in 1..99
		@parameters[0,i] = 500+i*50
		@parameters[1,i] = 500+i*50
		@parameters[2,i] = 50+i*5
		@parameters[3,i] = 50+i*5
		@parameters[4,i] = 50+i*5
		@parameters[5,i] = 50+i*5
	  end
	  @weapon_id = 0
	  @armor1_id = 0
	  @armor2_id = 0
	  @armor3_id = 0
	  @armor4_id = 0
	  @weapon_fix = false
	  @armor1_fix = false
	  @armor2_fix = false
	  @armor3_fix = false
	  @armor4_fix = false
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :class_id
	attr_accessor :initial_level
	attr_accessor :final_level
	attr_accessor :exp_basis
	attr_accessor :exp_inflation
	attr_accessor :character_name
	attr_accessor :character_hue
	attr_accessor :battler_name
	attr_accessor :battler_hue
	attr_accessor :parameters
	attr_accessor :weapon_id
	attr_accessor :armor1_id
	attr_accessor :armor2_id
	attr_accessor :armor3_id
	attr_accessor :armor4_id
	attr_accessor :weapon_fix
	attr_accessor :armor1_fix
	attr_accessor :armor2_fix
	attr_accessor :armor3_fix
	attr_accessor :armor4_fix
  end
  
  class Animation
	def initialize
	  @id = 0
	  @name = ""
	  @animation_name = ""
	  @animation_hue = 0
	  @position = 1
	  @frame_max = 1
	  @frames = [RPG::Animation::Frame.new]
	  @timings = []
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :animation_name
	attr_accessor :animation_hue
	attr_accessor :position
	attr_accessor :frame_max
	attr_accessor :frames
	attr_accessor :timings

	class Frame
	  def initialize
		@cell_max = 0
		@cell_data = Table.new(0, 0)
	  end
	  attr_accessor :cell_max
	  attr_accessor :cell_data
	end

	class Timing
	  def initialize
		@frame = 0
		@se = RPG::AudioFile.new("", 80)
		@flash_scope = 0
		@flash_color = Color.new(255,255,255,255)
		@flash_duration = 5
		@condition = 0
	  end
	  attr_accessor :frame
	  attr_accessor :se
	  attr_accessor :flash_scope
	  attr_accessor :flash_color
	  attr_accessor :flash_duration
	  attr_accessor :condition
	end
  end
  
  class Armor
	def initialize
	  @id = 0
	  @name = ""
	  @icon_name = ""
	  @description = ""
	  @kind = 0
	  @auto_state_id = 0
	  @price = 0
	  @pdef = 0
	  @mdef = 0
	  @eva = 0
	  @str_plus = 0
	  @dex_plus = 0
	  @agi_plus = 0
	  @int_plus = 0
	  @guard_element_set = []
	  @guard_state_set = []
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :icon_name
	attr_accessor :description
	attr_accessor :kind
	attr_accessor :auto_state_id
	attr_accessor :price
	attr_accessor :pdef
	attr_accessor :mdef
	attr_accessor :eva
	attr_accessor :str_plus
	attr_accessor :dex_plus
	attr_accessor :agi_plus
	attr_accessor :int_plus
	attr_accessor :guard_element_set
	attr_accessor :guard_state_set
  end
  
  class AudioFile
	def initialize(name = "", volume = 100, pitch = 100)
	  @name = name
	  @volume = volume
	  @pitch = pitch
	end
	attr_accessor :name
	attr_accessor :volume
	attr_accessor :pitch
  end
  
  class Class
	def initialize
	  @id = 0
	  @name = ""
	  @position = 0
	  @weapon_set = []
	  @armor_set = []
	  @element_ranks = Table.new(1)
	  @state_ranks = Table.new(1)
	  @learnings = []
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :position
	attr_accessor :weapon_set
	attr_accessor :armor_set
	attr_accessor :element_ranks
	attr_accessor :state_ranks
	attr_accessor :learnings

	class Learning
	  def initialize
		@level = 1
		@skill_id = 1
	  end
	  attr_accessor :level
	  attr_accessor :skill_id
	end
  end
  
  class CommonEvent
	def initialize
	  @id = 0
	  @name = ""
	  @trigger = 0
	  @switch_id = 1
	  @list = [RPG::EventCommand.new]
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :trigger
	attr_accessor :switch_id
	attr_accessor :list
  end
  
  class Enemy
	def initialize
	  @id = 0
	  @name = ""
	  @battler_name = ""
	  @battler_hue = 0
	  @maxhp = 500
	  @maxsp = 500
	  @str = 50
	  @dex = 50
	  @agi = 50
	  @int = 50
	  @atk = 100
	  @pdef = 100
	  @mdef = 100
	  @eva = 0
	  @animation1_id = 0
	  @animation2_id = 0
	  @element_ranks = Table.new(1)
	  @state_ranks = Table.new(1)
	  @actions = [RPG::Enemy::Action.new]
	  @exp = 0
	  @gold = 0
	  @item_id = 0
	  @weapon_id = 0
	  @armor_id = 0
	  @treasure_prob = 100
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :battler_name
	attr_accessor :battler_hue
	attr_accessor :maxhp
	attr_accessor :maxsp
	attr_accessor :str
	attr_accessor :dex
	attr_accessor :agi
	attr_accessor :int
	attr_accessor :atk
	attr_accessor :pdef
	attr_accessor :mdef
	attr_accessor :eva
	attr_accessor :animation1_id
	attr_accessor :animation2_id
	attr_accessor :element_ranks
	attr_accessor :state_ranks
	attr_accessor :actions
	attr_accessor :exp
	attr_accessor :gold
	attr_accessor :item_id
	attr_accessor :weapon_id
	attr_accessor :armor_id
	attr_accessor :treasure_prob

	class Action
	  def initialize
		@kind = 0
		@basic = 0
		@skill_id = 1
		@condition_turn_a = 0
		@condition_turn_b = 1
		@condition_hp = 100
		@condition_level = 1
		@condition_switch_id = 0
		@rating = 5
	  end
	  attr_accessor :kind
	  attr_accessor :basic
	  attr_accessor :skill_id
	  attr_accessor :condition_turn_a
	  attr_accessor :condition_turn_b
	  attr_accessor :condition_hp
	  attr_accessor :condition_level
	  attr_accessor :condition_switch_id
	  attr_accessor :rating
	end
  end
  
  class Event
	def initialize(x, y)
	  @id = 0
	  @name = ""
	  @x = x
	  @y = y
	  @pages = [RPG::Event::Page.new]
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :x
	attr_accessor :y
	attr_accessor :pages

	class Page
	  def initialize
		@condition = RPG::Event::Page::Condition.new
		@graphic = RPG::Event::Page::Graphic.new
		@move_type = 0
		@move_speed = 3
		@move_frequency = 3
		@move_route = RPG::MoveRoute.new
		@walk_anime = true
		@step_anime = false
		@direction_fix = false
		@through = false
		@always_on_top = false
		@trigger = 0
		@list = [RPG::EventCommand.new]
	  end
	  attr_accessor :condition
	  attr_accessor :graphic
	  attr_accessor :move_type
	  attr_accessor :move_speed
	  attr_accessor :move_frequency
	  attr_accessor :move_route
	  attr_accessor :walk_anime
	  attr_accessor :step_anime
	  attr_accessor :direction_fix
	  attr_accessor :through
	  attr_accessor :always_on_top
	  attr_accessor :trigger
	  attr_accessor :list

	  class Condition
		def initialize
		  @switch1_valid = false
		  @switch2_valid = false
		  @variable_valid = false
		  @self_switch_valid = false
		  @switch1_id = 1
		  @switch2_id = 1
		  @variable_id = 1
		  @variable_value = 0
		  @self_switch_ch = "A"
		end
		attr_accessor :switch1_valid
		attr_accessor :switch2_valid
		attr_accessor :variable_valid
		attr_accessor :self_switch_valid
		attr_accessor :switch1_id
		attr_accessor :switch2_id
		attr_accessor :variable_id
		attr_accessor :variable_value
		attr_accessor :self_switch_ch
	  end

	  class Graphic
		def initialize
		  @tile_id = 0
		  @character_name = ""
		  @character_hue = 0
		  @direction = 2
		  @pattern = 0
		  @opacity = 255
		  @blend_type = 0
		end
		attr_accessor :tile_id
		attr_accessor :character_name
		attr_accessor :character_hue
		attr_accessor :direction
		attr_accessor :pattern
		attr_accessor :opacity
		attr_accessor :blend_type
	  end
	end
  end
  
  class EventCommand
	def initialize(code = 0, indent = 0, parameters = [])
	  @code = code
	  @indent = indent
	  @parameters = parameters
	end
	attr_accessor :code
	attr_accessor :indent
	attr_accessor :parameters
  end
  
  class Item
	def initialize
	  @id = 0
	  @name = ""
	  @icon_name = ""
	  @description = ""
	  @scope = 0
	  @occasion = 0
	  @animation1_id = 0
	  @animation2_id = 0
	  @menu_se = RPG::AudioFile.new("", 80)
	  @common_event_id = 0
	  @price = 0
	  @consumable = true
	  @parameter_type = 0
	  @parameter_points = 0
	  @recover_hp_rate = 0
	  @recover_hp = 0
	  @recover_sp_rate = 0
	  @recover_sp = 0
	  @hit = 100
	  @pdef_f = 0
	  @mdef_f = 0
	  @variance = 0
	  @element_set = []
	  @plus_state_set = []
	  @minus_state_set = []
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :icon_name
	attr_accessor :description
	attr_accessor :scope
	attr_accessor :occasion
	attr_accessor :animation1_id
	attr_accessor :animation2_id
	attr_accessor :menu_se
	attr_accessor :common_event_id
	attr_accessor :price
	attr_accessor :consumable
	attr_accessor :parameter_type
	attr_accessor :parameter_points
	attr_accessor :recover_hp_rate
	attr_accessor :recover_hp
	attr_accessor :recover_sp_rate
	attr_accessor :recover_sp
	attr_accessor :hit
	attr_accessor :pdef_f
	attr_accessor :mdef_f
	attr_accessor :variance
	attr_accessor :element_set
	attr_accessor :plus_state_set
	attr_accessor :minus_state_set
  end
  
  class Map
	def initialize(width, height)
	  @tileset_id = 1
	  @width = width
	  @height = height
	  @autoplay_bgm = false
	  @bgm = RPG::AudioFile.new
	  @autoplay_bgs = false
	  @bgs = RPG::AudioFile.new("", 80)
	  @encounter_list = []
	  @encounter_step = 30
	  @data = Table.new(width, height, 3)
	  @events = {}
	end
	attr_accessor :tileset_id
	attr_accessor :width
	attr_accessor :height
	attr_accessor :autoplay_bgm
	attr_accessor :bgm
	attr_accessor :autoplay_bgs
	attr_accessor :bgs
	attr_accessor :encounter_list
	attr_accessor :encounter_step
	attr_accessor :data
	attr_accessor :events
  end
  
  class MapInfo
	def initialize
	  @name = ""
	  @parent_id = 0
	  @order = 0
	  @expanded = false
	  @scroll_x = 0
	  @scroll_y = 0
	end
	attr_accessor :name
	attr_accessor :parent_id
	attr_accessor :order
	attr_accessor :expanded
	attr_accessor :scroll_x
	attr_accessor :scroll_y
  end
  
  class MoveRoute
	def initialize
	  @repeat = true
	  @skippable = false
	  @list = [RPG::MoveCommand.new]
	end
	attr_accessor :repeat
	attr_accessor :skippable
	attr_accessor :list
  end

  class MoveCommand
	def initialize(code = 0, parameters = [])
	  @code = code
	  @parameters = parameters
	end
	attr_accessor :code
	attr_accessor :parameters
  end
  
  class Skill
	def initialize
	  @id = 0
	  @name = ""
	  @icon_name = ""
	  @description = ""
	  @scope = 0
	  @occasion = 1
	  @animation1_id = 0
	  @animation2_id = 0
	  @menu_se = RPG::AudioFile.new("", 80)
	  @common_event_id = 0
	  @sp_cost = 0
	  @power = 0
	  @atk_f = 0
	  @eva_f = 0
	  @str_f = 0
	  @dex_f = 0
	  @agi_f = 0
	  @int_f = 100
	  @hit = 100
	  @pdef_f = 0
	  @mdef_f = 100
	  @variance = 15
	  @element_set = []
	  @plus_state_set = []
	  @minus_state_set = []
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :icon_name
	attr_accessor :description
	attr_accessor :scope
	attr_accessor :occasion
	attr_accessor :animation1_id
	attr_accessor :animation2_id
	attr_accessor :menu_se
	attr_accessor :common_event_id
	attr_accessor :sp_cost
	attr_accessor :power
	attr_accessor :atk_f
	attr_accessor :eva_f
	attr_accessor :str_f
	attr_accessor :dex_f
	attr_accessor :agi_f
	attr_accessor :int_f
	attr_accessor :hit
	attr_accessor :pdef_f
	attr_accessor :mdef_f
	attr_accessor :variance
	attr_accessor :element_set
	attr_accessor :plus_state_set
	attr_accessor :minus_state_set
  end
  
  class State
	def initialize
	  @id = 0
	  @name = ""
	  @animation_id = 0
	  @restriction = 0
	  @nonresistance = false
	  @zero_hp = false
	  @cant_get_exp = false
	  @cant_evade = false
	  @slip_damage = false
	  @rating = 5
	  @hit_rate = 100
	  @maxhp_rate = 100
	  @maxsp_rate = 100
	  @str_rate = 100
	  @dex_rate = 100
	  @agi_rate = 100
	  @int_rate = 100
	  @atk_rate = 100
	  @pdef_rate = 100
	  @mdef_rate = 100
	  @eva = 0
	  @battle_only = true
	  @hold_turn = 0
	  @auto_release_prob = 0
	  @shock_release_prob = 0
	  @guard_element_set = []
	  @plus_state_set = []
	  @minus_state_set = []
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :animation_id
	attr_accessor :restriction
	attr_accessor :nonresistance
	attr_accessor :zero_hp
	attr_accessor :cant_get_exp
	attr_accessor :cant_evade
	attr_accessor :slip_damage
	attr_accessor :rating
	attr_accessor :hit_rate
	attr_accessor :maxhp_rate
	attr_accessor :maxsp_rate
	attr_accessor :str_rate
	attr_accessor :dex_rate
	attr_accessor :agi_rate
	attr_accessor :int_rate
	attr_accessor :atk_rate
	attr_accessor :pdef_rate
	attr_accessor :mdef_rate
	attr_accessor :eva
	attr_accessor :battle_only
	attr_accessor :hold_turn
	attr_accessor :auto_release_prob
	attr_accessor :shock_release_prob
	attr_accessor :guard_element_set
	attr_accessor :plus_state_set
	attr_accessor :minus_state_set
  end
  
  class System
	def initialize
	  @magic_number = 0
	  @party_members = [1]
	  @elements = [nil, ""]
	  @switches = [nil, ""]
	  @variables = [nil, ""]
	  @windowskin_name = ""
	  @title_name = ""
	  @gameover_name = ""
	  @battle_transition = ""
	  @title_bgm = RPG::AudioFile.new
	  @battle_bgm = RPG::AudioFile.new
	  @battle_end_me = RPG::AudioFile.new
	  @gameover_me = RPG::AudioFile.new
	  @cursor_se = RPG::AudioFile.new("", 80)
	  @decision_se = RPG::AudioFile.new("", 80)
	  @cancel_se = RPG::AudioFile.new("", 80)
	  @buzzer_se = RPG::AudioFile.new("", 80)
	  @equip_se = RPG::AudioFile.new("", 80)
	  @shop_se = RPG::AudioFile.new("", 80)
	  @save_se = RPG::AudioFile.new("", 80)
	  @load_se = RPG::AudioFile.new("", 80)
	  @battle_start_se = RPG::AudioFile.new("", 80)
	  @escape_se = RPG::AudioFile.new("", 80)
	  @actor_collapse_se = RPG::AudioFile.new("", 80)
	  @enemy_collapse_se = RPG::AudioFile.new("", 80)
	  @words = RPG::System::Words.new
	  @test_battlers = []
	  @test_troop_id = 1
	  @start_map_id = 1
	  @start_x = 0
	  @start_y = 0
	  @battleback_name = ""
	  @battler_name = ""
	  @battler_hue = 0
	  @edit_map_id = 1
	end
	attr_accessor :magic_number
	attr_accessor :party_members
	attr_accessor :elements
	attr_accessor :switches
	attr_accessor :variables
	attr_accessor :windowskin_name
	attr_accessor :title_name
	attr_accessor :gameover_name
	attr_accessor :battle_transition
	attr_accessor :title_bgm
	attr_accessor :battle_bgm
	attr_accessor :battle_end_me
	attr_accessor :gameover_me
	attr_accessor :cursor_se
	attr_accessor :decision_se
	attr_accessor :cancel_se
	attr_accessor :buzzer_se
	attr_accessor :equip_se
	attr_accessor :shop_se
	attr_accessor :save_se
	attr_accessor :load_se
	attr_accessor :battle_start_se
	attr_accessor :escape_se
	attr_accessor :actor_collapse_se
	attr_accessor :enemy_collapse_se
	attr_accessor :words
	attr_accessor :test_battlers
	attr_accessor :test_troop_id
	attr_accessor :start_map_id
	attr_accessor :start_x
	attr_accessor :start_y
	attr_accessor :battleback_name
	attr_accessor :battler_name
	attr_accessor :battler_hue
	attr_accessor :edit_map_id

	class Words
	  def initialize
		@gold = ""
		@hp = ""
		@sp = ""
		@str = ""
		@dex = ""
		@agi = ""
		@int = ""
		@atk = ""
		@pdef = ""
		@mdef = ""
		@weapon = ""
		@armor1 = ""
		@armor2 = ""
		@armor3 = ""
		@armor4 = ""
		@attack = ""
		@skill = ""
		@guard = ""
		@item = ""
		@equip = ""
	  end
	  attr_accessor :gold
	  attr_accessor :hp
	  attr_accessor :sp
	  attr_accessor :str
	  attr_accessor :dex
	  attr_accessor :agi
	  attr_accessor :int
	  attr_accessor :atk
	  attr_accessor :pdef
	  attr_accessor :mdef
	  attr_accessor :weapon
	  attr_accessor :armor1
	  attr_accessor :armor2
	  attr_accessor :armor3
	  attr_accessor :armor4
	  attr_accessor :attack
	  attr_accessor :skill
	  attr_accessor :guard
	  attr_accessor :item
	  attr_accessor :equip
	end

	class TestBattler
	  def initialize
		@actor_id = 1
		@level = 1
		@weapon_id = 0
		@armor1_id = 0
		@armor2_id = 0
		@armor3_id = 0
		@armor4_id = 0
	  end
	  attr_accessor :actor_id
	  attr_accessor :level
	  attr_accessor :weapon_id
	  attr_accessor :armor1_id
	  attr_accessor :armor2_id
	  attr_accessor :armor3_id
	  attr_accessor :armor4_id
	end
  end
  
  class Tileset
	def initialize
	  @id = 0
	  @name = ""
	  @tileset_name = ""
	  @autotile_names = [""]*7
	  @panorama_name = ""
	  @panorama_hue = 0
	  @fog_name = ""
	  @fog_hue = 0
	  @fog_opacity = 64
	  @fog_blend_type = 0
	  @fog_zoom = 200
	  @fog_sx = 0
	  @fog_sy = 0
	  @battleback_name = ""
	  @passages = Table.new(384)
	  @priorities = Table.new(384)
	  @priorities[0] = 5
	  @terrain_tags = Table.new(384)
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :tileset_name
	attr_accessor :autotile_names
	attr_accessor :panorama_name
	attr_accessor :panorama_hue
	attr_accessor :fog_name
	attr_accessor :fog_hue
	attr_accessor :fog_opacity
	attr_accessor :fog_blend_type
	attr_accessor :fog_zoom
	attr_accessor :fog_sx
	attr_accessor :fog_sy
	attr_accessor :battleback_name
	attr_accessor :passages
	attr_accessor :priorities
	attr_accessor :terrain_tags
  end
  
  class Troop
	def initialize
	  @id = 0
	  @name = ""
	  @members = []
	  @pages = [RPG::BattleEventPage.new]
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :members
	attr_accessor :pages

	class Member
	  def initialize
		@enemy_id = 1
		@x = 0
		@y = 0
		@hidden = false
		@immortal = false
	  end
	  attr_accessor :enemy_id
	  attr_accessor :x
	  attr_accessor :y
	  attr_accessor :hidden
	  attr_accessor :immortal
	end

	class Page
	  def initialize
		@condition = RPG::Troop::Page::Condition.new
		@span = 0
		@list = [RPG::EventCommand.new]
	  end
	  attr_accessor :condition
	  attr_accessor :span
	  attr_accessor :list

	  class Condition
		def initialize
		  @turn_valid = false
		  @enemy_valid = false
		  @actor_valid = false
		  @switch_valid = false
		  @turn_a = 0
		  @turn_b = 0
		  @enemy_index = 0
		  @enemy_hp = 50
		  @actor_id = 1
		  @actor_hp = 50
		  @switch_id = 1
		end
		attr_accessor :turn_valid
		attr_accessor :enemy_valid
		attr_accessor :actor_valid
		attr_accessor :switch_valid
		attr_accessor :turn_a
		attr_accessor :turn_b
		attr_accessor :enemy_index
		attr_accessor :enemy_hp
		attr_accessor :actor_id
		attr_accessor :actor_hp
		attr_accessor :switch_id
	  end
	end
  end
  
  class Weapon
	def initialize
	  @id = 0
	  @name = ""
	  @icon_name = ""
	  @description = ""
	  @animation1_id = 0
	  @animation2_id = 0
	  @price = 0
	  @atk = 0
	  @pdef = 0
	  @mdef = 0
	  @str_plus = 0
	  @dex_plus = 0
	  @agi_plus = 0
	  @int_plus = 0
	  @element_set = []
	  @plus_state_set = []
	  @minus_state_set = []
	end
	attr_accessor :id
	attr_accessor :name
	attr_accessor :icon_name
	attr_accessor :description
	attr_accessor :animation1_id
	attr_accessor :animation2_id
	attr_accessor :price
	attr_accessor :atk
	attr_accessor :pdef
	attr_accessor :mdef
	attr_accessor :str_plus
	attr_accessor :dex_plus
	attr_accessor :agi_plus
	attr_accessor :int_plus
	attr_accessor :element_set
	attr_accessor :plus_state_set
	attr_accessor :minus_state_set
  end
end
