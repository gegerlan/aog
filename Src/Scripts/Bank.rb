#==============================================================================
# Banking System
#--------------------------------------------------------------------------
#   Created By SephirothSpawn (12.03.05)
#   Last Updated: 12.03.05
#==============================================================================

#==============================================================================
# ** Scene_Title
#==============================================================================
class Scene_Title
  #--------------------------------------------------------------------------
  # * Alias Command: New Game
  #--------------------------------------------------------------------------
  alias bank_command_new_game command_new_game
  #--------------------------------------------------------------------------
  # * Command: New Game
  #--------------------------------------------------------------------------
  def command_new_game
    $game_bank = Game_BankSystem.new
    bank_command_new_game
  end
end

#==============================================================================
# ** Window_RefreshCommand
#==============================================================================
class Window_RefreshCommand < Window_Selectable
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     width    : window width
  #     commands : command text string array
  #--------------------------------------------------------------------------
  def initialize(width, commands)
    # Compute window height from command quantity
    super(0, 0, width, commands.size * 32 + 32)
    @item_max = commands.size
    @commands = commands
    refresh
    self.index = 0
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh(commands = @commands)
    @commands = commands
    @item_max = commands.size
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    self.contents = Bitmap.new(width - 32, @item_max * 32)
    for i in 0...@item_max
      draw_item(i, normal_color)
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #     index : item number
  #     color : text color
  #--------------------------------------------------------------------------
  def draw_item(index, color)
    self.contents.font.color = color
    self.contents.draw_text(0, 32 * index, self.contents.width - 8, 32, @commands[index], 1)
  end
  #--------------------------------------------------------------------------
  # * Disable Item
  #     index : item number
  #--------------------------------------------------------------------------
  def disable_item(index)
    draw_item(index, disabled_color)
  end
  #--------------------------------------------------------------------------
  # * Undisable Item
  #     index : item number
  #--------------------------------------------------------------------------
  def disable_item(index)
    draw_item(index, normal_color)
  end
end

#==============================================================================
# ** Game_BankSystem
#==============================================================================
class Game_BankSystem
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :account_balance
  attr_accessor :interest_rate
  attr_accessor :saving_bonds
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @account_balance = 0
    @interest_rate = 1
    @saving_bonds = []
    @last_interest_time = 0
  end
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    # Updates Deposited Amount
    interest_time = (Graphics.frame_count / Graphics.frame_rate - @last_interest_time) / 3600.0
    interest_amt = (@account_balance * @interest_rate / 100.0 * interest_time).to_i
    if interest_amt > 0
      @last_interest_time = Graphics.frame_count / Graphics.frame_rate
      @account_balance += interest_amt
      # Refreshes Data Windows
      $scene.refresh_windows
    end
  end
  #--------------------------------------------------------------------------
  # * Deposit
  #--------------------------------------------------------------------------
  def deposit(amount)
    $game_party.lose_gold(amount)
    @account_balance += amount
  end
  #--------------------------------------------------------------------------
  # * Withdraw
  #--------------------------------------------------------------------------
  def withdraw(amount)
    @account_balance -= amount
    $game_party.gain_gold(amount)
  end
  #--------------------------------------------------------------------------
  # * Add Savings Bond
  #--------------------------------------------------------------------------
  def add_bond(bond)
    @saving_bonds.push(bond)
    @saving_bonds.sort! {|a, b| a.name <=> b.name}
  end
end

#==============================================================================
# ** Savings_Bond
#==============================================================================
class Savings_Bond
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :name
  attr_accessor :cost
  attr_accessor :interest_rate
  attr_accessor :length
  attr_accessor :time_bought
  attr_accessor :time_finished
  attr_accessor :mature_value
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     name           : Savings Bond Name
  #     cost             : Savings Bond Cost
  #     interest_rate : Savings Bond Interest Rate (In Percent)
  #     length          : Length of Hours until Mature
  #--------------------------------------------------------------------------
  def initialize(name, cost, interest_rate, length)
    @name = name
    @cost = cost
    @interest_rate = interest_rate
    @length = length
    @mature_value = (@cost * (1+ @interest_rate / 100.0)).to_i
  end
  #--------------------------------------------------------------------------
  # * Set Times
  #--------------------------------------------------------------------------
  def set_times
    @time_bought = Graphics.frame_count / Graphics.frame_rate
    @time_finished = @time_bought + @length * 3600
  end
  #--------------------------------------------------------------------------
  # * Make Time to HH:MM:SS
  #--------------------------------------------------------------------------
  def return_time(time)
    hours      = time / 60 / 60
    minutes   = time / 60 % 60
    seconds   = time % 60
    return sprintf("%02d:%02d:%02d", hours, minutes, seconds)
  end
end

#==============================================================================
# ** Window_BankNumber
#==============================================================================
class Window_BankNumber < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(640, 272, 240, 192)
      self.opacity = 175
    self.contents = Bitmap.new(width - 32, height - 32)
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #     money  : Gold being...
  #     type      : Deposit or Withdraw
  #--------------------------------------------------------------------------
  def refresh(money, type)
    contents.clear
    # Deposit or Withdraw
    contents.font.color = system_color
    contents.draw_text(0, 0, contents.width, 24, "Amount to #{type}", 1)
    if type == "Deposit"
      # Draws Game Party Gold
      contents.draw_text(4, 48, contents.width, 24, "Current #{$data_system.words.gold}:")
      contents.font.color = normal_color
      contents.draw_text(-4, 48, contents.width, 24, $game_party.gold.to_i.to_s, 2)
    else
      # Draws Account Balance
      contents.draw_text(4, 48, contents.width, 24, "Account Balance:")
      contents.font.color = normal_color
      contents.draw_text(-4, 48, contents.width, 24, $game_bank.account_balance.to_s, 2)
    end
    # Draws Money Being Deposited or Withdrawn
    contents.font.color = system_color
    contents.draw_text(4, 72, contents.width, 24, "#{type} Amount:")
    contents.font.color = normal_color
    contents.draw_text(-4, 72, contents.width, 24, "- #{money}", 2)
    # Draws Line
    line = ""
    while contents.text_size(line).width < contents.width
      line += "-"
    end
    contents.draw_text(0, 96, contents.width, 24, line, 2)
    # Draws Game Party Gold Amont
    contents.font.color = system_color
    contents.draw_text(4, 112, contents.width, 32, "#{$data_system.words.gold} After:")
    amount = $game_party.gold
    amount += type == "Deposit" ? -money : money
    contents.font.color = normal_color
    contents.draw_text(-4, 112, contents.width, 32, amount.to_s, 2)
    # Draws Deposit Amont
    amount = $game_bank.account_balance
    amount += type == "Deposit" ? money : -money
    contents.font.color = system_color
    contents.draw_text(4, 136, contents.width, 32, "Balance After:")
    contents.font.color = normal_color
    contents.draw_text(-4, 136, contents.width, 32, amount.to_s, 2)
  end
end

#==============================================================================
# ** Window_BankBio
#==============================================================================
class Window_BankBio < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(-240, 272, 240, 192)
      self.opacity = 175
    self.contents = Bitmap.new(width - 32, height - 32)
    refresh
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    # Deposit or Withdraw
    contents.font.color = system_color
    # Draws Actor Name in Postition 1
    contents.font.color = normal_color
    contents.draw_text(0, 0, contents.width, 24, "#{$game_party.actors[0].name}", 1)
    # Draws Game Party Gold
    contents.font.color = system_color
    contents.draw_text(4, 32, contents.width, 24, "Current #{$data_system.words.gold}:")
    contents.font.color = normal_color
    contents.draw_text(-4, 32, contents.width, 24, $game_party.gold.to_i.to_s, 2)
    # Draws Account Balance
    contents.font.color = system_color
    contents.draw_text(4, 56, contents.width, 24, "Account Balance:")
    contents.font.color = normal_color
    contents.draw_text(-4, 56, contents.width, 24, $game_bank.account_balance.to_s, 2)
    # Draws Number of Savings Bond's
    contents.font.color = system_color
    contents.draw_text(4, 80, contents.width, 24, "Bonds Owned:")
    contents.font.color = normal_color
    contents.draw_text(-4, 80, contents.width, 24, $game_bank.saving_bonds.size.to_s, 2)
    # Draws Value of Savings Bond's
    value = 0
    $game_bank.saving_bonds.each { |x| value += x.mature_value}
    contents.font.color = system_color
    contents.draw_text(4, 104, contents.width, 24, "Bonds Value:")
    contents.font.color = normal_color
    contents.draw_text(-4, 104, contents.width, 24, value.to_s, 2)
    # Draws Current Interest Rate
    contents.font.color = system_color
    contents.draw_text(4, 136, contents.width, 24, "Interest Rate:")
    contents.font.color = normal_color
    contents.draw_text(-4, 136, contents.width, 24, "#{$game_bank.interest_rate} %", 2)
  end
end

#==============================================================================
# ** Window_Bond
#==============================================================================
class Window_Bond < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super(-240, 264, 240, 200)
      self.opacity = 175
    self.contents = Bitmap.new(width - 32, height - 32)
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #     bond    : Savings Bond
  #--------------------------------------------------------------------------
  def refresh(bond, bought = false)
    contents.clear
    unless bond == nil
      # Draws Bond Name
      contents.font.color = system_color
      contents.draw_text(0, 0, contents.width, 24, bond.name, 1)
      # Draws Bond Cost
      contents.font.color = system_color
      contents.draw_text(4, 24, contents.width, 24, "Bond Cost:")
      contents.font.color = normal_color
      contents.draw_text(-4, 24, contents.width, 24, bond.cost.to_s, 2)
      # Draws Bond Mature Value
      contents.font.color = system_color
      contents.draw_text(4, 48, contents.width, 24, "Mature Value:")
      contents.font.color = normal_color
      contents.draw_text(-4, 48, contents.width, 24, "#{bond.mature_value}", 2)
      # Draws Bond Interest Rate
      contents.font.color = system_color
      contents.draw_text(4, 72, contents.width, 24, "Interest Rate:")
      contents.font.color = normal_color
      contents.draw_text(-4, 72, contents.width, 24, "#{bond.interest_rate} %", 2)
      # Draws Length until Maturity
      contents.font.color = system_color
      contents.draw_text(4, 96, contents.width, 24, "Maturity Time:")
      contents.font.color = normal_color
      contents.draw_text(-4, 96, contents.width, 24, "#{bond.length} Hours", 2)
      # Display only if Purchased CD
      if bought
        # Draws Time Bought
        contents.font.color = system_color
        contents.draw_text(4, 120, contents.width, 24, "Time Bought:")
        contents.font.color = normal_color
        contents.draw_text(-4, 120, contents.width, 24, bond.return_time(bond.time_bought), 2)
        # Draws Time Finished
        contents.font.color = system_color
        contents.draw_text(4, 144, contents.width, 24, "Time Finished:")
        contents.font.color = normal_color
        contents.draw_text(-4, 144, contents.width, 24, bond.return_time(bond.time_finished), 2)
      end
    end
  end
end

#==============================================================================
# ** Scene_Bank
#==============================================================================
class Scene_Bank
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     interest rate   :   Changes Current Interest Rate (Leave 0 for no Change)
  #     bonds           :   Avaliable CD's For Purchasing
  #--------------------------------------------------------------------------
  def initialize(interest_rate = $game_bank.interest_rate, 
      bonds = [ Savings_Bond.new("CD-7", 100, 7.5, 7), Savings_Bond.new("CD-14", 500, 15, 14)])
    $game_bank.interest_rate = interest_rate unless interest_rate == 0
    @bonds = bonds
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    # Current Phase
    @phase = -1
    # Refreshing Variables
    @amount, @depositing = 0, true
    @current_bond, @bond_bought = nil, false
    # Make sprite set
    @spriteset = Spriteset_Map.new
    # Help Window
    @help_window = Window_Help.new
      @help_window.y, @help_window.opacity = -64, 175
      @help_window.set_text("Welcome to the Bank", 1)
    # Bank Bio
    @bank_bio_window = Window_BankBio.new
    # Avaliable Bond Information Display Window
    @av_bond_display_window = Window_Bond.new
    # Owned Bond Information Display Window
    @own_bond_display_window = Window_Bond.new
    # Main Command
    @main_command = Window_RefreshCommand.new(180, [
        "Deposit #{g_word = $data_system.words.gold}",
        "Withdraw #{g_word}", "Purchase Bond", "Get Mature Bond", "Exit"])
      @main_command.x, @main_command.y, @main_command.opacity = 644, 272, 175
      @main_command.active = false
    # Bank Number Window
    @bank_number_window = Window_BankNumber.new
    # Avaliable Bonds Command
    commands = []
    @bonds.each {|x| commands.push(x.name)}; commands.push("Back")
    @av_bond_command = Window_RefreshCommand.new(180, commands)
      @av_bond_command.x, @av_bond_command.y = 644, 272
      @av_bond_command.height, @av_bond_command.opacity = 192, 175
      @av_bond_command.active = false
    # CD's Have
    @own_bond_command = Window_RefreshCommand.new(180, get_cd_list)
      @own_bond_command.x, @own_bond_command.y = 644, 272
      @own_bond_command.height, @own_bond_command.opacity = 192, 175
      @own_bond_command.active = false
    # Scene Objects
    @objects = [@spriteset, @help_window, @bank_bio_window, @av_bond_display_window, 
        @own_bond_display_window, @main_command, @bank_number_window,
        @av_bond_command, @own_bond_command]
    # Execute transition
    Graphics.transition
    # Main loop
    while $scene == self
      # Update game screen
      Graphics.update
      # Update input information
      Input.update
      # Update Objects
      @objects.each {|x| x.update}
      # Updates Bank System
      $game_bank.update
      # Frame update
      update
    end
    # Prepare for transition
    Graphics.freeze
    # Dispose of windows
    @objects.each {|x| x.dispose}
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    # Splits Phases Up
    case @phase
    when -1 # Intro Phase
      intro_update
    when 0  # Main Phase
      main_update
    when 1  # Deposit or Withdraw Phase
      account_update
    when 2  # Buy CD Phase
      buy_bond_update
    when 3  # Get Mature CD Phse
      get_bond_update
    when 99 # Exit Phase
      exit_update
    end
  end
  #--------------------------------------------------------------------------
  # * Intro Update
  #--------------------------------------------------------------------------
  def intro_update
    # Moves Window Down
    @help_window.y += 4 if @help_window.y < 0
    if @help_window.y == 0
      # Input Processing
      if Input.trigger?(Input::B)
        $game_system.se_play($data_system.cancel_se)
        # Returns to Scene
        @phase = 99
      elsif Input.trigger?(Input::C)
        $game_system.se_play($data_system.decision_se)
        # Switchs to Main Phase
        @phase = 0
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Main Update
  #--------------------------------------------------------------------------
  def main_update
    # Turns On Main Command
    @main_command.active = true
    # Turns Off Other Command Windows
    @av_bond_command.active = @own_bond_command.active = false
    # Moves In Active Windows
    @bank_bio_window.z = @main_command.z = 9999
    @bank_bio_window.x += 32 if @bank_bio_window.x < 16
    @main_command.x -= 25 if @main_command.x > 444
    # Moves Out Inactive Windows
    @av_bond_display_window.x -= 32 if @av_bond_display_window.x > - 240
    [@av_bond_display_window, @own_bond_display_window, @bank_number_window,
      @av_bond_command, @own_bond_command].each {|window| window.z = 9995}
    [@av_bond_command, @own_bond_command].each {|command|
      command.x += 25 if command.x < 644}
    @own_bond_display_window.x -= 25 if @own_bond_display_window.x > - 240
    @bank_number_window.x += 32 if @bank_number_window.x < 640
    # Sets Help Window
    case @main_command.index
      when 0; @help_window.set_text("Deposit Money Into your Account", 1)
      when 1; @help_window.set_text("Withdraw Money From your Account", 1)
      when 2; @help_window.set_text("Purchase a Savings Bond", 1)
      when 3; @help_window.set_text("Take Out Mature Savings Bond", 1)
      when 4; @help_window.set_text("Exit Bank", 1)
    end
    # Input Processing
    if Input.trigger?(Input::B) # Returns to Map
      $game_system.se_play($data_system.cancel_se)
      @phase = 99
    elsif Input.trigger?(Input::C)
      $game_system.se_play($data_system.decision_se)
      case @main_command.index
      when 0  # Deposit
        @amount, @depositing = 0, true
        refresh_windows
        @help_window.set_text("Deposit #{@amount} #{$data_system.words.gold}", 1)
        @phase = 1
      when 1  # Withdraw
        @amount, @depositing = 0, false
        refresh_windows
        @help_window.set_text("Withdraw #{@amount} #{$data_system.words.gold}", 1)
        @phase = 1
      when 2  # Buy CD
        @current_bond = @bonds[@av_bond_command.index]
        @bond_bought = false
        refresh_windows
        @phase = 2
      when 3  # Get CD
        @current_bond = $game_bank.saving_bonds[@own_bond_command.index]
        @bond_bought = true
        refresh_windows
        @phase = 3
      when 4  # Exit Bank
        @phase = 99
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Accpunt Update
  #--------------------------------------------------------------------------
  def account_update
    # Turns Off Command Windows
    @main_command.active = @av_bond_command.active = @own_bond_command.active = false
    # Moves In Active Windows
    @bank_bio_window.z = @bank_number_window.z = 9999
    @bank_bio_window.x += 32 if @bank_bio_window.x < 16
    @bank_number_window.x -= 32 if @bank_number_window.x > 384
    # Moves Out Inactive Windows
    @av_bond_display_window.z = @own_bond_display_window.z =
      @main_command.z = @av_bond_command.z = @own_bond_command.z = 9995
    @av_bond_display_window.x -= 32 if @av_bond_display_window.x > - 240
    [@own_bond_display_window].each {|window| window.x -= 25 if window.x > - 240}
    [@main_command, @av_bond_command, @own_bond_command].each {|command|
        command.x += 25 if command.x < 644}
    # Input Processing
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @phase = 0
    elsif Input.trigger?(Input::C)
      $game_system.se_play($data_system.shop_se)
      if @depositing
        $game_bank.deposit(@amount)
        refresh_windows
        @phase = 0
      else
        $game_bank.withdraw(@amount)
        refresh_windows
        @phase = 0
      end
    elsif Input.repeat?(Input::LEFT) && Input.press?(Input::LEFT)
      if @amount > 0
        $game_system.se_play($data_system.cursor_se)
        @amount -= 1 
        refresh_windows
        @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
      else
        $game_system.se_play($data_system.buzzer_se)
      end
    elsif Input.repeat?(Input::RIGHT) && Input.press?(Input::RIGHT)
      if @depositing
        if @amount < $game_party.gold
          $game_system.se_play($data_system.cursor_se)
          @amount += 1 
          refresh_windows
          @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
        else
          $game_system.se_play($data_system.buzzer_se)
        end
      else
        if @amount < $game_bank.account_balance
          $game_system.se_play($data_system.cursor_se)
          @amount += 1 
          refresh_windows
          @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
        else
          $game_system.se_play($data_system.buzzer_se)
        end
      end
    elsif Input.repeat?(Input::UP) && Input.press?(Input::UP)
      if @amount == 0
        $game_system.se_play($data_system.buzzer_se)
      else
        $game_system.se_play($data_system.cursor_se)
        @amount > 10 ? @amount -= 10 : @amount = 0
        refresh_windows
        @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
      end
    elsif Input.repeat?(Input::DOWN) && Input.press?(Input::DOWN)
      if @depositing
        if @amount < $game_party.gold
          $game_system.se_play($data_system.cursor_se)
          @amount < $game_party.gold - 10 ? @amount += 10 : @amount = $game_party.gold
          refresh_windows
          @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
        else
          $game_system.se_play($data_system.buzzer_se)
        end
      else
        if @amount < $game_bank.account_balance
          $game_system.se_play($data_system.cursor_se)
          @amount < $game_bank.account_balance - 10 ? @amount += 10 : @amount = $game_bank.account_balance
          refresh_windows
          @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
        else
          $game_system.se_play($data_system.buzzer_se)
        end
      end
    elsif Input.repeat?(Input::L) && Input.press?(Input::L)
      if @amount == 0
        $game_system.se_play($data_system.buzzer_se)
      else
        $game_system.se_play($data_system.cursor_se)
        @amount > 100 ? @amount -= 100 : @amount = 0
        refresh_windows
        @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
      end
    elsif Input.repeat?(Input::R) && Input.press?(Input::R)
      if @depositing
        if @amount < $game_party.gold
          $game_system.se_play($data_system.cursor_se)
          @amount < $game_party.gold - 100 ? @amount += 100 : @amount = $game_party.gold
          refresh_windows
          @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
        else
          $game_system.se_play($data_system.buzzer_se)
        end
      else
        if @amount < $game_bank.account_balance
          $game_system.se_play($data_system.cursor_se)
          @amount < $game_bank.account_balance - 100 ? @amount += 100 : @amount = $game_bank.account_balance
          refresh_windows
          @help_window.set_text("#{@depositing ? 'Deposit' : 'Withdraw'} #{@amount} #{$data_system.words.gold}", 1)
        else
          $game_system.se_play($data_system.buzzer_se)
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Buy Bond Update
  #--------------------------------------------------------------------------
  def buy_bond_update
    # Turns On Avaliable Bond Window
    @av_bond_command.active = true
    # Turns Off Other Command Windows
    @main_command.active = @own_bond_command.active = false
    # Moves In Active Windows
    @av_bond_display_window.z = @av_bond_command.z = 9999
    @av_bond_display_window.x += 32 if @av_bond_display_window.x < 16
    @av_bond_command.x -= 25 if @av_bond_command.x > 444
    # Moves Out Inactive Windows
    [@bank_bio_window, @bank_number_window, @own_bond_display_window, 
      @main_command, @own_bond_command].each {|window| window.z = 9995}
    @bank_bio_window.x -= 32 if @bank_bio_window.x > - 240
    @bank_number_window.x += 32 if @bank_number_window.x < 640
    @own_bond_display_window.x -= 25 if @own_bond_display_window.x > - 240
    [@main_command, @own_bond_command].each {|command| command.x += 25 if command.x < 644}
    # Input Processing
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @phase = 0
    elsif Input.trigger?(Input::C)
      if @av_bond_command.index == @bonds.size
        $game_system.se_play($data_system.cancel_se)
        @phase = 0
      else
        current_bond = @bonds[@av_bond_command.index].dup
        if current_bond.cost > $game_party.gold
          $game_system.se_play($data_system.buzzer_se)
        else
          $game_system.se_play($data_system.decision_se)
          $game_party.lose_gold(current_bond.cost)
          current_bond.set_times
          $game_bank.add_bond(current_bond)
          refresh_windows
          @phase = 0
        end
      end
    # Updates Current Bond
    elsif Input.trigger?(Input::UP) or Input.trigger?(Input::DOWN)
      @current_bond = @bonds[@av_bond_command.index]
      refresh_windows
    end
  end
  #--------------------------------------------------------------------------
  # * Get Bond Update
  #--------------------------------------------------------------------------
  def get_bond_update
    # Turns On Avaliable Bond Window
    @own_bond_command.active = true
    # Turns Off Other Command Windows
    @main_command.active = @av_bond_command.active = false
    # Moves In Active Windows
    [@own_bond_display_window, @own_bond_command].each {|window| window.z = 9999}
    @own_bond_display_window.x += 32 if @own_bond_display_window.x < 16
    @own_bond_command.x -= 25 if @own_bond_command.x > 444
    # Moves Out Inactive Windows
    [@bank_bio_window, @av_bond_display_window, @main_command, @bank_number_window, 
      @av_bond_command].each {|window| window.z = 9995}
    [@bank_bio_window, @av_bond_display_window].each {|window|
      window.x -= 32 if window.x > - 240}
    [@main_command, @av_bond_command].each {|window|
      window.x += 25 if window.x < 640}
    @bank_number_window.x += 32 if @bank_number_window.x < 640
    # Input Processing
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @phase = 0
    elsif Input.trigger?(Input::C)
      if @own_bond_command.index == $game_bank.saving_bonds.size
        $game_system.se_play($data_system.cancel_se)
        @phase = 0
      else
        current_bond = $game_bank.saving_bonds[@own_bond_command.index]
        if current_bond.time_finished > Graphics.frame_count / Graphics.frame_rate
          $game_system.se_play($data_system.buzzer_se)
          @help_window.set_text("Savings Bond Not Mature Yet!", 1)
        else
          $game_system.se_play($data_system.decision_se)
          $game_party.gain_gold(current_bond.mature_value)
          $game_bank.saving_bonds.delete_at(@own_bond_command.index)
          refresh_windows
          @phase = 0
        end
      end
    elsif Input.trigger?(Input::UP) or Input.trigger?(Input::DOWN)
      @current_bond = $game_bank.saving_bonds[@own_bond_command.index]
      refresh_windows
    end
  end
  #--------------------------------------------------------------------------
  # * Exit Update
  #--------------------------------------------------------------------------
  def exit_update
    # Moves Out Windows
    @help_window.y -= 4 if @help_window.y > - 64
    [@bank_bio_window, @av_bond_display_window].each {|window| window.x -= 32 if window.x > - 240}
    [@own_bond_display_window].each {|window| window.x -= 25 if window.x > - 240}
    [@main_command, @bank_number_window, @av_bond_command,
      @own_bond_command].each {|window| window.x += 25 if window.x < 640}
    # Checks To Make Sure All Windows Are Out
    if @help_window.y <= - 64 && @bank_bio_window.x <= - 240 && @av_bond_display_window.x <= - 240 &&
        @own_bond_display_window.x <= - 240 && @main_command.x >= 644 &&
        @bank_number_window.x >= 640 && @av_bond_command.x >= 640 && @own_bond_command.x >= 640
      $scene = Scene_Map.new
    end
  end
  #--------------------------------------------------------------------------
  # * Get CD List
  #--------------------------------------------------------------------------
  def get_cd_list
    commands = []
    $game_bank.saving_bonds.each {|x| commands.push(x.name)}
    commands.push("Back")
    return commands
  end
  #--------------------------------------------------------------------------
  # * Refresh Windows
  #--------------------------------------------------------------------------
  def refresh_windows
    @bank_bio_window.refresh
    @av_bond_display_window.refresh(@current_bond, @bond_bought)
    @own_bond_display_window.refresh(@current_bond, @bond_bought)
    @bank_number_window.refresh(@amount, @depositing ? "Deposit" : "Withdraw")
    @own_bond_command.refresh(get_cd_list)
  end
end
class Scene_Save
  alias jimmr_bank_fix_save write_save_data
  def write_save_data(file)
    jimmr_bank_fix_save(file)
    Marshal.dump($game_bank, file)
  end
end

class Scene_Load
  alias jimmr_bank_fix_load read_save_data
  def read_save_data(file)
    jimmr_bank_fix_load(file)
    $game_bank     = Marshal.load(file)
  end
end