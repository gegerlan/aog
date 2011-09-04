# *****************************************************************************
# *    Universal Message System
# *      v1.6.3
# *      by Ccoa
# *****************************************************************************
# Usage:
=begin

IN MESSAGE CODES
  \b          - toggle bold on and off
  \bopc[i]    - change the back opacity for this message to i (should be 0-255)
  \c[i]       - change the text color
  \c[#IIIIII] - change the text color to the hex code (temporary)
  \e[i]       - place the text box over event i (0 = player, -1 no event)
  \face[name] - changes the face graphic to name.png (leave empty [] for no face)
  \fl         - change face justification to left
  \font[name] - change the font to name, leave empty [] to return to the default font
  \fr         - change face justification to right
  \g          - display the gold window
  \height     - height of the message window, works only in normal mode
  \i          - toggle italics on and off
  \ignr       - Do not write anything on this line, only process codes, must be the first thing on a line 
  \jc         - justify the window to the center, ignored if using \e
  \jl         - justify the window to the left, ignored if using \e
  \jr         - justify the window to the right, ignored if using \e
  \m          - toggle mode between normal and fit window to text
  \n[i]       - display the name of actor i
  \nm[name]   - display the name in the name window, leave empty [] to remove the name window
  \oa[i]      - display the icon and name of armor i
  \oi[i]      - display the icon and name of item i
  \opc[i]     - change the opacity for this message to i (should be 0-255)
  \os[i]      - display the icon and name of skill i
  \ow[i]      - display the icon and name of weapon i
  \p[i]       - pause for i frames before writing the next character
  \pt         - toggle pause display on and off
  \s          - toggle shadowed text
  \shk[i]     - set window shake to i, higher i is bigger shake, 0 is no shake
  \skip       - toggle text skip on and off
  \ta[i]      - center the window over train actor 1
  \t1         - switch to the talk1 comic thingy
  \t2         - switch to the talk2 comic thingy
  \tc         - center the text, must be the first thing on a line
  \th         - switch to the thought comic thingy
  \tl         - left justify the text, must be the first thing on a line
  \tr         - right justify the text, must be the first thing on a line
  \v[i]       - display variable i
  \width      - width of the message window, works only in normal mode
  \w[i]       - wait for i frames after receiving this code, then close the window
  \ws[i]      - change the write speed to i
  \slv[name]  - set this window to be slave window name, or show slave window name
  \inc        - include this window in the last
  
OUT OF MESSAGE CODES (use in a Script event command)
$game_system.ums_mode = NORMAL_MODE - switch to normal mode
$game_system.ums_mode = FIT_WINDOW_TO_TEXT - switch to fit window mode
$game_system.text_skip = true - turn text skip on
$game_system.text_skip = false
true                           - turn text skip off (true is necessary)
$game_system.text_mode = WRITE_FASTER - change skip mode to write faster
$game_system.text_mode = WRITE_ALL - change skip mode to write all
$game_system.write_speed = i - change the delay between letters to i frames
$game_system.window_height = i - change the window height to i
$game_system.window_width = i - change the window width to i
$game_system.window_justification = RIGHT - make the window right justified
$game_system.window_justification = LEFT - make the window left justified
$game_system.window_justification = CENTER - make the window center justified
$game_system.face_graphic = "filename" - change the face graphic to filename.png
$game_system.face_graphic = "" - change the face graphic to none
$game_system.face_graphic_justification = LEFT - the face graphic is on the left side
$game_system.face_graphic_justification = RIGHT - the face graphic is on the right side
$game_system.face_graphic_position = TOP - face graphic appears on top of window
$game_system.face_graphic_position = CENTER - face graphic appears centered in window
$game_system.face_graphic_position = BOTTOM - face graphic appears on the bottom of window
$game_system.shadow_text = true - turn text shadowing on
$game_system.shadow_text = false
true                            - turn text shadowing off (true is necessary)
$game_system.shadow_color = Color.new(red, blue, green, alpha) - change shadow color
$game_system.message_event = what event to put the message over (0 = player, -1 = no event)
$game_system.comic_enabled = false 
true                               - turn off comic thingy
$game_system.comic_enabled = true  - turn on comic thingy (only works with message_event not -1)
$game_system.comic_style = TALK1   - use the talk1.png comic thingy
$game_system.comic_style = TALK2   - use the talk2.png comic thingy
$game_system.comic_style = THOUGHT - use the thought.png comic thingy
$game_system.name = "name" - change the text of the name window to name
$game_system.name = "" - remove the name window
$game_system.font = "name" - change the font to name
$game_system.font = "" - return the font to the default
$game_system.text_justification = CENTER - center justify the text
$game_system.text_justification = LEFT - left justify the text
$game_system.text_justification = RIGHT - right justify the text
$game_system.show_pause = true - show pause icon when waiting for user input
$game_system.show_pause = false - don't show pause icon when waiting for user input
$game_system.shake = 0 - turn window shake off
$game_system.shake = i - set shake to i, higher i is bigger shake
$game_system.sound_effect = "" - turn off the letter-by-letter SE
$game_system.sound_effect = "sename" - play the SE sename with each letter written
$game_system.animated_faces = false - do not use animated faces
$game_system.animated_faces = true - use animated faces
$game_system.animation_pause = i - Wait i frames between each animation
$game_system.face_frame_width = i - Each frame on the faceset is i pixels
$game_system.resting_face = "" - Do not use a resting face
$game_system.resting_face = "name" - Use a different animated face named facenamename when done talking
$game_system.resting_animation_pause = i - Wait i frames between resting animations
$game_system.text_mode = ONE_LETTER_AT_A_TIME - write text one letter at a time
$game_system.text_mode = ALL_AT_ONCE - write text all at once
$game_system.font_color = Color.new(R, G, B, A) - permanently change the font color to the RGBA color given here
$game_system.font_color = nil - return the font color permanently to normal_color (white, by default)
$game_system.windowskin = "windowskinname" - change the message box windowskin to windowskin
$game_system.windowskin = "" - change the message box windowskin back to the one in the database
$game_system.name_window = true - show the name window
$game_system.name_window = false - hide the name window (just show the text)
$game_system.opacity = i - change the message window back opacity to i (0-255)
$game_system.window_image = "imagename" - the name of the image to show behind the window
$game_system.window_image = nil - stop showing an image behind the window
$game_system.train_actor = i - center the message over train actor i

=end
# *****************************************************************************
#  CONSTANTS
# *****************************************************************************

# modes
NORMAL_MODE        = 0
FIT_WINDOW_TO_TEXT = 1

#text modes
ONE_LETTER_AT_A_TIME = 0
ALL_AT_ONCE          = 1

# skip modes
WRITE_FASTER = 0
WRITE_ALL    = 1

# justifications
RIGHT  = 4
CENTER = 1
LEFT   = 6

# positions for extra objects (face graphics, choice box, etc)
ABOVE  = 0  # place the object above the top of the message box
CENTER = 1  # center the object vertically inside the message box
BOTTOM = 2  # place the bottom of the object on the bottom of the message box
SIDE   = 3  # to the side of the message box (which side depends on justification)

# comic type
TALK1   = 0
TALK2   = 1
THOUGHT = 2

# *****************************************************************************
#  Changes to Game_System.  This allows any changes made to be saved when the
#     game is saved.
# *****************************************************************************

class Game_System
  attr_accessor :ums_mode # what mode the UMS is in
  attr_accessor :text_skip # whether or not text skip is activated
  attr_accessor :skip_mode # write the text faster while C is pressed, or just skip to the end
  attr_accessor :write_speed # frame delay between characters
  
  attr_accessor :text_mode # write one letter at a time, or all at once?
  
  attr_accessor :window_height # default height of message window
  attr_accessor :window_width # default width of message window
  attr_accessor :window_justification # default justification of window
  
  attr_accessor :face_graphic # current face graphic
  attr_accessor :face_graphic_justification # justification of face graphic
  attr_accessor :face_graphic_position # position of face graphic
  
  attr_accessor :shadowed_text # whether or not to draw a shadow behind the text
  attr_accessor :shadow_color # the shadow color
  
  attr_accessor :choice_justification # where the choice window is located
  attr_accessor :choice_position # prefered position of choice window
  
  attr_accessor :message_event # what event to center the text over (0 player, -1 to not)
  attr_accessor :train_actor   # what train actor to center the text over (0 player, -1 to not)
  
  attr_accessor :comic_enabled # using "talk" icons?
  attr_accessor :comic_style   # what type of comic image to use
  
  attr_accessor :name # the text for the name window
  attr_accessor :name_window # should the name window be visible?
  
  attr_accessor :font # the name of the font
  attr_accessor :font_color # the name of the (permanent) font color
  
  attr_accessor :text_justification # the justification of the window text
  
  attr_accessor :show_pause # whether or not to show the pause icon
  
  attr_accessor :shake # the amount of shake for the window
  
  attr_accessor :sound_effect # SE to play with each letter
  
  attr_accessor :slave_windows # hash of slave windows
  attr_accessor :indy_windows  # hash of independent windows
  
  attr_accessor :animated_faces # are the faces animated?
  attr_accessor :animation_pause # how long do I wait between animation loops?
  attr_accessor :face_frame_width # how many pixels wide is each face frame
  attr_accessor :resting_face  # postext for waiting face graphic
  attr_accessor :resting_animation_pause # how long to wait for resting graphic
  
  attr_accessor :windowskin # what windowskin to use for messages
  attr_accessor :back_opacity # back opacity of windowskin
  attr_accessor :opacity # opacity of windowskin
  
  attr_accessor :window_image # image used behind window
  
  attr_reader :shortcuts  # user-defined shortcuts
  
  alias ums_initialize initialize
  def initialize
    ums_initialize
    @ums_mode = NORMAL_MODE
    
    @skip_mode = WRITE_ALL
    @text_skip = true
    @write_speed = 2
    
    @text_mode = ONE_LETTER_AT_A_TIME
    
    @window_height = 128
    @window_width = 480
    @window_justification = CENTER
    
    @face_graphic = ""
    @face_graphic_justification = LEFT
    @face_graphic_position = CENTER
    
    @shadowed_text = false
    @shadow_color = Color.new(0, 0, 0, 100)
    
    @choice_justification = RIGHT
    @choice_position = SIDE
    
    @message_event = -1
    @train_actor   = -1
    
    @comic_enabled = false
    @comic_style = TALK1
    
    @name = ""
    @name_window = true
    
    @font = "Verdana"
    @font_color = nil
    
    @text_justification = LEFT
    
    @show_pause = true
    
    @shake = 0
    
    @sound_effect = ""
    
    @slave_windows = {}
    @indy_windows  = {}
    
    @animated_faces = false
    @animation_pause = 80
    @face_frame_width = 100
    @resting_face = ""
    @resting_animation_pause = 80
    
    @windowskin = ""
    @opacity = 255
    @back_opacity = 160
    
    @window_image = nil
    
    @used_codes = ['\v', '\n', '\c', '\g', '\skip', '\m', '\height', '\width', 
                   '\jr', '\jc', '\jl', '\face', '\fl', '\fr', '\b', '\i', '\s',
                   '\e', '\t1', '\t2', '\th', '\nm', '\font', '\p', '\w', '\ws',
                   '\oa', '\oi', '\os', '\ow', '\tl', '\tr', '\tc', '\ignr', 
                   '\shk', '\slv', '\ind', '\inc']
                   
    @shortcuts = {}
  end
  
  def add_shortcut(shortcut, code)
    text = shortcut.downcase
    if !@used_codes.include?(text)
      @shortcuts[shortcut] = code
    end
  end
  
  def open_window(name)
    if $game_system.indy_windows.has_key?(name)
      $game_system.indy_windows[name].show = true
    end
  end
  
  def close_window(name)
    if $game_system.indy_windows.has_key?(name)
      $game_system.indy_windows[name].dispose
      $game_system.indy_windows.delete(name)
    end
  end
end

#==============================================================================
# ** Game_Temp
#------------------------------------------------------------------------------
#  This class handles temporary data that is not included with save data.
#  Refer to "$game_temp" for the instance of this class.
#==============================================================================
class Game_Temp
  attr_accessor :choices
  attr_accessor :num_choices
  attr_accessor :skip_next_choices
  
  alias old_init initialize
  def initialize
    old_init
    @skip_next_choices = 0
    @num_choices = 1
  end
end

class Scene_Map
  alias ums_update update
  def update
    $game_system.slave_windows.each_value { |window| window.update }
    $game_system.indy_windows.each_value { |window| window.update }
    ums_update
  end
end

class Interpreter
  #--------------------------------------------------------------------------
  # * Event Command Execution
  #--------------------------------------------------------------------------
  def execute_command
    # If last to arrive for list of event commands
    if @index >= @list.size - 1
      # End event
      command_end
      # Continue
      return true
    end
    # Make event command parameters available for reference via @parameters
    if !(@list[@index].code == 102 and $game_temp.skip_next_choices > 0) 
      @parameters = @list[@index].parameters.clone
      if @list[@index].code == 402
        @parameters[0] += @offset
      end
    end
    # Branch by command code
    case @list[@index].code
    when 101  # Show Text
      return command_101
    when 102  # Show Choices
      return command_102
    when 402  # When [**]
      return command_402
    when 403  # When Cancel
      return command_403
    when 103  # Input Number
      return command_103
    when 104  # Change Text Options
      return command_104
    when 105  # Button Input Processing
      return command_105
    when 106  # Wait
      return command_106
    when 111  # Conditional Branch
      return command_111
    when 411  # Else
      return command_411
    when 112  # Loop
      return command_112
    when 413  # Repeat Above
      return command_413
    when 113  # Break Loop
      return command_113
    when 115  # Exit Event Processing
      return command_115
    when 116  # Erase Event
      return command_116
    when 117  # Call Common Event
      return command_117
    when 118  # Label
      return command_118
    when 119  # Jump to Label
      return command_119
    when 121  # Control Switches
      return command_121
    when 122  # Control Variables
      return command_122
    when 123  # Control Self Switch
      return command_123
    when 124  # Control Timer
      return command_124
    when 125  # Change Gold
      return command_125
    when 126  # Change Items
      return command_126
    when 127  # Change Weapons
      return command_127
    when 128  # Change Armor
      return command_128
    when 129  # Change Party Member
      return command_129
    when 131  # Change Windowskin
      return command_131
    when 132  # Change Battle BGM
      return command_132
    when 133  # Change Battle End ME
      return command_133
    when 134  # Change Save Access
      return command_134
    when 135  # Change Menu Access
      return command_135
    when 136  # Change Encounter
      return command_136
    when 201  # Transfer Player
      return command_201
    when 202  # Set Event Location
      return command_202
    when 203  # Scroll Map
      return command_203
    when 204  # Change Map Settings
      return command_204
    when 205  # Change Fog Color Tone
      return command_205
    when 206  # Change Fog Opacity
      return command_206
    when 207  # Show Animation
      return command_207
    when 208  # Change Transparent Flag
      return command_208
    when 209  # Set Move Route
      return command_209
    when 210  # Wait for Move's Completion
      return command_210
    when 221  # Prepare for Transition
      return command_221
    when 222  # Execute Transition
      return command_222
    when 223  # Change Screen Color Tone
      return command_223
    when 224  # Screen Flash
      return command_224
    when 225  # Screen Shake
      return command_225
    when 231  # Show Picture
      return command_231
    when 232  # Move Picture
      return command_232
    when 233  # Rotate Picture
      return command_233
    when 234  # Change Picture Color Tone
      return command_234
    when 235  # Erase Picture
      return command_235
    when 236  # Set Weather Effects
      return command_236
    when 241  # Play BGM
      return command_241
    when 242  # Fade Out BGM
      return command_242
    when 245  # Play BGS
      return command_245
    when 246  # Fade Out BGS
      return command_246
    when 247  # Memorize BGM/BGS
      return command_247
    when 248  # Restore BGM/BGS
      return command_248
    when 249  # Play ME
      return command_249
    when 250  # Play SE
      return command_250
    when 251  # Stop SE
      return command_251
    when 301  # Battle Processing
      return command_301
    when 601  # If Win
      return command_601
    when 602  # If Escape
      return command_602
    when 603  # If Lose
      return command_603
    when 302  # Shop Processing
      return command_302
    when 303  # Name Input Processing
      return command_303
    when 311  # Change HP
      return command_311
    when 312  # Change SP
      return command_312
    when 313  # Change State
      return command_313
    when 314  # Recover All
      return command_314
    when 315  # Change EXP
      return command_315
    when 316  # Change Level
      return command_316
    when 317  # Change Parameters
      return command_317
    when 318  # Change Skills
      return command_318
    when 319  # Change Equipment
      return command_319
    when 320  # Change Actor Name
      return command_320
    when 321  # Change Actor Class
      return command_321
    when 322  # Change Actor Graphic
      return command_322
    when 331  # Change Enemy HP
      return command_331
    when 332  # Change Enemy SP
      return command_332
    when 333  # Change Enemy State
      return command_333
    when 334  # Enemy Recover All
      return command_334
    when 335  # Enemy Appearance
      return command_335
    when 336  # Enemy Transform
      return command_336
    when 337  # Show Battle Animation
      return command_337
    when 338  # Deal Damage
      return command_338
    when 339  # Force Action
      return command_339
    when 340  # Abort Battle
      return command_340
    when 351  # Call Menu Screen
      return command_351
    when 352  # Call Save Screen
      return command_352
    when 353  # Game Over
      return command_353
    when 354  # Return to Title Screen
      return command_354
    when 355  # Script
      return command_355
    else      # Other
      return true
    end
  end
  
  #--------------------------------------------------------------------------
  # * Show Text
  #--------------------------------------------------------------------------
  def command_101
    # If other text has been set to message_text
    if $game_temp.message_text != nil
      # End
      return false
    end
    # Set message end waiting flag and callback
    @message_waiting = true
    $game_temp.message_proc = Proc.new { @message_waiting = false }
    # Set message text on first line
    $game_temp.message_text = @list[@index].parameters[0] + "\n"
    line_count = 1
    # Loop
    loop do
      # If next event command text is on the second line or after
      if @list[@index + 1].code == 401
        # Add the second line or after to message_text
        $game_temp.message_text += @list[@index + 1].parameters[0] + "\n"
        line_count += 1
      # If the next event command is show text
      elsif @list[@index + 1].code == 101
        # If the text contains the \inc code
        if @list[@index + 1].parameters[0].index(/\\[Ii][Nn][Cc]/) != nil
          $game_temp.message_text += @list[@index + 1].parameters[0] + "\n"
          $game_temp.message_text.sub!(/\\[Ii][Nn][Cc]/) { "" }
        else
          return true
        end
      # If event command is not on the second line or after
      else
        # If next event command is show choices
        if @list[@index + 1].code == 102
          # Advance index
          @index += 1
          
          # skip this one, it was already shown?
          if $game_temp.skip_next_choices > 0
            $game_temp.skip_next_choices -= 1
          else
            # Choices setup
            $game_temp.choice_start = line_count
            setup_choices(@list[@index].parameters)
          end
        # If next event command is input number
        elsif @list[@index + 1].code == 103
          # If number input window fits on screen
          if line_count < 4
            # Advance index
            @index += 1
            # Number input setup
            $game_temp.num_input_start = line_count
            $game_temp.num_input_variable_id = @list[@index].parameters[0]
            $game_temp.num_input_digits_max = @list[@index].parameters[1]
          end
        end
        # Continue
        return true
      end
      # Advance index
      @index += 1
    end
  end
  #--------------------------------------------------------------------------
  # * Show Choices
  #--------------------------------------------------------------------------
  def command_102
    # If text has been set to message_text
    if $game_temp.message_text != nil
      # End
      return false
    end
    
    if $game_temp.skip_next_choices > 0
      # skip this one, it is part of another
      $game_temp.skip_next_choices -= 1
      @offset += 4
      @index += 1
      return false
    else
      @offset = 0
    end
    # Set message end waiting flag and callback
    @message_waiting = true
    $game_temp.message_proc = Proc.new { @message_waiting = false }
    # Choices setup
    $game_temp.message_text = ""
    $game_temp.choice_start = 0
    setup_choices(@parameters)
    # Continue
    return true
  end
  #--------------------------------------------------------------------------
  # * Setup Choices
  #--------------------------------------------------------------------------
  def setup_choices(parameters)
    params = parameters.clone
    @offset = 0
    i = @index
    curr = 1
    while curr < $game_temp.num_choices
      i += 1
      if @list[i].code == 102
        params[0] += @list[i].parameters[0]
        if @list[i].parameters[1] == 5
          @cancel_flag = true
        else
          @cancel_flag = false
        end
        params[1] = @list[i].parameters[1] + (curr * 4)
        curr += 1
      end
    end
    
    # Set choice item count to choice_max
    $game_temp.choice_max = params[0].size
    # Set choice to message_text
    $game_temp.choices = params[0]
    # Set cancel processing
    $game_temp.choice_cancel_type = params[1]
    
    if $game_temp.num_choices != 1
      $game_temp.skip_next_choices = $game_temp.num_choices - 1
      $game_temp.num_choices = 1
    end
    
    # Set callback
    current_indent = @list[@index].indent
    $game_temp.choice_proc = Proc.new { |n| @branch[current_indent] = n }
  end
  
  #--------------------------------------------------------------------------
  # * When [**]
  #--------------------------------------------------------------------------
  def command_402
    # If fitting choices are selected
    if @branch[@list[@index].indent] == @parameters[0]
      # Delete branch data
      @branch.delete(@list[@index].indent)
      # Continue
      return true
    end
    # If it doesn't meet the condition: command skip
    return command_skip
  end
  
  #--------------------------------------------------------------------------
  # * When Cancel
  #--------------------------------------------------------------------------
  def command_403
    # If choices are cancelled
    if @cancel_flag
      # Delete branch data
      @branch.delete(@list[@index].indent)
      # Continue
      return true
    end
    # If it doen't meet the condition: command skip
    return command_skip
  end
  
  #--------------------------------------------------------------------------
  # * Input Number
  #--------------------------------------------------------------------------
  def command_103
    # If text has been set to message_text
    if $game_temp.message_text != nil
      # End
      return false
    end
    # Set message end waiting flag and callback
    @message_waiting = true
    $game_temp.message_proc = Proc.new { @message_waiting = false }
    # Number input setup
    $game_temp.message_text = ""
    $game_temp.num_input_start = 0
    $game_temp.num_input_variable_id = @parameters[0]
    $game_temp.num_input_digits_max = @parameters[1]
    # Continue
    return true
  end
  
  #--------------------------------------------------------------------------
  # * Script
  #--------------------------------------------------------------------------
  def command_355
    # Set first line to script
    script = @list[@index].parameters[0] + "\n"
    # Loop
    loop do
      # If next event command is second line of script or after
      if @list[@index + 1].code == 655
        # Add second line or after to script
        script += @list[@index + 1].parameters[0] + "\n"
      # If event command is not second line or after
      else
        # Abort loop
        break
      end
      # Advance index
      @index += 1
    end
    # Evaluation
    result = eval(script)

    # Continue
    return true
  end
end

# *****************************************************************************
#  Changes to Window_Message.  This is the bulk of the script
# *****************************************************************************
#==============================================================================
# ** Window_Message
#------------------------------------------------------------------------------
#  This message window is used to display text.
#==============================================================================

class Window_Message < Window_Selectable
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    # x-coordinate depends on justification
    if $game_system.window_justification == RIGHT
      x = 640 - self.width
    elsif $game_system.window_justification == LEFT
      x = 0
    else # center
      x = (640 - $game_system.window_width) / 2
    end
    # y-coordinate depends on height
    y = 480 - $game_system.window_height - 16
    super(x, y, $game_system.window_width, $game_system.window_height)
    self.contents = Bitmap.new(width - 32, height - 32)
    if $game_system.font == ""
      self.contents.font.name = Font.default_name
    else
      self.contents.font.name = $game_system.font
    end
    self.visible = false
    self.z = 9998
    @fade_in = false
    @fade_out = false
    @contents_showing = false
    
    # face graphic sprite
    @face = Sprite.new
    @face.opacity = 0
    @face.z = self.z + 1
    @face_offset = 0
    
    # choice window
    @choice_window = Window_Choice.new([]) 
    @choice_window.back_opacity = $game_system.back_opacity
    
    # comic sprite
    @comic = Sprite.new
    @comic.opacity = 0
    @comic.z = self.z + 1
    if $game_system.comic_style == TALK1
      @comic.bitmap = RPG::Cache.windowskin("talk1")
    elsif $game_system.comic_style == TALK2
      @comic.bitmap = RPG::Cache.windowskin("talk2")
    else # thought
      @comic.bitmap = RPG::Cache.windowskin("thought")
    end
    
    # window image sprite
    @window_back = Sprite.new
    @window_back.opacity = 0
    @window_back.z = self.z - 1
    if $game_system.window_image != nil
      @window_back.bitmap = RPG::Cache.windowskin($game_system.window_image)
    end
    
    # name window
    @name_window = Window_Name.new
    @name_window.z = self.z + 1
    
    @pause_time = 0
    @wait = 0
    
    @show = false
    
    @face_frame = 0
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    terminate_message
    $game_temp.message_window_showing = false
    if @input_number_window != nil
      @input_number_window.dispose
    end
    @face.dispose
    @choice_window.dispose
    @comic.dispose
    @name_window.dispose
    super
  end
  #--------------------------------------------------------------------------
  # * Terminate Message
  #--------------------------------------------------------------------------
  def terminate_message
    @show = false
    self.active = false
    self.pause = false
    self.contents.clear
    # Clear showing flag
    @contents_showing = false
    # Call message callback
    if $game_temp.message_proc != nil
      $game_temp.message_proc.call
    end
    # Clear variables related to text, choices, and number input
    $game_temp.message_text = nil
    $game_temp.message_proc = nil
    $game_temp.choice_start = 99
    $game_temp.choice_max = 0
    $game_temp.choice_cancel_type = 0
    $game_temp.choice_proc = nil
    $game_temp.num_input_start = 99
    $game_temp.num_input_variable_id = 0
    $game_temp.num_input_digits_max = 0
    # Open gold window
    if @gold_window != nil
      @gold_window.dispose
      @gold_window = nil
    end
    @choice_window.visible = false
    @choice_window.active = false
    @comic.opacity = 0
    $game_system.slave_windows.each_pair {|name, window| 
      if window.show == true
        window.dispose
        $game_system.slave_windows.delete(name)
      end
    }
    @done = false
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    if $game_system.font_color.nil?
      self.contents.font.color = normal_color
    else
      self.contents.font.color = $game_system.font_color
    end
    if $game_system.windowskin != ""  
      self.windowskin = RPG::Cache.windowskin($game_system.windowskin)
    else
      self.windowskin = RPG::Cache.windowskin($data_system.windowskin_name)
    end
    if $game_system.comic_style == TALK1
      @comic.bitmap = RPG::Cache.windowskin("talk1")
    elsif $game_system.comic_style == TALK2
      @comic.bitmap = RPG::Cache.windowskin("talk2")
    else # thought
      @comic.bitmap = RPG::Cache.windowskin("thought")
    end
    @show = true
    @x = @y = 0

    # If waiting for a message to be displayed
    if $game_temp.message_text != nil 
      @text = $game_temp.message_text
      
      # replace shortcuts with original code
      $game_system.shortcuts.each { |shortcut, code|
        @text.gsub!(shortcut, code)
      }
      
      # VERY first thing.  Check to see if this is being set up as a slave
      #  or independent window.
      if @text.index(/\\[Ss][Ll][Vv]\[(.*?)\]/) != nil
        # is this a new slave window, or a request to display it?
        if !$game_system.slave_windows.has_key?($1.to_s)
          # there is no such slave window yet.  Set it up.
          @text.gsub!(/\\[Ss][Ll][Vv]\[(.*?)\]/, "")
          $game_system.slave_windows[$1.to_s] = Window_Slave.new(@text)
          @text = ""
          @show = false
          terminate_message
          return
        end
      end
      if @text.index(/\\[Ii][Nn][Dd]\[(.*?)\]/) != nil
        # is this a new independent window, or a request to display it?
        if !$game_system.indy_windows.has_key?($1.to_s)
          # there is no such slave window yet.  Set it up.
          @text.gsub!(/\\[Ii][Nn][Dd]\[(.*?)\]/, "")
          $game_system.indy_windows[$1.to_s] = Window_Slave.new(@text)
          @text = ""
          @show = false
          terminate_message
          return
        end
      end
      
      # Control text processing
      begin
        last_text = @text.clone
        @text.gsub!(/\\[Vv]\[([0-9]+)\]/) { $game_variables[$1.to_i] }
      end until @text == last_text
      @text.gsub!(/\\[Nn]\[([0-9]+)\]/) do
        $game_actors[$1.to_i] != nil ? $game_actors[$1.to_i].name : ""
      end
      
      # window mode
      if @text.index(/\\[Mm]/) != nil
        if $game_system.ums_mode == NORMAL_MODE
          $game_system.ums_mode = FIT_WINDOW_TO_TEXT
        else
          $game_system.ums_mode = NORMAL_MODE
        end
        @text.gsub!(/\\[Mm]/) { "" }
      end
      
      # window height
      @text.gsub!(/\\[Hh][Ee][Ii][Gg][Hh][Tt]\[([0-9]+)\]/) do
        $game_system.window_height = $1.to_i
        ""
      end
      
      # window width
      @text.gsub!(/\\[Ww][Ii][Dd][Tt][Hh]\[([0-9]+)\]/) do
        $game_system.window_width = $1.to_i
        ""
      end
      
      # justification
      @text.gsub!(/\\[Jj][Rr]/) do
        $game_system.window_justification = RIGHT
        reset_window
        ""
      end
      @text.gsub!(/\\[Jj][Cc]/) do
        $game_system.window_justification = CENTER
        reset_window
        ""
      end      
      @text.gsub!(/\\[Jj][Ll]/) do
        $game_system.window_justification = LEFT
        reset_window
        ""
      end
      
      # face graphics
      @text.gsub!(/\\[Ff][Aa][Cc][Ee]\[(.*?)\]/) do
        $game_system.face_graphic = $1.to_s
        if $1.to_s == ""
          @face.opacity = 0
        end
        ""
      end
      @text.gsub!(/\\[Ff][Ll]/) do
        $game_system.face_graphic_justification = LEFT
        ""
      end
      @text.gsub!(/\\[Ff][Rr]/) do
        $game_system.face_graphic_justification = RIGHT
        ""
      end
      
      # event centering
      @text.gsub!(/\\[Ee]\[([0-9]+)\]/) do
        $game_system.message_event = $1.to_i
        ""
      end
      
      # train actor centering
      @text.gsub!(/\\[Tt][Aa]\[([0-9]+)\]/) do
        $game_system.train_actor = $1.to_i
        ""
      end
      
      # comic thingy
      @text.gsub!(/\\[Tt]1/) do
        $game_system.comic_style = TALK1
        @comic.bitmap = RPG::Cache.windowskin("talk1.png")
        ""
      end
      @text.gsub!(/\\[Tt]2/) do
        $game_system.comic_style = TALK2
        @comic.bitmap = RPG::Cache.windowskin("talk2.png")
        ""
      end
      @text.gsub!(/\\[Tt][Hh]/) do
        $game_system.comic_style = THOUGHT
        @comic.bitmap = RPG::Cache.windowskin("thought.png")
        ""
      end
      
      # name window
      @text.gsub!(/\\[Nn][Mm]\[(.*?)\]/) do
        $game_system.name = $1.to_s
        if $1.to_s == ""
          @name_window.visible = false
          @name_window.dummy_window.visible = false
        end
        ""
      end
      # name party window
      @text.gsub!(/\\[Nn][Pp]\[([0-9]+)\]/) do
        actor = $game_party.actors[$1.to_i]
        if actor != nil
          actor.name
        else
          ""
        end
      end
      
      if $game_system.name == ""
        @name_window.visible = false
        @name_window.dummy_window.visible = false
      end
      
      
      # toggle pause
      @text.gsub!(/\\[Pp][Tt]/) do
        $game_system.show_pause = !$game_system.show_pause
        ""
      end
      
      # shaking
      @text.gsub!(/\\[Ss][Hh][Kk]\[([0-9]+)\]/) do
        $game_system.shake = $1.to_i
        ""
      end
      
      # back opacity
      @text.gsub!(/\\[Bb][Oo][Pp][Cc]\[([0-9]+)\]/) do
        $game_system.back_opacity = $1.to_i
        self.back_opacity = $game_system.back_opacity
        ""
      end
      
      # opacity
      @text.gsub!(/\\[Oo][Pp][Cc]\[([0-9]+)\]/) do
        $game_system.opacity = $1.to_i
        self.opacity = $game_system.opacity
        ""
      end
      
      # Change "\\\\" to "\000" for convenience
      @text.gsub!(/\\\\/) { "\000" }
      # Change "\\C" to "\001" and "\\G" to "\002"
      @text.gsub!(/\\[Cc]\[([0-9]+)\]/) { "\001[#{$1}]" }
      @text.gsub!(/\\[Gg]/) { "\002" }
      @text.gsub!(/\\[Cc]\[0x([0123456789abcdef]+)\]/) { "\026[#{$1}]" }
      
      # text skip code
      @text.gsub!(/\\[Ss][Kk][Ii][Pp]/) { "\003" }
      
      # ignore code
      @text.gsub!(/\\[Ii][Gg][Nn][Rr]/) { "\023" }
      
      # slave and indy windows
      @text.gsub!(/\\[Ss][Ll][Vv]\[(.*?)\]/) { "\024[#{$1}]" }
      @text.gsub!(/\\[Ii][Nn][Dd]\[(.*?)\]/) { "\025[#{$1}]" }
      
      # bold and italics
      @text.gsub!(/\\[Bb]/) { "\004" }
      @text.gsub!(/\\[Ii]/) { "\005" }
      
      # shadow
      @text.gsub!(/\\[Ss]/) { "\006" }
      
      # font
      @text.gsub!(/\\[Ff][Oo][Nn][Tt]\[(.*?)\]/) { "\007[#{$1}]" }
      
      # pause and wait
      @text.gsub!(/\\[Pp]\[([0-9]+)\]/) { "\010[#{$1}]" }
      @text.gsub!(/\\[Ww]\[([0-9]+)\]/) { "\011[#{$1}]" }
      
      # write speed
      @text.gsub!(/\\[Ww][Ss]\[([0-9]+)\]/) { "\013[#{$1}]" }
            
      # armor, items, skills, and weapons
      @text.gsub!(/\\[Oo][Aa]\[([0-9]+)\]/) { 
        item = $data_armors[$1.to_i]
        "\014[#{$1}]" + "  " + item.name
      }
      @text.gsub!(/\\[Oo][Ii]\[([0-9]+)\]/) { 
        item = $data_items[$1.to_i]
        "\015[#{$1}]" + "  " + item.name
      }
      @text.gsub!(/\\[Oo][Ss]\[([0-9]+)\]/) { 
        item = $data_skills[$1.to_i]
        "\016[#{$1}]" + "  " + item.name
      }
      @text.gsub!(/\\[Oo][Ww]\[([0-9]+)\]/) { 
        item = $data_weapons[$1.to_i]
        "\017[#{$1}]" + "  " + item.name
      }
      
      # text justification
      @text.gsub!(/\\[Tt][Cc]/) { "\020" }
      @text.gsub!(/\\[Tt][Ll]/) { "\021" }
      @text.gsub!(/\\[Tt][Rr]/) { "\022" }
      
      # Resize the window to fit the contents?
      if $game_system.ums_mode == FIT_WINDOW_TO_TEXT
        width = 1
        text = @text.split("\n")
        height = 0
        i = 0
        for line in text
          # don't count this line's width if it has the ignr code
          if !line.include?("\023")
            width = [width, self.contents.text_size(line).width].max
            delta = self.contents.text_size(line).height
            height += delta + (delta * 0.2).to_i
          end
        end
        
        if $game_system.face_graphic != "" and ($game_system.face_graphic_position == CENTER or $game_system.face_graphic_position == BOTTOM)
          width += @face.bitmap.width
          if height < @face.bitmap.height
            height = @face.bitmap.height - 32
          end
        end
        
        if height == 0
          height = 1
        end
        
        self.width = width + 48
        self.height = height + 48 
        
        self.contents = Bitmap.new(width + 16, height)
        
        if $game_system.font == ""
          self.contents.font.name = Font.default_name
        else
          self.contents.font.name = $game_system.font
        end
        
        if $game_system.font_color.nil?
          self.contents.font.color = normal_color
        else
          self.contents.font.color = $game_system.font_color
        end
      else
        if self.width != $game_system.window_height or self.height != $game_system.window_width
          self.width = $game_system.window_width
          self.height = $game_system.window_height
          self.contents = Bitmap.new(self.width - 32, self.height - 32)
          if $game_system.font == ""
            self.contents.font.name = Font.default_name
          else
            self.contents.font.name = $game_system.font
          end
          if $game_system.font_color.nil?
            self.contents.font.color = normal_color
          else
            self.contents.font.color = $game_system.font_color
          end
        end
      end
      
      if $game_system.window_image != nil
        # figure out how we're going to resize this          
        @window_back.zoom_x = self.width.to_f / @window_back.bitmap.width 
        @window_back.zoom_y = self.height.to_f / @window_back.bitmap.height
      end
      
      reset_window
      
      get_x_value
      
      @count = Graphics.frame_count
      @pause_time = 0
      @ignore = false
      @ascending = true
      @target_x = self.x + $game_system.shake
      @done = false
      @face_frame = 0
      @done = false
      
      self.oy = 0
    end
    
    
  end
  
  #--------------------------------------------------------------------------
  # * Set Window Position and Opacity Level
  #--------------------------------------------------------------------------
  def reset_window (change_opacity = true)
    # x-coordinate depends on justification
    if $game_system.message_event == -1 and $game_system.train_actor == -1
      if $game_system.window_justification == RIGHT
        self.x = 640 - $game_system.window_width
      elsif $game_system.window_justification == LEFT
        self.x = 0
      else # center
        self.x = (640 - self.width) / 2
      end
    elsif $game_system.train_actor >= 0
      if $game_system.train_actor == 0 or $game_system.train_actor > $game_party.actors.size - 1
        # center on player
        event_x = $game_player.screen_x
      else
        # center on train actor
        event_x = $game_train.actors[$game_system.train_actor - 1].screen_x
      end
      self.x = event_x - self.width / 2
      @comic.x = self.x + (self.width / 2) + 4
    else
      if $game_system.message_event == 0 or $game_map.events[$game_system.message_event] == nil
        # center on player
        event_x = $game_player.screen_x
      else
        # center on the event specified
        event_x = $game_map.events[$game_system.message_event].screen_x
      end
      self.x = event_x - self.width / 2
      @comic.x = self.x + (self.width / 2) + 4
    end
    
    if $game_temp.in_battle
      self.y = 16
    else
      if $game_system.message_event == -1 and $game_system.train_actor == -1
        case $game_system.message_position
          when 0  # up
            self.y = 16
          when 1  # middle
            #self.y = (480 - $game_system.window_height) / 2
            self.y = (480 - self.height) / 2
          when 2  # down
            #self.y = 480 - $game_system.window_height - 24
            self.y = 480 - self.height - 24
        end
      elsif $game_system.train_actor >= 0
        if $game_system.train_actor == 0 or $game_system.train_actor > $game_party.actors.size - 1
          # center on player
          self.y = $game_player.screen_y - self.height - 48
        else
          # center on train actor
          self.y = $game_train.actors[$game_system.train_actor - 1].screen_y - self.height - 48
        end
        @comic.y = self.y + self.height - 2
        @comic.angle = 0
      else
        if $game_system.message_event == 0 or $game_map.events[$game_system.message_event] == nil
          # above player
          self.y = $game_player.screen_y - self.height - 48
        else
          # above event specified
          self.y = $game_map.events[$game_system.message_event].screen_y - self.height - 48
        end
        @comic.y = self.y + self.height - 2
        @comic.angle = 0
      end
    end
    if self.y < 0 + ($game_system.name == "" ? 0 : 16)
      if $game_system.comic_enabled
        if $game_system.message_event == 0 or $game_map.events[$game_system.message_event] == nil
          self.y = $game_player.screen_y - 16
        else
          self.y = $game_map.events[$game_system.message_event].screen_y - 16
        end
        @comic.angle = 180
        @comic.y = self.y + 2
        @comic.x = self.x + (self.width / 2) - 4
      else
        self.y = 0 + ($game_system.name == "" ? 0 : 16)
      end
    elsif self.y > 480 - self.height 
      self.y = 480 - self.height
    end
    if self.x < 0 
      self.x = 0
    elsif self.x > 680 - self.width - 48
      self.x = 640 - self.width
    end
    
    if change_opacity
      if $game_system.message_frame == 0 and $game_temp.message_text != ""
        self.opacity = $game_system.opacity
      else
        self.opacity = 0
      end
      self.back_opacity = $game_system.back_opacity
    end
    
    # window back stuff
    if $game_system.window_image != nil
      @window_back.bitmap = RPG::Cache.windowskin($game_system.window_image)
      @window_back.x = self.x
      @window_back.y = self.y
    end
    
      # face stuff
      if $game_system.face_graphic != ""  
        # the player has chosen to show a face graphic
        if @done and $game_system.resting_face != ""
          @face.bitmap = RPG::Cache.picture($game_system.face_graphic + $game_system.resting_face)
          if @face_frame * $game_system.face_frame_width >= @face.bitmap.width
            @face_frame = 0
          end
        else
          @face.bitmap = RPG::Cache.face($game_system.face_graphic) #RPG::Cache.picture($game_system.face_graphic)
        end
        
        # picture y-coordinate
        if $game_system.face_graphic_position == ABOVE
          @face.y = self.y - @face.bitmap.height
          @face_offset = 0
        elsif $game_system.face_graphic_position == CENTER
          delta = (@face.bitmap.height - self.height) / 2
          @face.y = self.y - delta
          if $game_system.animated_faces
            @face_offset = $game_system.face_frame_width + 16
          else
            @face_offset = @face.bitmap.width + 16
          end
        elsif $game_system.face_graphic_position == BOTTOM 
          @face.y = self.y + self.height - @face.bitmap.height
          if $game_system.animated_faces
            @face_offset = $game_system.face_frame_width + 16
          else
            @face_offset = @face.bitmap.width + 16
          end
        else # side
          delta = (@face.bitmap.height - self.height) / 2
          @face.y = self.y - delta
          @face_offset = 0
        end
        
        # picture x-coordinate
        if $game_system.face_graphic_justification == LEFT
          if $game_system.face_graphic_position == SIDE
            @face.x = self.x - @face.bitmap.width
          else
            @face.x = self.x + 10
          end
        else # right side
          if $game_system.animated_faces
            offset = @face.bitmap.width - $game_system.face_frame_width
          else
            offset = 0
          end
          if $game_system.face_graphic_position == SIDE
            @face.x = self.x + self.width + offset
          else
            @face.x = self.x + self.width - @face.bitmap.width - 10 + offset
            @face_offset = 0
          end
        end
        
        if $game_system.animated_faces
          @face.src_rect = Rect.new(@face_frame * $game_system.face_frame_width, 0, $game_system.face_frame_width, @face.bitmap.height)
          if @done and $game_system.resting_face != ""
            pause = $game_system.resting_animation_pause
          else
            pause = $game_system.animation_pause
          end
          if Graphics.frame_count % pause == 0
            @animate_face = true
          end
          if @animate_face
            if Graphics.frame_count % 3 == 0
              @face_frame += 1
              if @face_frame * $game_system.face_frame_width >= @face.bitmap.width
                @face_frame = 0
                @animate_face = false
              end
            end
          end
        end
      end
      
      # name window
      if $game_system.name != ""
        @name_window.x = self.x
        @name_window.y = self.y - 36
        @name_window.set_name($game_system.name)
      end
      
      # If choice
    if $game_temp.choice_max > 0
      @choice_window.set_choices($game_temp.choices)
      # determine x and y coords for choice window
      if $game_system.choice_justification == LEFT
        @choice_window.x = self.x
      else
        @choice_window.x = self.x + self.width - @choice_window.width
      end
      if $game_system.choice_position == ABOVE
        # check to make sure there is enough room above the textbox
        if self.y < @choice_window.height
          # not enough room above, place below
          @choice_window.y = self.y + self.height
        else
          # draw above
          @choice_window.y = self.y - @choice_window.height
        end
      elsif $game_system.choice_position == BOTTOM
        # check to make sure there is enough room below the textbox
        if (480 - self.y - self.height) < @choice_window.height
          # not enough room below, place above
          @choice_window.y = self.y - @choice_window.height
        else
          # draw below 
          @choice_window.y = self.y + self.height
        end
      else # side
        if $game_system.choice_justification == LEFT
          # check to make sure there's room on the left side
          if self.y < @choice_window.width
            # not enough room on the side, check to make sure there's room below
            if (480 - self.y - self.height) < @choice_window.height
              # not enough room below, place above
              @choice_window.y = self.y - @choice_window.height
            else
              # draw below 
              @choice_window.y = self.y + self.height
            end
          else
            # place on the left side
            @choice_window.y = self.y
            @choice_window.x = self.x - @choice_window.width
          end
        else # right
          # check to make sure there's room on the right side
          if (680 - (self.y + self.width)) < @choice_window.width
            # not enough room on the side, check to make sure there's room below
            if (480 - self.y - self.height) < @choice_window.height
              # not enough room below, place above
              @choice_window.y = self.y - @choice_window.height
            else
              # draw below 
              @choice_window.y = self.y + self.height
            end
          else
            # place on the left side
            @choice_window.y = self.y
            @choice_window.x = self.x + self.width
          end
        end
      end
    end
    
    # If number input
    if $game_temp.num_input_variable_id > 0
      if @input_number_window == nil
        digits_max = $game_temp.num_input_digits_max
        number = $game_variables[$game_temp.num_input_variable_id]
        @input_number_window = Window_InputNumber.new(digits_max)
        @input_number_window.number = number
      end
      # determine x and y coords for number input window
      if $game_system.choice_justification == LEFT
        @input_number_window.x = self.x
      else
        @input_number_window.x = self.x + self.width - @input_number_window.width
      end
      if $game_system.choice_position == ABOVE
        # check to make sure there is enough room above the textbox
        if self.y < @input_number_window.height
          # not enough room above, place below
          @input_number_window.y = self.y + self.height
        else
          # draw above
          @input_number_window.y = self.y - @choice_window.height
        end
      elsif $game_system.choice_position == BOTTOM
        # check to make sure there is enough room below the textbox
        if (480 - self.y - self.height) < @input_number_window.height
          # not enough room below, place above
          @input_number_window.y = self.y - @input_number_window.height
        else
          # draw below 
          @input_number_window.y = self.y + self.height
        end
      else # side
        if $game_system.choice_justification == LEFT
          # check to make sure there's room on the left side
          if self.y < @input_number_window.width
            # not enough room on the side, check to make sure there's room below
            if (480 - self.y - self.height) < @input_number_window.height
              # not enough room below, place above
              @input_number_window.y = self.y - @input_number_window.height
            else
              # draw below 
              @input_number_window.y = self.y + self.height
            end
          else
            # place on the left side
            @input_number_window.y = self.y
            @input_number_window.x = self.x - @choice_window.width
          end
        else # right
          # check to make sure there's room on the right side
          if (680 - (self.y + self.width)) < @input_number_window.width
            # not enough room on the side, check to make sure there's room below
            if (480 - self.y - self.height) < @input_number_window.height
              # not enough room below, place above
              @input_number_window.y = self.y - @input_number_window.height
            else
              # draw below 
              @input_number_window.y = self.y + self.height
            end
          else
            # place on the left side
            @input_number_window.y = self.y
            @input_number_window.x = self.x + self.width
          end
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    
    if (@contents_showing and $game_system.message_event != -1 and $game_system.shake == 0) or $game_system.animated_faces
      reset_window(false)
    end
    
    if $game_system.shake != 0  # shake the window
      if @ascending
        if @target_x != self.x
          self.x += 1
        else
          @ascending = false
          @target_x = self.x - ($game_system.shake * 2)
        end
      else 
        if @target_x != self.x
          self.x -= 1
        else
          @ascending = true
          @target_x = self.x + ($game_system.shake * 2)
        end
      end
    end
    
    @name_window.update
    
    if @wait > 0
      @wait -= 1
      if @wait == 0
        terminate_message
        return
      end
    end
    
    # If fade in
    if @fade_in
      if $game_temp.message_text == ""
        @fade_in = false
        return
      end
      self.contents_opacity += 24
      if $game_system.face_graphic != ""
        @face.opacity += 24
      end
      if $game_system.window_image != nil
        @window_back.opacity += 24
      end
      if $game_system.comic_enabled and $game_system.message_event != -1
        @comic.opacity = self.opacity
        @comic.visible = self.visible
      end
      
      if $game_system.name != "" and @show
        @name_window.visible = true
        if $game_system.name_window
          @name_window.dummy_window.visible = true
        end
      end
      if @input_number_window != nil
        @input_number_window.contents_opacity += 24
      end
      if self.contents_opacity == 255
        @fade_in = false
      end
      return
    end
    
    # write the text
    if @text != nil and @text != ""
      speed = $game_system.write_speed
      if $game_system.text_mode == ALL_AT_ONCE or $game_temp.in_battle
        while (c = @text.slice!(/./m)) != nil
          write_char(c)
        end
        $game_system.slave_windows.each_value { |window| window.write_all }
        return
      end
      if $game_system.text_skip
        if $game_system.skip_mode == WRITE_FASTER and Input.press?(Input::C)
          # the player is holding the action button, write faster
          speed /= 3
        elsif $game_system.skip_mode == WRITE_ALL and Input.trigger?(Input::C)
          # the player pressed the action button, write all the text
          while (c = @text.slice!(/./m)) != nil
            write_char(c)
          end
          $game_system.slave_windows.each_value { |window| window.write_all }
          return
        end
      end
      while @ignore
        c = @text.slice!(/./m)
        if c != nil
          write_char(c)
        end
      end
      if @pause_time > 0
        @pause_time -= 1
        return
      end
      if Graphics.frame_count - @count >= speed
        if $game_system.sound_effect != ""
          Audio.se_play("Audio/SE/" + $game_system.sound_effect, 80, 100)
        end
        @count = Graphics.frame_count
        c = @text.slice!(/./m)
        if c != nil
          write_char(c)
        end
      end
      return
    end
    
    if $game_system.animated_faces and $game_system.resting_face != ""
      @done = true
    end
    
    # If inputting number
    if @input_number_window != nil
      @input_number_window.update
      # Confirm
      if Input.trigger?(Input::C)
        $game_system.se_play($data_system.decision_se)
        $game_variables[$game_temp.num_input_variable_id] =
          @input_number_window.number
        $game_map.need_refresh = true
        # Dispose of number input window
        @input_number_window.dispose
        @input_number_window = nil
        terminate_message
      end
      return
    end
    
    if @wait != 0
      return
    end
    
    # If message is being displayed and contents are all written
    if @contents_showing
      # if choice
      if $game_temp.choice_max > 0
        if !@choice_window.active
          @choice_window.visible = true
          @choice_window.active = true
          @choice_window.index = 0
        end
        @choice_window.update
      else
        # If choice isn't being displayed, show pause sign
        self.pause = $game_system.show_pause
      end
        # Cancel
        if Input.trigger?(Input::B)
          if $game_temp.choice_max > 0 and $game_temp.choice_cancel_type > 0
            $game_system.se_play($data_system.cancel_se)
            $game_temp.choice_proc.call($game_temp.choice_cancel_type - 1)
            terminate_message
          end
        end
        # Confirm
        if Input.trigger?(Input::C) and !(@wait > 0)
          @done = true
          $game_system.slave_windows.each_value { |window| 
            window.write_all 
            if !window.done
              @done = false
            end
          }
          if @done
            if $game_temp.choice_max > 0
              $game_system.se_play($data_system.decision_se)
              $game_temp.choice_proc.call(@choice_window.index)
            end
            terminate_message
          else
            @finishing_up = true
          end
        end
        return
      end
      
    if @finishing_up
      $game_system.slave_windows.each_value { |window| 
        if !window.done
          @done = true
          break
        end
      }
      
      if @done = false
        terminate_message
      end
    end
    # If display wait message or choice exists when not fading out
    if @fade_out == false and $game_temp.message_text != nil
      @contents_showing = true
      $game_temp.message_window_showing = true
      
      reset_window
      refresh
      Graphics.frame_reset
      if @show
        self.visible = true
      end
      self.contents_opacity = 0
      if @input_number_window != nil
        @input_number_window.contents_opacity = 0
      end
      @fade_in = true
      return
    end
    # If message which should be displayed is not shown, but window is visible
    if self.visible
      @fade_out = true
      self.opacity -= 48
      @name_window.opacity -= 48
      @comic.opacity -= 48
      @face.opacity -= 48
      @window_back.opacity -= 48
      if self.opacity == 0
        self.visible = false
        @face.opacity = 0
        @window_back.opacity = 0
        @choice_window.visible = false
        @choice_window.active = false
        @comic.opacity = 0
        @name_window.visible = false
        @name_window.dummy_window.visible = false
        @name_window.update
        @fade_out = false
        $game_temp.message_window_showing = false
      end
      return
    end
    
    if $game_temp.battle_calling or $game_temp.shop_calling or $game_temp.name_calling or $game_temp.menu_calling or $game_temp.save_calling or $game_temp.debug_calling
      
        $game_system.indy_windows.each_pair {|name, window| 
          if window.show == true
            window.dispose
            $game_system.indy_windows.delete(name)
          end
        }
    end
  end
  
  #--------------------------------------------------------------------------
  # * Process and write the given character
  #--------------------------------------------------------------------------
  def write_char(c)
    if c == "\000"
      # Return to original text
      c = "\\"
    end
    # If \C[n]
    if c == "\001"
    # Change text color
      @text.sub!(/\[([0-9]+)\]/, "")
      color = $1.to_i
      if color >= 0 and color <= 7
        self.contents.font.color = text_color(color)
      end
      # go to next text
      return
    end
    # If \G
    if c == "\002"
      # Make gold window
      if @gold_window == nil
        @gold_window = Window_Gold.new
        @gold_window.x = 560 - @gold_window.width
        if $game_temp.in_battle
          @gold_window.y = 192
        else
          @gold_window.y = self.y >= 128 ? 32 : 384
        end
        @gold_window.opacity = self.opacity
        @gold_window.back_opacity = self.back_opacity
      end
      # go to next text
      return
    end
    # If \skip
    if c == "\003"
      # toggle text skipping
      $game_system.text_skip = !$game_system.text_skip
      # go to next text
      return
    end
    # If \b
    if c == "\004"
      # toggle bold
      self.contents.font.bold = !self.contents.font.bold
      # go to next text
      return
    end
    # If \i
    if c == "\005"
      # toggle italics
      self.contents.font.italic = !self.contents.font.italic
      # go to next text
      return
    end
    # If \s
    if c == "\006"
      # toggle shadow
      $game_system.shadowed_text = !$game_system.shadowed_text
      # go to next text
      return
    end
    # If \font
    if c == "\007"
      # change font
      @text.sub!(/\[(.*?)\]/, "")
      font = $1.to_s
      $game_system.font = font
      if font == ""
        self.contents.font.name = Font.default_name
      else
        self.contents.font.name = font
      end
      # go to next text
      return
    end
    # If \p[n]
    if c == "\010"
      @text.sub!(/\[([0-9]+)\]/, "")
      @pause_time = $1.to_i

      # go to next text
      return
    end
    
    # If \w[n]
    if c == "\011"
      @text.sub!(/\[([0-9]+)\]/, "")
      @wait = $1.to_i

      # go to next text
      return
    end
    
    # If \ws[n]
    if c == "\013"
      @text.sub!(/\[([0-9]+)\]/, "")
      $game_system.write_speed = $1.to_i

      # go to next text
      return
    end 
    # If \oa[n]
    if c == "\014"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_armors[index]
      # draw the icon
      icon = RPG::Cache.icon(item.icon_name)
      line = self.contents.text_size("dj").height
      self.contents.blt(@x + 4, (@y * line) + 4, icon, Rect.new(0, 0, 24, 24))
      @x += 24

      # go to next text
      return
    end
    
    # If \oi[n]
    if c == "\015"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_items[index]
      # draw the icon
	  if item != nil
		icon = RPG::Cache.icon(item.icon_name) 
		line = self.contents.text_size("dj").height
		self.contents.blt(@x + 4, (@y * line) + 4, icon, Rect.new(0, 0, 24, 24))
		@x += 24
	  end

      # go to next text
      return
    end
    
    # If \os[n]
    if c == "\016"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_skills[index]
      # draw the icon
      icon = RPG::Cache.icon(item.icon_name)
      line = self.contents.text_size("dj").height
      self.contents.blt(@x + 2, (@y * line) + 4, icon, Rect.new(0, 0, 24, 24))
      @x += 24

      # go to next text
      return
    end
    
    # If \ow[n]
    if c == "\017"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_weapons[index]
      # draw the icon
      icon = RPG::Cache.icon(item.icon_name)
      line = self.contents.text_size("dj").height
      self.contents.blt(@x + 2, (@y * line) + 4, icon, Rect.new(0, 0, 24, 24))
      @x += 24
      
      # go to next text
      return
    end
    
    # If \tc
    if c == "\020"
      # center justify
      $game_system.text_justification = CENTER
      get_x_value
      # go to next text
      return
    end
    
    # If \tl
    if c == "\021"
      # left justify
      $game_system.text_justification = LEFT
      get_x_value
      # go to next text
      return
    end
    
    # If \tr
    if c == "\022"
      # right justify
      $game_system.text_justification = RIGHT
      get_x_value
      # go to next text
      return
    end
    
    # If \ignr
    if c == "\023"
      # set ignore flage
      @ignore = true
      # go to next text
      return
    end
    
    # if \slv
    if c == "\024"
      # we need to show a slave window
      @text.sub!(/\[(.*?)\]/, "")
      name = $1.to_s
      $game_system.slave_windows[name].show = true
      return
    end
    
    # if \ind
    if c == "\025"
      # we need to show a independent window
      @text.sub!(/\[(.*?)\]/, "")
      name = $1.to_s
      if $game_system.indy_windows[name].show
        $game_system.indy_windows[name].dispose
        $game_system.indy_windows.delete(name)
      else
        $game_system.indy_windows[name].show = true
      end
      return
    end
    
    # if \c (hex color)
    if c == "\026"
      # convert hex color to RGB
      @text.sub!(/\[([0123456789abcdef]+)\]/, "")
      hex_code = $1.to_s
     
      red   = ("0x" + hex_code.slice(0..1)).hex
      blue  = ("0x" + hex_code.slice(2..3)).hex
      green = ("0x" + hex_code.slice(4..5)).hex
      
      self.contents.font.color = Color.new(red, blue, green)
      return
    end
    
    # If new line text
    if c == "\n"
      # Add 1 to y
      if !@ignore
        @y += 1
      end
      if @text != ""
        get_x_value
      end
      @ignore = false

      # go to next text
      return
    end
    if @ignore
      return
    end
    # Draw text
    line = self.contents.text_size("dj").height
    if $game_system.shadowed_text
      old_color = self.contents.font.color.clone
      self.contents.font.color = $game_system.shadow_color     
      self.contents.draw_text(6 + @x, line * @y + 2, 40, 32, c)
      self.contents.font.color = old_color
    end
    self.contents.draw_text(4 + @x, line * @y, 40, 32, c)
    # Add x to drawn text width
    @x += self.contents.text_size(c).width
  end
  
  def get_x_value
    # text justification - offset for first line
    if $game_system.text_justification == CENTER
      # get the length of the current line
      w = self.contents.text_size(@text.split("\n")[0]).width
      @x = (self.width - w - 48) / 2
    elsif $game_system.text_justification == RIGHT
      # get the length of the current line
      w = self.contents.text_size(@text.split("\n")[0]).width
      @x = self.width - w - 48
    else # left
      if $game_system.face_graphic == ""
        @x = 0
      else
        @x = @face_offset
      end
    end
  end
    
end

#==============================================================================
# ** Window_Choice
#------------------------------------------------------------------------------
#  This message window is used to display choices.
#==============================================================================
class Window_Choice < Window_Selectable
  def initialize (choices)
    super(0, 0, 32, choices.size * 32)
    self.visible = false
    self.active = false
    self.z = 9999
    @index = 0
    @item_max = choices.size
    @choices = choices
    self.contents = Bitmap.new(32, 32)
    self.opacity = $game_system.opacity
    self.back_opacity = $game_system.back_opacity
  end
  
  def refresh
    # determine necessary width
    width = 64
    for line in @choices
      width = [width, (self.contents.text_size(line).width + 48)].max
    end
    self.width = width
    self.height = @choices.size * 32 + 32
    self.contents = Bitmap.new(width - 32, height - 32)
    if $game_system.font == ""
      self.contents.font.name = Font.default_name
    else
      self.contents.font.name = $game_system.font
    end
    if $game_system.font_color.nil?
      self.contents.font.color = normal_color
    else
      self.contents.font.color = $game_system.font_color
    end
    if $game_system.windowskin != ""  
      self.windowskin = RPG::Cache.windowskin($game_system.windowskin)
    else
      self.windowskin = RPG::Cache.windowskin($data_system.windowskin_name)
    end
    
    # draw choices
    y = 0
    for line in @choices
      # Draw text
      if $game_system.shadowed_text
        old_color = self.contents.font.color.clone
        self.contents.font.color = $game_system.shadow_color
        self.contents.draw_text(6, 32 * y + 2, width, 32, line)
        self.contents.font.color = old_color
      end
      self.contents.draw_text(4, y * 32, width, 32, line) 
      y += 1
    end
  end
      
  def set_choices(choices)
    @choices = choices
    @item_max = @choices.size
    for choice in @choices
      choice.gsub!(/\\[Vv]\[([0-9]+)\]/) { $game_variables[$1.to_i] }
      choice.gsub!(/\\[Nn]\[([0-9]+)\]/) { 
        $game_actors[$1.to_i] != nil ? $game_actors[$1.to_i].name : ""
      }
    end
    refresh
  end
end

#==============================================================================
# ** Window_Name
#------------------------------------------------------------------------------
#  This window is used to display names above the message window.  Uncomment
#   and modify the various sections to customize.
#==============================================================================
class Window_Name < Window_Base
  attr_accessor :dummy_window
  
  def initialize
    super(0, 0, 32, 64)
    self.contents = Bitmap.new(32, 32)
    self.opacity = 0
    
    
    @dummy_window = Window_Dummy.new
    
    self.visible = false
  end
  
  def set_name(name)
    @name = name
    refresh
  end
  
  def refresh
    if @name == nil
      return
    end
    self.width = self.contents.text_size(@name).width + 48
    self.contents = Bitmap.new(width - 32, height - 32)
    
    
    if $game_system.name_window
      @dummy_window.x = self.x
      @dummy_window.y = self.y + 12
      @dummy_window.set(height - 24, width - 12)
    end
    
    if $game_system.font == ""
      self.contents.font.name = Font.default_name
    else
      self.contents.font.name = $game_system.font
    end
    # uncomment this and change the font to give the name window a fancy font
    #self.contents.font.name = "Ariel"
    self.contents.font.color = Color.new(0, 0, 0, 255)
    self.contents.draw_text(0, 0, self.width, 32, @name)
    self.contents.draw_text(0, 2, self.width, 32, @name)
    self.contents.draw_text(2, 0, self.width, 32, @name)
    self.contents.draw_text(2, 2, self.width, 32, @name)
    # change the color to give the name window a seperate color
    self.contents.font.color = normal_color
    self.contents.draw_text(1, 1, self.width, 32, @name)
  end
  
  def visible=(v)
    if $game_system.name_window
      @dummy_window.visible = v
    end
    super(v)
  end
  
  
  
  def update
    super
    if $game_system.name_window
      @dummy_window.x = self.x
      @dummy_window.y = self.y + 12
      @dummy_window.update
    end
  end
  
  def dispose
    @dummy_window.dispose
    super
  end
end

class Window_Dummy < Window_Base
  def initialize
    super(0, 0, 32, 64)
    self.z = 9999
    self.visible = false
    
  end
  
  def set(height, width)
    self.height = height
    self.width = width
  end
  
  def update
    super
    if $game_system.windowskin != ""  
      self.windowskin = RPG::Cache.windowskin($game_system.windowskin)
    else
      self.windowskin = RPG::Cache.windowskin($data_system.windowskin_name)
    end
#    self.windowskin = RPG::Cache.windowskin('sandstone')
  end
end

#==============================================================================
# ** Window_Slave
#------------------------------------------------------------------------------
#  These are slave windows to the main message window.  They will close when 
#   the user terminates them.  Initial settings are identical to the main 
#   message window, with one exception.  When in normal mode, it will apear
#   above if the main message is below, below if it is above or centered.  Use
#   message codes to change the settings for this window.
#==============================================================================
class Window_Slave < Window_Base
  attr_accessor :show
  attr_reader :done
  
  def write_all
    @write_all = true
  end
  
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize (text)
    super(0, 0, 33, 33)
    @text = text
    
    # x-coordinate depends on justification
    if @justification == RIGHT
      self.x = 640 - self.width
    elsif @justification == LEFT
      self.x = 0
    else # center
      self.x = (640 - self.width) / 2
    end
    # y-coordinate depends on height
    self.y = 480 - $game_system.window_height - 16
    self.contents = Bitmap.new(width - 32, height - 32)
    if $game_system.font == ""
      self.contents.font.name = Font.default_name
    else
      self.contents.font.name = $game_system.font
    end
    self.visible = false
    self.z = 9998
    @fade_in = false
    @fade_out = false
    @contents_showing = false
    
    # face graphic sprite
    @face = Sprite.new
    @face.opacity = 0
    @face.z = self.z + 1
    @face_offset = 0
    
    # choice window
    @choice_window = Window_Choice.new([])
    @choice_window.back_opacity = $game_system.back_opacity
    
    @comic_style = $game_system.comic_style
    @name = $game_system.name
    
    # comic sprite
    @comic = Sprite.new
    @comic.opacity = 0
    @comic.z = self.z + 1
    if @comic_style == TALK1
      @comic.bitmap = RPG::Cache.windowskin("talk1")
    elsif @comic_style == TALK2
      @comic.bitmap = RPG::Cache.windowskin("talk2")
    else # thought
      @comic.bitmap = RPG::Cache.windowskin("thought")
    end
    
    
    
    @pause_time = 0
    @wait = 0
    
    @mode = $game_system.ums_mode
    self.height = $game_system.window_height
    self.width = $game_system.window_width
    @justification = $game_system.window_justification
    @face_graphic = $game_system.face_graphic
    @face_graphic_justification = $game_system.face_graphic_justification
    @message_event = $game_system.message_event
    if $game_system.message_position == 2 # down
      @message_position = 0
    else
      @message_postion = 2
    end
    @face_graphic_position = $game_system.face_graphic_position
    if $game_system.font == ""
      @font = Font.default_name
    else
      @font = $game_system.font
    end
    @text_justification = $game_system.text_justification
    
    @shake = $game_system.shake
    
    @face_frame = 0
    
    refresh
  end
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    terminate_message
    $game_temp.message_window_showing = false
    if @input_number_window != nil
      @input_number_window.dispose
    end
    @face.dispose
    @choice_window.dispose
    @comic.dispose
    if @name_window != nil
      @name_window.dispose
    end
    super
  end
  #--------------------------------------------------------------------------
  # * Terminate Message
  #--------------------------------------------------------------------------
  def terminate_message
    self.active = false
    self.pause = false
    self.contents.clear
    # Clear showing flag
    @contents_showing = false
    # Call message callback
    if $game_temp.message_proc != nil
      $game_temp.message_proc.call
    end
    # Clear variables related to text, choices, and number input
    $game_temp.message_text = nil
    $game_temp.message_proc = nil
    $game_temp.choice_start = 99
    $game_temp.choice_max = 0
    $game_temp.choice_cancel_type = 0
    $game_temp.choice_proc = nil
    $game_temp.num_input_start = 99
    $game_temp.num_input_variable_id = 0
    $game_temp.num_input_digits_max = 0
    # Open gold window
    if @gold_window != nil
      @gold_window.dispose
      @gold_window = nil
    end
    @choice_window.visible = false
    @choice_window.active = false
    @comic.opacity = 0
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    
    self.contents.clear
    if $game_system.font_color.nil?
      self.contents.font.color = normal_color
    else
      self.contents.font.color = $game_system.font_color
    end
    if $game_system.windowskin != ""  
      self.windowskin = RPG::Cache.windowskin($game_system.windowskin)
    else
      self.windowskin = RPG::Cache.windowskin($data_system.windowskin_name)
    end
    @x = @y = 0

    # If waiting for a message to be displayed
    if @text != nil
      # replace shortcuts with original code
      $game_system.shortcuts.each { |shortcut, code|
        @text.gsub!(shortcut, code)
      }
      
      # Control text processing
      begin
        last_text = @text.clone
        @text.gsub!(/\\[Vv]\[([0-9]+)\]/) { $game_variables[$1.to_i] }
      end until @text == last_text
      @text.gsub!(/\\[Nn]\[([0-9]+)\]/) do
        $game_actors[$1.to_i] != nil ? $game_actors[$1.to_i].name : ""
      end
      
      # window mode
      if @text.index(/\\[Mm]/) != nil
        if $game_system.ums_mode == NORMAL_MODE
          @mode = FIT_WINDOW_TO_TEXT
        else
          @mode = NORMAL_MODE
        end
        @text.gsub!(/\\[Mm]/) { "" }
      end
      
      # window height
      @text.gsub!(/\\[Hh][Ee][Ii][Gg][Hh][Tt]\[([0-9]+)\]/) do
        self.height = $1.to_i
        ""
      end
      
      # window width
      @text.gsub!(/\\[Ww][Ii][Dd][Tt][Hh]\[([0-9]+)\]/) do
        self.width = $1.to_i
        ""
      end
      
      # justification
      @text.gsub!(/\\[Jj][Rr]/) do
        @justification = RIGHT
        reset_window
        ""
      end
      @text.gsub!(/\\[Jj][Cc]/) do
        @justification = CENTER
        reset_window
        ""
      end      
      @text.gsub!(/\\[Jj][Ll]/) do
        @justification = LEFT
        reset_window
        ""
      end
      
      # face graphics
      @text.gsub!(/\\[Ff][Aa][Cc][Ee]\[(.*?)\]/) do
        @face_graphic = $1.to_s
        if $1.to_s == ""
          @face.opacity = 0
        end
        ""
      end
      @text.gsub!(/\\[Ff][Ll]/) do
        @face_graphic_justification = LEFT
        ""
      end
      @text.gsub!(/\\[Ff][Rr]/) do
        @face_graphic_justification = RIGHT
        ""
      end
      
      # event centering
      @text.gsub!(/\\[Ee]\[([0-9]+)\]/) do
        @message_event = $1.to_i
        ""
      end
      
      # comic thingy
      @text.gsub!(/\\[Tt]1/) do
        @comic_style = TALK1
        @comic.bitmap = RPG::Cache.windowskin("talk1.png")
        ""
      end
      @text.gsub!(/\\[Tt]2/) do
        @comic_style = TALK2
        @comic.bitmap = RPG::Cache.windowskin("talk2.png")
        ""
      end
      @text.gsub!(/\\[Tt][Hh]/) do
        @comic_style = THOUGHT
        @comic.bitmap = RPG::Cache.windowskin("thought.png")
        ""
      end
      
      # name window
      @text.gsub!(/\\[Nn][Mm]\[(.*?)\]/) do
        @name = $1.to_s
        if $1.to_s == "" and @name_window != nil
          @name_window.visible = false
        end
        ""
      end
      if @name != ""
        # name window
        @name_window = Window_Name.new
        @name_window.z = self.z + 1
        @name_window.set_name(@name)
      end
      
      # shaking
      @text.gsub!(/\\[Ss][Hh][Kk]\[([0-9]+)\]/) do
        @shake = $1.to_i
        ""
      end
      
      # back opacity
      @text.gsub!(/\\[Bb][Oo][Pp][Cc]\[([0-9]+)\]/) do
        self.back_opacity = $1.to_i
        ""
      end
      
      # opacity
      @text.gsub!(/\\[Oo][Pp][Cc]\[([0-9]+)\]/) do
        self.opacity = $1.to_i
        ""
      end
      
      # Change "\\\\" to "\000" for convenience
      @text.gsub!(/\\\\/) { "\000" }
      # Change "\\C" to "\001" and "\\G" to "\002"
      @text.gsub!(/\\[Cc]\[([0-9]+)\]/) { "\001[#{$1}]" }
      @text.gsub!(/\\[Gg]/) { "\002" }
      @text.gsub!(/\\[Cc]\[0x([0123456789abcdef]+)\]/) { "\026[#{$1}]" }
      
      # text skip code
      @text.gsub!(/\\[Ss][Kk][Ii][Pp]/) { "\003" }
      
      # ignore code
      @text.gsub!(/\\[Ii][Gg][Nn][Rr]/) { "\023" }
      
      # bold and italics
      @text.gsub!(/\\[Bb]/) { "\004" }
      @text.gsub!(/\\[Ii]/) { "\005" }
      
      # shadow
      @text.gsub!(/\\[Ss]/) { "\006" }
      
      # font
      @text.gsub!(/\\[Ff][Oo][Nn][Tt]\[(.*?)\]/) { "\007[#{$1}]" }
      
      # pause and wait
      @text.gsub!(/\\[Pp]\[([0-9]+)\]/) { "\010[#{$1}]" }
      @text.gsub!(/\\[Ww]\[([0-9]+)\]/) { "\011[#{$1}]" }
      
      # write speed
      @text.gsub!(/\\[Ww][Ss]\[([0-9]+)\]/) { "\013[#{$1}]" }
            
      # armor, items, skills, and weapons
      @text.gsub!(/\\[Oo][Aa]\[([0-9]+)\]/) { 
        item = $data_armors[$1.to_i]
        "\014[#{$1}]" + "  " + item.name
      }
      @text.gsub!(/\\[Oo][Ii]\[([0-9]+)\]/) { 
        item = $data_items[$1.to_i]
        "\015[#{$1}]" + "  " + item.name
      }
      @text.gsub!(/\\[Oo][Ss]\[([0-9]+)\]/) { 
        item = $data_skills[$1.to_i]
        "\016[#{$1}]" + "  " + item.name
      }
      @text.gsub!(/\\[Oo][Ww]\[([0-9]+)\]/) { 
        item = $data_weapons[$1.to_i]
        "\017[#{$1}]" + "  " + item.name
      }
      
      # text justification
      @text.gsub!(/\\[Tt][Cc]/) { "\020" }
      @text.gsub!(/\\[Tt][Ll]/) { "\021" }
      @text.gsub!(/\\[Tt][Rr]/) { "\022" }
      
      # Resize the window to fit the contents?
      if @mode == FIT_WINDOW_TO_TEXT
        width = 1
        text = @text.split("\n")
        height = 0
        i = 0
        for line in text
          # don't count this line's width if it has the ignr code
          if !line.include?("\023")
            width = [width, self.contents.text_size(line).width].max
            delta = self.contents.text_size(line).height
            height += delta + (6 * i) + 3
            if i < 3
              i += 1
            end
          end
        end
        
        if @face_graphic != "" and ($game_system.face_graphic_position == CENTER or $game_system.face_graphic_position == BOTTOM)
          width += @face.bitmap.width
          if height < @face.bitmap.height
            height = @face.bitmap.height - 32
          end
        end
        
        if height == 0
          height = 1
        end
         
        self.width = width + 48
        self.height = height + 48
        self.contents = Bitmap.new(width + 16, height)
        if $game_system.font == ""
          self.contents.font.name = Font.default_name
        else
          self.contents.font.name = $game_system.font
        end
        if $game_system.font_color.nil?
          self.contents.font.color = normal_color
        else
          self.contents.font.color = $game_system.font_color
        end

      else
        if self.width != $game_system.window_height or self.height != $game_system.window_width
          self.width = $game_system.window_width
          self.height = $game_system.window_height
          self.contents = Bitmap.new(self.width - 32, self.height - 32)
          if $game_system.font == ""
            self.contents.font.name = Font.default_name
          else
            self.contents.font.name = $game_system.font
          end
          if $game_system.font_color.nil?
            self.contents.font.color = normal_color
          else
            self.contents.font.color = $game_system.font_color
          end
        end
      end
      
      reset_window
      
      get_x_value
      
      @count = Graphics.frame_count
      @pause_time = 0
      @ignore = false
      @done = false
      @face_frame = 0
    end
    
    
    
    # If number input
    if $game_temp.num_input_variable_id > 0
      digits_max = $game_temp.num_input_digits_max
      number = $game_variables[$game_temp.num_input_variable_id]
      @input_number_window = Window_InputNumber.new(digits_max)
      @input_number_window.number = number
      @input_number_window.x = self.x + 8
      @input_number_window.y = self.y + $game_temp.num_input_start * 32
    end
  end
  #--------------------------------------------------------------------------
  # * Set Window Position and Opacity Level
  #--------------------------------------------------------------------------
  def reset_window (change_opacity = true)
    # x-coordinate depends on justification
    if @message_event == -1
      if @justification == RIGHT
        self.x = 640 - self.width
      elsif @justification == LEFT
        self.x = 0
      else # center
        self.x = (640 - self.width) / 2
      end
    else
      if @message_event == 0 or $game_map.events[@message_event] == nil
        # center on player
        event_x = $game_player.screen_x
      else
        # center on the event specified
        event_x = $game_map.events[@message_event].screen_x
      end
      self.x = event_x - self.width / 2
      @comic.x = self.x + (self.width / 2) + 4
    end
    
    if $game_temp.in_battle
      self.y = 16
    else
      if @message_event == -1
        case @message_position
          when 0  # up
            self.y = 16
          when 1  # middle
            self.y = (480 - self.height) / 2
          when 2  # down
            self.y = 480 - self.height - 24
        end
      else
        if @message_event == 0 or $game_map.events[@message_event] == nil
          # above player
          self.y = $game_player.screen_y - self.height - 48
        else
          # above event specified
          self.y = $game_map.events[@message_event].screen_y - self.height - 48
        end
        @comic.y = self.y + self.height - 2
      end
    end
    if self.y < 0 + (@name == "" ? 0 : 16)
      self.y = 0 + (@name == "" ? 0 : 16)
    elsif self.y > 480 - self.height 
      self.y = 480 - self.height
    end
    if self.x < 0 
      self.x = 0
    elsif self.x > 680 - self.width - 48
      self.x = 640 - self.width
    end
    
    if change_opacity
      if $game_system.message_frame == 0
        self.opacity = 255
      else
        self.opacity = 0
      end
      self.back_opacity = $game_system.back_opacity
    end
    
    # face stuff
      if @face_graphic != ""  
        # the player has chosen to show a face graphic
        if @done and $game_system.resting_face != ""
          @face.bitmap = RPG::Cache.picture(@face_graphic + $game_system.resting_face)
          if @face_frame * $game_system.face_frame_width >= @face.bitmap.width
            @face_frame = 0
          end
        else
          @face.bitmap = RPG::Cache.picture(@face_graphic)
        end
        
        # picture y-coordinate
        if @face_graphic_position == ABOVE
          @face.y = self.y - @face.bitmap.height
          @face_offset = 0
        elsif @face_graphic_position == CENTER
          delta = (@face.bitmap.height - self.height) / 2
          @face.y = self.y - delta
          if $game_system.animated_faces
            @face_offset = $game_system.face_frame_width + 16
          else
            @face_offset = @face.bitmap.width + 16
          end
        elsif @face_graphic_position == BOTTOM 
          @face.y = self.y + self.height - @face.bitmap.height
          if $game_system.animated_faces
            @face_offset = $game_system.face_frame_width + 16
          else
            @face_offset = @face.bitmap.width + 16
          end
        else # side
          delta = (@face.bitmap.height - self.height) / 2
          @face.y = self.y - delta
          @face_offset = 0
        end
        
        # picture x-coordinate
        if @face_graphic_justification == LEFT
          if @face_graphic_position == SIDE
            @face.x = self.x - @face.bitmap.width
          else
            @face.x = self.x + 10
          end
        else
          if $game_system.animated_faces
            offset = @face.bitmap.width - $game_system.face_frame_width
          else
            offset = 0
          end
          if @face_graphic_position == SIDE
            @face.x = self.x + self.width + offset
          else
            @face.x = self.x + self.width - @face.bitmap.width - 10 + offset
            @face_offset = 0
          end
        end
        
        if $game_system.animated_faces
          @face.src_rect = Rect.new(@face_frame * $game_system.face_frame_width, 0, $game_system.face_frame_width, @face.bitmap.height)
          if @done and $game_system.resting_face != ""
            pause = $game_system.resting_animation_pause
          else
            pause = $game_system.animation_pause
          end
          if Graphics.frame_count % pause == 0
            @animate_face = true
          end
          if @animate_face
            if Graphics.frame_count % 3 == 0
              @face_frame += 1
              if @face_frame * $game_system.face_frame_width >= @face.bitmap.width
                @face_frame = 0
                @animate_face = false
              end
            end
          end
        end
      end
      
      # name window
      if @name != "" and @name != nil
        @name_window.set_name(@name)
        @name_window.x = self.x
        @name_window.y = self.y - 36
      end
      
      # If choice
    if $game_temp.choice_max > 0
      @choice_window.set_choices($game_temp.choices)
      # determine x and y coords for choice window
      if $game_system.choice_justification == LEFT
        @choice_window.x = self.x
      else
        @choice_window.x = self.x + self.width - @choice_window.width
      end
      if $game_system.choice_position == ABOVE
        # check to make sure there is enough room above the textbox
        if self.y < @choice_window.height
          # not enough room above, place below
          @choice_window.y = self.y + self.height
        else
          # draw above
          @choice_window.y = self.y - @choice_window.height
        end
      elsif $game_system.choice_position == BOTTOM
        # check to make sure there is enough room below the textbox
        if (480 - self.y - self.height) < @choice_window.height
          # not enough room below, place above
          @choice_window.y = self.y - @choice_window.height
        else
          # draw below 
          @choice_window.y = self.y + self.height
        end
      else # side
        if $game_system.choice_justification == LEFT
          # check to make sure there's room on the left side
          if self.y < @choice_window.width
            # not enough room on the side, check to make sure there's room below
            if (480 - self.y - self.height) < @choice_window.height
              # not enough room below, place above
              @choice_window.y = self.y - @choice_window.height
            else
              # draw below 
              @choice_window.y = self.y + self.height
            end
          else
            # place on the left side
            @choice_window.y = self.y
            @choice_window.x = self.x - @choice_window.width
          end
        else # right
          # check to make sure there's room on the right side
          if (680 - (self.y + self.width)) < @choice_window.width
            # not enough room on the side, check to make sure there's room below
            if (480 - self.y - self.height) < @choice_window.height
              # not enough room below, place above
              @choice_window.y = self.y - @choice_window.height
            else
              # draw below 
              @choice_window.y = self.y + self.height
            end
          else
            # place on the left side
            @choice_window.y = self.y
            @choice_window.x = self.x + self.width
          end
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    
    if !@show
      return
    else
      self.visible = true
      if @face_graphic != ""
        @face.opacity = 255
      end
      if $game_system.comic_enabled and @message_event != -1
        @comic.opacity = 255
      end
      if @name != ""
        @name_window.visible = true
        if $game_system.name_window
          @name_window.dummy_window.visible = true
        end
      end
      if @input_number_window != nil
        @input_number_window.contents_opacity = 255
      end
      reset_window
    end
    
    
    if (@contents_showing and $game_system.message_event != -1 and @shake == 0) or $game_system.animated_faces
      reset_window(false)
    end
    
    if $game_system.shake != 0  # shake the window
      if @ascending
        if @target_x != self.x
          self.x += 1
        else
          @ascending = false
          @target_x = self.x - ($game_system.shake * 2)
        end
      else 
        if @target_x != self.x
          self.x -= 1
        else
          @ascending = true
          @target_x = self.x + ($game_system.shake * 2)
        end
      end
    end
    
    if @wait > 0
      @wait -= 1
      if @wait == 0
        terminate_message
        return
      end
    end
    
    # If fade in
    if @fade_in
      self.contents_opacity += 24
      if @face_graphic != ""
        @face.opacity += 24
      end
      if $game_system.comic_enabled and @message_event != -1
        @comic.opacity += 24
      end
      if @name != ""
        @name_window.visible = true
      end
      if @input_number_window != nil
        @input_number_window.contents_opacity += 24
      end
      if self.contents_opacity == 255
        @fade_in = false
      end
      return
    end
    
    # write the text
    if @text != nil and @text != ""
      speed = $game_system.write_speed
      if $game_system.text_skip
        if $game_system.skip_mode == WRITE_FASTER and Input.press?(Input::C)
          # the player is holding the action button, write faster
          speed /= 3
        elsif $game_system.skip_mode == WRITE_ALL and @write_all
          # the player pressed the action button, write all the text
          while (c = @text.slice!(/./m)) != nil
            write_char(c)
          end
          return
        end
      end
      while @ignore
        c = @text.slice!(/./m)
        if c != nil
          write_char(c)
        end
      end
      if @pause_time > 0
        @pause_time -= 1
        return
      end
      if Graphics.frame_count - @count >= speed
        if $game_system.sound_effect != ""
          Audio.se_play("Audio/SE/" + $game_system.sound_effect, 80, 100)
        end
        @count = Graphics.frame_count
        c = @text.slice!(/./m)
        if c != nil
          write_char(c)
        end
      end
      return
    end
    
    @done = true
    
    # If inputting number
    if @input_number_window != nil
      @input_number_window.update
      # Confirm
      if Input.trigger?(Input::C)
        $game_system.se_play($data_system.decision_se)
        $game_variables[$game_temp.num_input_variable_id] =
          @input_number_window.number
        $game_map.need_refresh = true
        # Dispose of number input window
        @input_number_window.dispose
        @input_number_window = nil
        terminate_message
      end
      return
    end
    
    if @wait != 0
      return
    end
    
    # If message is being displayed and contents are all written
    if @contents_showing
      # if choice
      if $game_temp.choice_max > 0
        if !@choice_window.active
          @choice_window.visible = true
          @choice_window.active = true
          @choice_window.index = 0
        end
        @choice_window.update
      else
        # If choice isn't being displayed, show pause sign
        self.pause = true
      end
      return
    end
  end
  
  #--------------------------------------------------------------------------
  # * Process and write the given character
  #--------------------------------------------------------------------------
  def write_char(c)
    if c == "\000"
      # Return to original text
      c = "\\"
    end
    # If \C[n]
    if c == "\001"
    # Change text color
      @text.sub!(/\[([0-9]+)\]/, "")
      color = $1.to_i
      if color >= 0 and color <= 7
        self.contents.font.color = text_color(color)
      end
      # go to next text
      return
    end
    # If \G
    if c == "\002"
      # Make gold window
      if @gold_window == nil
        @gold_window = Window_Gold.new
        @gold_window.x = 560 - @gold_window.width
        if $game_temp.in_battle
          @gold_window.y = 192
        else
          @gold_window.y = self.y >= 128 ? 32 : 384
        end
        @gold_window.opacity = self.opacity
        @gold_window.back_opacity = self.back_opacity
      end
      # go to next text
      return
    end
    # If \skip
    if c == "\003"
      # toggle text skipping
      #$game_system.text_skip = !$game_system.text_skip
      # go to next text
      return
    end
    # If \b
    if c == "\004"
      # toggle bold
      self.contents.font.bold = !self.contents.font.bold
      # go to next text
      return
    end
    # If \i
    if c == "\005"
      # toggle italics
      self.contents.font.italic = !self.contents.font.italic
      # go to next text
      return
    end
    # If \s
    if c == "\006"
      # toggle shadow
      #$game_system.shadowed_text = !$game_system.shadowed_text
      # go to next text
      return
    end
    # If \font
    if c == "\007"
      # change font
      @text.sub!(/\[(.*?)\]/, "")
      font = $1.to_s
      @font = font
      if font == ""
        self.contents.font.name = Font.default_name
      else
        self.contents.font.name = font
      end
      # go to next text
      return
    end
    # If \p[n]
    if c == "\010"
      @text.sub!(/\[([0-9]+)\]/, "")
      @pause_time = $1.to_i

      # go to next text
      return
    end
    
    # If \w[n]
    if c == "\011"
      @text.sub!(/\[([0-9]+)\]/, "")
      @wait = $1.to_i

      # go to next text
      return
    end
    
    # If \ws[n]
    if c == "\013"
      @text.sub!(/\[([0-9]+)\]/, "")
      $game_system.write_speed = $1.to_i

      # go to next text
      return
    end 
    # If \oa[n]
    if c == "\014"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_armors[index]
      # draw the icon
      icon = RPG::Cache.icon(item.icon_name)
      self.contents.blt(@x + 2, (@y * 32) + 4, icon, Rect.new(0, 0, 24, 24))
      @x += 24

      # go to next text
      return
    end
    
    # If \oi[n]
    if c == "\015"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_items[index]
      # draw the icon
      icon = RPG::Cache.icon(item.icon_name)
      self.contents.blt(@x + 2, (@y * 32) + 4, icon, Rect.new(0, 0, 24, 24))
      @x += 24

      # go to next text
      return
    end
    
    # If \os[n]
    if c == "\016"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_skills[index]
      # draw the icon
      icon = RPG::Cache.icon(item.icon_name)
      self.contents.blt(@x + 2, (@y * 32) + 4, icon, Rect.new(0, 0, 24, 24))
      @x += 24

      # go to next text
      return
    end
    
    # If \ow[n]
    if c == "\017"
      @text.sub!(/\[([0-9]+)\]/, "")
      index = $1.to_i
      @text.sub!("  ", "")
      item = $data_weapons[index]
      # draw the icon
      icon = RPG::Cache.icon(item.icon_name)
      self.contents.blt(@x + 2, (@y * 32) + 4, icon, Rect.new(0, 0, 24, 24))
      @x += 24
      
      # go to next text
      return
    end
    
    # If \tc
    if c == "\020"
      # center justify
      @text_justification = CENTER
      get_x_value
      # go to next text
      return
    end
    
    # If \tl
    if c == "\021"
      # left justify
      @text_justification = LEFT
      get_x_value
      # go to next text
      return
    end
    
    # If \tr
    if c == "\022"
      # right justify
      @text_justification = RIGHT
      get_x_value
      # go to next text
      return
    end
    
    # If \ignr
    if c == "\023"
      # set ignore flage
      @ignore = true
      # go to next text
      return
    end
    
    # if \c (hex color)
    if c == "\026"
      # convert hex color to RGB
      @text.sub!(/\[([0123456789abcdef]+)\]/, "")
      hex_code = $1.to_s
     
      red   = ("0x" + hex_code.slice(0..1)).hex
      blue  = ("0x" + hex_code.slice(2..3)).hex
      green = ("0x" + hex_code.slice(4..5)).hex
      
      self.contents.font.color = Color.new(red, blue, green)
      return
    end
    
    # If new line text
    if c == "\n"
      # Add 1 to y
      if !@ignore
        @y += 1
      end
      if @text != ""
        get_x_value
      end
      @ignore = false

      # go to next text
      return
    end
    if @ignore
      return
    end
    # Draw text
    line = self.contents.text_size("dj").height
    if $game_system.shadowed_text
      old_color = self.contents.font.color.clone
      self.contents.font.color = $game_system.shadow_color
      self.contents.draw_text(6 + @x, line * @y + 2, 40, 32, c)
      self.contents.font.color = old_color
    end
    self.contents.draw_text(4 + @x, line * @y, 40, 32, c)
    # Add x to drawn text width
    @x += self.contents.text_size(c).width
  end
  
  def get_x_value
    # text justification - offset for first line
    if @text_justification == CENTER
      # get the length of the current line
      w = self.contents.text_size(@text.split("\n")[0]).width
      @x = (self.width - w - 48) / 2
    elsif @text_justification == RIGHT
      # get the length of the current line
      w = self.contents.text_size(@text.split("\n")[0]).width
      @x = self.width - w - 48
    else # left
      if @face_graphic == ""
        @x = 0
      else
        @x = @face_offset
      end
    end
  end
end

#==============================================================================
# ** Window_InputNumber
#------------------------------------------------------------------------------
#  This window is for inputting numbers, and is used within the
#  message window.
#==============================================================================

class Window_InputNumber < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     digits_max : digit count
  #--------------------------------------------------------------------------
  def initialize(digits_max)
    @digits_max = digits_max
    @number = 0
    # Calculate cursor width from number width (0-9 equal width and postulate)
    dummy_bitmap = Bitmap.new(32, 32)
    @cursor_width = dummy_bitmap.text_size("0").width + 8
    dummy_bitmap.dispose
    super(0, 0, @cursor_width * @digits_max + 32, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    if $game_system.font == ""
      self.contents.font.name = Font.default_name
    else
      self.contents.font.name = $game_system.font
    end
    self.z += 9999
    self.opacity = $game_system.opacity
    self.back_opacity = $game_system.back_opacity
    @index = 0
    refresh
    update_cursor_rect
  end
  
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    if $game_system.font_color.nil?
      self.contents.font.color = normal_color
    else
      self.contents.font.color = $game_system.font_color
    end
    if $game_system.windowskin != ""  
      self.windowskin = RPG::Cache.windowskin($game_system.windowskin)
    else
      self.windowskin = RPG::Cache.windowskin($data_system.windowskin_name)
    end
    s = sprintf("%0*d", @digits_max, @number)
    for i in 0...@digits_max
      # Draw text
      if $game_system.shadowed_text
        old_color = self.contents.font.color.clone
        self.contents.font.color = $game_system.shadow_color
        self.contents.draw_text(i * @cursor_width + 6, 2, 32, 32, s[i,1])
        self.contents.font.color = old_color
      end
      self.contents.draw_text(i * @cursor_width + 4, 0, 32, 32, s[i,1])
    end
  end
end