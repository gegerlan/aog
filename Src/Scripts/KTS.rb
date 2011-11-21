#==============================================================================
# � Kylock's Time System VX 1.5 MOD V.1.1
#     6.3.2008                 30.5.2009
#------------------------------------------------------------------------------
#  Script by: Kylock
#  MOD by reijubv
#==============================================================================
# MOD changelog :
# > V.1.0 (24/5/2009) = Initial release
# > V.1.1 (30/5/2009) = Now with season and auto weather feature
#==============================================================================
# Remember Pokemon games real time system?
# This mod (modification) version of KTS will do the same!
# This fan made mod for Kylock's Time System VX 1.5 will adjust the
# game time automatically to be same as real world's time.
#------------------------------------------------------------------------------
# Actually, this mod will takes the time format from your PC and uses it in the
# Script, in 24 hours format.
# With this mod, you can make events only occurs once a week or whatever....
#------------------------------------------------------------------------------
# NOTES:
# 1. Don't use the normal KTS with this one!
# 2. $kts.go,$kts.stop, kts.sec(n),$kts.hours(n),$kts.days(n),$kts.jump_to_hour(n)
#    are all deleted in this mod.
# 3. START_DAY, START_HOUR, AMPM, DAYNAMES and SPEED variables are also deleted.
# 4. 8 new variables to use :
#    a. WEEKDAY = 0 to 6 (Day index in one week)
#    b. MONTH   = 1 to 12
#    c. MONTHNAM= Jan, Feb, May, etc..
#    d. MONTHDAY= 1 to 31
#    e. YEAR    = 1994, 2009, etc
#    f. SEASON  = Season Name (Summer, Spring, ETC)
#    g. WEATHERN= Weather's name
#    h. WEATHER = Weather Id, 0 is clear weather
# 5. 4 new switches to use :
#    a. SPRING  = This switch is on during spring season 
#    b. SUMMER  = This switch is on during summer season 
#    c. FALL    = This switch is on during fall season 
#    d. WINTER  = This switch is on during winter season 
#===============================================================================
# Credit mainly goes to Kylock
# and then.  reijubv
# (Cuz I think I deserve something better than just a "thanks"..)
# Have a nice day!
#===============================================================================
# ? Auto-tone Instructions
#------------------------------------------------------------------------------
#    Maps designated as outdoors are the only maps to be affected by this
#  scripts use of auto-toning.  To signify a map to be "outdoors", you must
#  include [KTS] In the name of the map.  For example, you world map could be
#  named "World Map [KTS]" or "[KTS] World Map".  Provisions are made later in
#  the script to remove [KTS] from the map name when it's read by another
#  script.  This means that "[KTS]" won't show up in your Map Name Popup
#  windows.
#==============================================================================
# ? Game Database Setup
#------------------------------------------------------------------------------
#    This script, by defult, uses the following game variables and switches:
#  Database Variables:
#    [1] The Current Time
#    [2] The Current Second
#    [3] The Current Minute
#    [4] The Current Hour
#    [5] The Current Day
#    [6] Name of the Current Day (abbreviated)
#    [7] The Current Day index in one week (0-6) a week starts from sunday
#    [8] The Current Month
#    [9] The Current Month's name (abbreviated)
#    [10]The Current Day Id in this Month (1-32,or 1-30,or 1-29)
#    [11]The Current Year
#    [12]Season's name
#    [13]Weather's Name
#    [14]Weather Id, 0 is clear weather..
#  Database Switches
#    [1] ON during night hours   (2200-0400)(10pm-4am)
#    [2] ON during dawn hours    (0500-0800)( 5am-8am)
#    [3] ON during daytime hours (0900-1800)( 9am-6pm)
#    [4] ON during sunset hours  (1900-2100)( 7pm-9pm)
#    [5] ON during spring season 
#    [6] ON during summer season
#    [7] ON during fall season
#    [8] ON during winter season
#==============================================================================

#==============================================================================
# Stores variables and user defined settings for the time system.
#==============================================================================
module KTS
  # Sets the speed multiplier of the clock.  1 is real time.  A higher
  #   value will give you a faster clock.  Default is 100.
  SPEED      = 180
  #-----------------------------------------------------------------------
  # Settings for Time Periods
  #-----------------------------------------------------------------------
  T1 = [ 0,4 ] # Night         # Sets time periods for tinting effects
  T2 = [ 5,8 ] # Dawn          # [Start Hour, End Hour] for time period
  T3 = [ 9,17] # Day           # Use 24-hour values for time periods
  T4 = [18,20] # Sunset
  T5 = [21,24] # Night         # <- Ex: Night is between 23:00 and 24:00
  #-----------------------------------------------------------------------
  # Settings for Output to Game Variables option.
  #-----------------------------------------------------------------------
  # Set this to true to output the current time to game variables.
  DATABASE_OUTPUT = true
    # Game Variable to be used for time output.
    TIME    = 51 #(Time in string format. Ex: "2:48 AM" or "02:48")
    SECONDS = 52 # 1 to 59
    MINUTES = 53 # 1 to 59
    HOURS   = 54 # 1 to 24
    DAYS    = 55 # 1 to 366
    DAYNAME = 56 # Sun, Mon, etc..
    WEEKDAY = 57 # 0 to 6 (Day index in one week)
    MONTH   = 58 # 1 to 12
    MONTHNAM= 59 # Jan, Feb, May, etc..
    MONTHDAY= 60 # 1 to 31
    YEAR    = 61# 1994, 2009, etc
    SEASON  = 62# Season Name (Summer, Spring, ETC)
    WEATHERN= 63# Weather's name
    WEATHER = 64# Weather Id, 0 is clear weather
    # Game Switches to be used for time output.
    NIGHT   = 176 # This switch is on during night hours   (2200-0400)(10pm-4am)
    DAWN    = 177 # This switch is on during dawn hours    (0500-0800)( 5am-8am)
    DAY     = 178 # This switch is on during daytime hours (0900-1800)( 9am-6pm)
    SUNSET  = 179 # This switch is on during sunset hours  (1900-2100)( 7pm-9pm)
    SPRING  = 180 # This switch is on during spring season 
    SUMMER  = 181 # This switch is on during summer season 
    FALL    = 182 # This switch is on during fall season 
    WINTER  = 183 # This switch is on during winter season 
    
    START_HOUR = 10
    START_DAY = 1
  #-----------------------------------------------------------------------
  # Settings for time controlled screen toning
  #-----------------------------------------------------------------------
  # True will enable screen toning to be used by the script.
  USE_TONE = true
  # Sets the duration of tone changes (in frames)
  FADE_LENGTH = 240
  # Defines tones to be used in the corresponding time periods defined above.
  #              RED, GREEN, BLUE, GREY
  C1 = Tone.new(-187,  -119,  -17,  68)
  C2 = Tone.new(  17,   -51, -102,   0)
  C3 = Tone.new(   0,     0,    0,   0)
  C4 = Tone.new( -68,  -136,  -34,   0)
  C5 = Tone.new(-187,  -119,  -17,  68)
  # Defines anti-tones
  A1 = Tone.new( 187,   119,   17, -68)
  A2 = Tone.new( -17,    51,  102,   0)
  A3 = Tone.new(   0,     0,    0,   0)
  A4 = Tone.new(  68,   136,   34,   0)
  A5 = Tone.new( 187,   119,   17, -68)
  #-----------------------------------------------------------------------
  # MOD
  #-----------------------------------------------------------------------
  #-----------------------------------------------------------------------
  # Settings for season periods
  #-----------------------------------------------------------------------
  S1 = [ 1,3 ] # Spring        # Sets month periods for season system
  S2 = [ 4,6 ] # Summer        # [Start Month, End Month] for time period
  S3 = [ 7,9 ] # Fall          #
  S4 = [10,12] # Winter        # <- Ex: Winter is between 10th - 12th (Oct - Des)
  # Use automatic weather? 
  WEATHER_SYSTEM = true
  # Sets the duration of weather changes (in frames)
  WEATHER_LENGTH = 240
  # Time before changing weather (in hours)
  WEATHER_COOLDOWN = 3
  # Weather names (Must be the same order as weather's Id) adds as many as required
  #                   0       1        2         3
  WEATHER_NAME = ["Clear", "Rain" , "Storm" , "Snowy"] # VX default only have these 3
  #-----------------------------------------------------------------------
  # Settings for possible weather
  # To add more weathers, just add more weather ids there
  # ex = W[#] = [ WeatherId, .....]
  # S[#] means, season number #
  # Weathers only occurs when entering map with [KTS] on it's name.
  # Those weathers will be randomly occurs, but snowy weather only spawn
  # on Winter
  #-----------------------------------------------------------------------
  W = {}
  W[0] = [0, 1, 2 ] # [ WeatherId, .....]
  W[1] = [0, 1, 2 ] # [ WeatherId, .....]
  W[2] = [0, 1, 2 ] # [ WeatherId, .....]
  W[3] = [0, 1, 2 ] # [ WeatherId, .....]
  W[4] = [0, 1, 3 ] # [ WeatherId, .....]
  #-----------------------------------------------------------------------
  # Settings for weather bgs
  # WeatherId => "filename", file must be in Audio/BGS/ folder
  #-----------------------------------------------------------------------
  WEATHERSOUND_OK = true
  # If true, setup the BGS on line 385
  # Remember. BGS only changes when you enter/exit a map, but weather can change
  # even if you stay inside a map for a long time....
  
  DAY_NAMES = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
  MONTH_NAMES = ["January","February","Mars","April","May","June","July","August","September","October","November","December"]
  
  
end

#==============================================================================
# Core Time System Engine (MODDED)
#==============================================================================
class Kylock_Time_System
  attr_accessor :tone_target
  attr_accessor :tone_time
  attr_accessor :old_tone
  # sets instance variables
  def initialize
    $kts_map_data = load_data("Data/MapInfos.rxdata")
    #@event_offset = (Time.now.strftime("%H").to_i * 3600) + (Time.now.strftime("%w").to_i * 86400)
    @event_offset = (KTS::START_HOUR * 3600) + (KTS::START_DAY * 86400)
    $kts_event_tone = false
    $kts_event_weather = false
    $kts_battle_tone = true
    $kts_anti_tone = Tone.new(0,0,0,0)
    @startingweatherdelay = 0
    @curweather = 0
    @played = false
    @old_tone = @tone_target = Tone.new(0,0,0,0)
    @tone_time = 0
  end
  # Computes current time and updates variables if used
  def update
    if !@kts_stop
      update_time
      update_tint
      update_weather
    end
  end
  def update_time
      # for scripters
      @total_seconds = Graphics.frame_count * KTS::SPEED/60 + @event_offset
      @total_minutes = @total_seconds / 60
      @total_hours = @total_minutes / 60
      @total_days = @total_hours / 24
      @total_weeks = @total_days / 7
      @total_months = @total_weeks / 4
      @total_years = @total_months/12
      #
      #@seconds = Time.now.sec 
      #@minutes = Time.now.min
      #@hours   = Time.now.hour
      #@days    = Time.now.strftime("%j").to_i
      #@weekday = Time.now.strftime("%w").to_i
      #@month = Time.now.strftime("%m").to_i
      #@monthname = Time.now.strftime("%b")
      #@monthday = Time.now.strftime("%d")
      #@year = Time.now.strftime("%Y").to_i
      @seconds = (@total_seconds) % 60
      @minutes = (@total_seconds / 60) % 60
      @hours   = (@total_seconds / 3600) % 24
      @days    = (@total_seconds / 86400)
      @weekday = @days % 7
      @month   = (@days / 30.5) % 12
      @monthday = @days % 30.5
      @year = @month / 12
      if KTS::DATABASE_OUTPUT
        $game_variables[KTS::TIME]    = getTime
      end
  end
  #
  def update_variables
    $game_variables[KTS::SECONDS] = @seconds
    $game_variables[KTS::MINUTES] = @minutes
    $game_variables[KTS::HOURS]   = @hours
    $game_variables[KTS::DAYS]    = @days
    $game_variables[KTS::DAYNAME] = getDayName
    $game_variables[KTS::WEEKDAY] = @weekday
    $game_variables[KTS::MONTH] = @month
    $game_variables[KTS::MONTHNAM] = @monthname
    $game_variables[KTS::YEAR] = @year
    if KTS::WEATHER_SYSTEM == true
      $game_variables[KTS::WEATHERN] = getWeatherName
      $game_variables[KTS::WEATHER] = @weather
    end
      $game_variables[KTS::SEASON] = getSeasonName
    $game_variables[KTS::MONTHDAY] = @monthday
  end
  #
  def update_switches
    if @period == 1 || @period == 5
      $game_switches[KTS::NIGHT] = true
    else
      $game_switches[KTS::NIGHT] = false
    end
    if @period == 2
      $game_switches[KTS::DAWN] = true
    else
      $game_switches[KTS::DAWN] = false
    end
    if @period == 3
      $game_switches[KTS::DAY] = true
    else
      $game_switches[KTS::DAY] = false
    end
    if @period == 4
      $game_switches[KTS::SUNSET] = true
    else
      $game_switches[KTS::SUNSET] = false
    end
  end
  #
  def update_season_swithces
    if @month >= KTS::S1[0] and @month <= KTS::S1[1]
      @speriod = 1
      $game_switches[KTS::SPRING] = true
    else
      $game_switches[KTS::SPRING] = false
    end
    if @month >= KTS::S2[0] and @month <= KTS::S2[1]
      @speriod = 2
      $game_switches[KTS::SUMMER] = true
    else
      $game_switches[KTS::SUMMER] = false
    end
    if @month >= KTS::S3[0] and @month <= KTS::S3[1]
      @speriod = 3
      $game_switches[KTS::FALL] = true
    else
      $game_switches[KTS::FALL] = false
    end
    if @month >= KTS::S4[0] and @month <= KTS::S4[1]
      @speriod = 4
      $game_switches[KTS::WINTER] = true
    else
      $game_switches[KTS::WINTER] = false
    end
  end
   #-----------------------------------------------------------------------
  # Script Command Functions
  #-----------------------------------------------------------------------
  def stop
    @time_stopped = @total_seconds
    @kts_stop = true
  end
  def go
    total_seconds = (Graphics.frame_count * KTS::SPEED / 60) + @event_offset
    @event_offset -= (total_seconds - @time_stopped)
    @kts_stop = false
  end
  def sec(sec = 0)
    @event_offset += sec
  end
  def min(min = 0)
    @event_offset += min * 60
  end
  def hours(hours = 0)
    @event_offset += hours * 3600
  end
  def days(days = 0)
    @event_offset += days * 86400
  end
  def jump_to_hour(jhour = 0)
    while @hours != jhour
      @event_offset += 60
      $kts.update
    end
  end
  #-----------------------------------------------------------------------
  # Script Support/Misc Functions (MODDED)
  #-----------------------------------------------------------------------
  def getTime
    #time = Time.now.strftime("%H:%M %p")
    return sprintf("%02d:%02d", @hours, @minutes)
  end
  def getSeasonName
    sname = "Spring" if @speriod == 1
    sname = "Summer" if @speriod == 2
    sname = "Fall" if @speriod == 3
    sname = "Winter" if @speriod == 4
    return sname
  end
  def getMonthName
    #monthname = Time.now.strftime('%b')
    monthname = (@month % MONTH_NAMES.length)
    return KTS::MONTH_NAMES[monthname]
  end
  def getDayName
    #weekday = Time.now.strftime('%a')
    #return weekday
    weekday = (@days % KTS::DAY_NAMES.length)
    return KTS::DAY_NAMES[weekday]
  end
  def getWeatherName
    if !@weather
      return KTS::WEATHER_NAME[0]
    else
      #return KTS::WEATHER_NAME[@weather]
    end
  end
  
  #-----------------------------------------------------------------------
  # Screen Tone Functions
  #-----------------------------------------------------------------------
  def update_tint(duration = KTS::FADE_LENGTH)
    return if $BTEST
    #return if $game_temp.transition_processing
    return if $kts_map_data[$game_map.map_id] == nil
    if KTS::USE_TONE && !$kts_event_weather && $kts_map_data[$game_map.map_id].outside_tint?
      if @hours >= KTS::T1[0] and @hours <= KTS::T1[1]
        @period = 1    
        tone = KTS::C1
        $kts_anti_tone = KTS::A1
      elsif @hours >= KTS::T2[0] and @hours <= KTS::T2[1]
        @period = 2
        tone = KTS::C2
        $kts_anti_tone = KTS::A2
      elsif @hours >= KTS::T3[0] and @hours <= KTS::T3[1]
        @period = 3
        tone = KTS::C3
        $kts_anti_tone = KTS::A3
      elsif @hours >= KTS::T4[0] and @hours <= KTS::T4[1]
        @period = 4
        tone = KTS::C4
        $kts_anti_tone = KTS::A4
      elsif @hours >= KTS::T5[0] and @hours <= KTS::T5[1]
        @period = 5
        tone = KTS::C5
        $kts_anti_tone = KTS::A5
      end
      if tone && @tone_target
        tone = Tone.new(
          tone.red + @tone_target.red,
          tone.green + @tone_target.green,
          tone.blue + @tone_target.blue,
          tone.gray + @tone_target.gray
        )
        if $kts_event_tone && @tone_time != 0
          duration = @tone_time
        end
      end
    else
      if !$kts_map_data[$game_map.map_id].outside_tint? && !$kts_event_tone
        duration = 0
        tone = @tone_target
      elsif !$kts_map_data[$game_map.map_id].outside_tint? && $kts_event_tone
        tone = @tone_target
        duration = @tone_time
      end
    end
    if tone && @old_tone && tone != @old_tone
      $game_screen.start_tone_change(tone,duration)
      @old_tone = tone
      @tone_time = 0
    end
  end
  # Set weather
  def setweather(duration)
    if ((@startingweatherdelay - @hours) >= KTS::WEATHER_COOLDOWN) or
       ((@startingweatherdelay - @hours) <= -KTS::WEATHER_COOLDOWN)
      @startingweatherdelay = Time.now.hour
#      @speriod = @speriod % KTS::W.length
#      the_weatherset = KTS::W[@speriod]
#      @curweather = the_weatherset[rand(KTS::W[@speriod].length)]
      @curweather = KTS::W[rand(3)]
      @weather = @curweather[rand(2)]
    else
      @weather = @curweather
    end
    $game_screen.weather(@weather, 9 , duration)
  end
    
  #-----------------------------------------------------------------------
  # Season/weather update
  #-----------------------------------------------------------------------
  def update_weather(duration = KTS::WEATHER_LENGTH)
    return if $BTEST
    return if $kts_map_data[$game_map.map_id] == nil
    if KTS::WEATHER_SYSTEM && !$kts_event_weather && $kts_map_data[$game_map.map_id].outside_tint?
      if @month >= KTS::S1[0] and @month <= KTS::S1[1]
        @speriod = 1
      elsif @month >= KTS::S2[0] and @month <= KTS::S2[1]
        @speriod = 2
      elsif @month >= KTS::S3[0] and @month <= KTS::S3[1]
        @speriod = 3
      elsif @month >= KTS::S4[0] and @month <= KTS::S4[1]
        @speriod = 4
      end
      setweather(duration)
    else
      # no weather if indoors
        if !$kts_map_data[$game_map.map_id].outside_tint?
          Audio.bgs_stop #Stop BGS
          $game_screen.weather(0, 0, 0)
        end
    end
  end
  
  # Extra Feature; Change BGS
  def start_bgs
    return if $kts_map_data[$game_map.map_id] == nil or !$kts_map_data[$game_map.map_id].outside_tint?
     if $kts_map_data[$game_map.map_id].outside_tint?
# This is night BGS, disabled in this MOD
#~       if $game_switches[KTS::NIGHT] == true
#~         Audio.bgs_play("Audio/BGS/Forest", 80, 100) 
#~       elsif $game_switches[KTS::DAWN] or $game_switches[KTS::SUNSET]
#~         Audio.bgs_play("Audio/BGS/Forest", 30, 100)
#~       else
#~         Audio.bgs_stop
#~       end
      if  KTS::WEATHER_SYSTEM == true
        if KTS::WEATHERSOUND_OK == true
          if @weather == 1
            Audio.bgs_play("Audio/BGS/007-Rain03", 70, 100)
          elsif @weather == 2
            Audio.bgs_play("Audio/BGS/001-Wind01", 70, 100)
          
            # ADD MORE IF YOU WANT to play BGS when weather with Id @weather occurs!
            # Like this :
            # elsif @weather == Id
            #  Audio.bgs_play("Audio/BGS/SomeBGS", 70, 100)
          else
            Audio.bgs_stop
          end
        end
      end
    end
  end
  
end

class Spriteset_Map
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  alias kts_initialize initialize
  def initialize
    $kts.update_switches if KTS::DATABASE_OUTPUT
    $kts.update_variables if KTS::DATABASE_OUTPUT
    $kts.update_season_swithces if KTS::DATABASE_OUTPUT
    kts_initialize
  end
end

#==============================================================================
# Instantly updates screen tone when a new map is loaded.
#==============================================================================
class Game_Map
  alias kts_setup setup
  def setup(map_id)
    kts_setup(map_id)
    $kts_event_tone = false
    $kts.update_time
    $kts.update_tint(0)
    $kts.update_weather(0) if KTS::WEATHER_SYSTEM
    $kts.start_bgs
  end
end

#==============================================================================
# Instantly updates screen tone when a battle starts.
#==============================================================================
#class Spriteset_Battle
#  alias kts_create_battleback create_battleback
# def create_battleback
#    $kts.update_tint(0)
#    kts_create_battleback
#  end
#end

#==============================================================================
# Temporarily disables auto-toning if an event tints the screen.
#==============================================================================
#class Game_Interpreter
class Interpreter
  alias kts_Interpreter_command_223 command_223
  def command_223
    $kts.tone_target = @parameters[0]
    $kts.tone_time = @parameters[1] * 2
    $kts_event_tone = true
    #kts_Interpreter_command_223
  end
  alias kts_Interpreter_command_236 command_236
  def command_236
    $kts_event_weather = true
    kts_Interpreter_command_236
  end
  alias kts_Interpreter_command_201 command_201
  def command_201
    if @parameters[5] == 0 #if fade
      $kts.tone_target = Tone.new(0,0,0,0)
      $kts.tone_time = 0
    end
    kts_Interpreter_command_201
  end
end

#==============================================================================
# Integrates the Time System into the Game System.
#==============================================================================
class Game_System
  # inits a KTS object
  alias kts_initialize initialize
  def initialize
    $kts=Kylock_Time_System.new
    kts_initialize
  end
  # Updates kts every game frame
  alias kts_update update
  def update
    $kts.update
    kts_update
  end
end

#==============================================================================
# Scans Map Names for Toning
#==============================================================================
class RPG::MapInfo
  def name # Definition prevents location scripts from reading anything within
    return @name.gsub(/\[.*\]/) {""} # brackets, including the brackets
  end
  def original_name
    return @name
  end
  def outside_tint?
    return @name.scan(/\[KTS\]/).size > 0
    # old regexp: return @name.scan(/[\KTS]/).size > 0
  end
end

#==============================================================================
# Sets up the time window for the menu. (MODDED)
#==============================================================================
class Window_KTS < Window_Base
  def initialize(x, y)
    super(x, y, 160, WLH+32)
    refresh
  end
  def refresh
    self.contents.clear
    self.contents.draw_text(0, -6, 120, 32,$kts.getDayName+" "+$kts.getTime, 2)
  end
  def update
    super
    $kts.update
    self.contents.clear
    self.contents.draw_text(0, -6, 120, 32, $kts.getDayName+" "+$kts.getTime, 2)
  end
end

#==============================================================================
# Adds the time window to the menu.
#==============================================================================
#class Scene_Menu
#  alias kts_start main
#  def main
#    kts_start
#    @kts_window = Window_KTS.new(0,304)
#  end
  #alias kts_terminate terminate
  #def terminate
  #  kts_terminate
  #  @kts_window.dispose
  #end
#  alias kts_update update
#  def update
#    kts_update
#    @kts_window.update
#  end
#end

#==============================================================================
# Saves and Loads game time to/from save game file.
#==============================================================================
class Scene_Save
  alias kts_write_save_data write_save_data
  def write_save_data(file)
    kts_write_save_data(file)
    Marshal.dump($kts, file)
  end
end
class Scene_Load
  alias kts_read_save_data read_save_data
  def read_save_data(file)
    kts_read_save_data(file)
    $kts = Marshal.load(file)
    
    if !$kts.old_tone
      $kts.old_tone = $kts.tone_target = Tone.new(0,0,0,0)
      $kts.tone_time = 0
    end
  end
end