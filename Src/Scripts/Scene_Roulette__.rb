=begin

Roulette by LanLan
www.lanlangames.tk
v0.1

=end

class Scene_Roulette
   
 def initialize(max_bet, music)
   @max_bet = max_bet
   @music = music
 end
 
 def main
   $game_system.bgm_memorize
   Audio.bgm_play("Audio/BGM/"+@music, 100, 100)
   @help_window = Window_Help.new
   @table_window = Window_Table3.new
   @table_window.active = false
   @bet_window = Window_Command.new(128,["1","10","50","100","Place bet","Exit"])
   @bet_window.x = 512
   @bet_window.y = 64
   @bet_window.index = 0
   @money_window = Window_Money.new
   @money_window.y = 384
   @yesno_window = Window_Command.new(128,["Yes","No"])
   @yesno_window.active = false
   @yesno_window.visible = false
   @yesno_window.x =  256
   @yesno_window.y =  208
   @yesno_window.z =  9999
   @type = 0
   variable_init
   Graphics.transition
   loop do
     Graphics.update
     Input.update
     update
     if $scene != self
       break
     end
   end
   Graphics.freeze
   @help_window.dispose
   @table_window.dispose
   @bet_window.dispose
   @money_window.dispose    
   @yesno_window.dispose
 end
 
 def update
   @table_window.update
   @bet_window.update
   @help_window.update
   @money_window.update    
   @yesno_window.update
   if @bet_window.active
     update_bet
     return
   end
   if @table_window.active
     update_table
     return
   end
   if @yesno_window.active
     update_yesno
     return
   end
 end
 
 def update_bet
   @help_window.set_text("Place your bet")
   if Input.trigger?(Input::B)
     $game_system.se_play($data_system.cancel_se)
     @bet_window.index = 5
     return
   end
   if Input.trigger?(Input::C)
     case @bet_window.index
     when 0  
       @dummybet = 1
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 1
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 1
       @dummybet = 10
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 10
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 2
       @dummybet = 50
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 50
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 3
       @dummybet = 100
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 100
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 4
       if @currentbet > 0
         $game_system.se_play($data_system.decision_se)
         @table_window.active = true
         @bet_window.active = false
       else
         $game_system.se_play($data_system.buzzer_se)
       end
     when 5
       $game_system.se_play($data_system.cancel_se)
       $game_party.gain_fichas(@currentbet)        
       $scene = Scene_Map.new
       $game_system.bgm_restore
     end
   end
 end

 def update_table
   if Input.trigger?(Input::B)
     $game_system.se_play($data_system.cancel_se)
     @table_window.index = 5
     return
   end
   if Input.trigger?(Input::C)
     
     if @table_window.index == 0
       for i in 1...19
         @hand[i] = i
         @prize = @currentbet*2
       end
     elsif @table_window.index == 1
       for i in 1...19
         @hand[i] = i+18
         @prize = @currentbet*2
       end
       
     elsif @table_window.index == 3
       for i in 1...37
         if i%2 == 0
           @hand[i] = i
           @prize = @currentbet*2
         end
       end
     elsif @table_window.index == 4
       for i in 1...37
         if i%2 == 1
           @hand[i] = i
           @prize = @currentbet*2
         end
       end      

     elsif @table_window.index == 6
       for i in 1...13
         @hand[i] = i
         @prize = @currentbet*3
       end
     elsif @table_window.index == 7
       for i in 1...13
         @hand[i] = i+12
         @prize = @currentbet*3
       end      
     elsif @table_window.index == 8
       for i in 1...13
         @hand[i] = i+24
         @prize = @currentbet*3
       end   
     elsif @table_window.index == 9
       for i in 1...37
         if i%3 == 1
           @hand[i] = i
           @prize = @currentbet*3
         end
       end 
     elsif @table_window.index == 10
       for i in 1...37
         if i%3 == 2
           @hand[i] = i
           @prize = @currentbet*3
         end
       end 
     elsif @table_window.index == 11
       for i in 1...37
         if i%3 == 0
           @hand[i] = i
           @prize = @currentbet*3
         end
       end         
       
     elsif @table_window.index > 11
       @hand[1] = @table_window.index - 11
       @prize = @currentbet*36
     end
     
       @table_window.active = false
       @help_window.set_text("Spinning...")
       delay(2)
       spin
     
   end
 end
 
 def update_yesno
   if Input.trigger?(Input::B)
     $game_system.se_play($data_system.cancel_se)
     $scene = Scene_Map.new
     return
   end
   if Input.trigger?(Input::C)
     case @yesno_window.index
     when 0
       variable_init
       @money_window.refresh(@currentbet)
       @yesno_window.active = false
       @yesno_window.visible = false
       @bet_window.active = true
       @bet_window.index = 0
     when 1
       $scene = Scene_Map.new
       Audio.bgm_stop
       $game_system.bgm_restore
     end
   end
 end    
 
 def spin
   @same = false
   @num = rand(36)+1
   for i in 1...@hand.size
     if @num == @hand[i]
       @same = true
       break
     end
   end
   if @same == true
     win
   else
     lose
   end
 end
     
 def bet
   $game_party.lose_fichas(@bet)
   @currentbet += @bet
   @money_window.refresh(@currentbet)
   @bet = 0
 end
 
 def variable_init
   @bet = 0
   @dummybet = 0
   @currentbet = 0
   @dummy_fichas = 0
   @hand = []
   @num = 0
   @same = false
   @prize = 0
 end
 
 def win
   $game_party.gain_fichas(@prize)
   @currentbet = 0
   @money_window.refresh(@currentbet)
   @help_window.set_text("The ball landed on number  "+@num.to_s+", you win! Do you want to play again? ")
   delay(1)
   playagain
 end
 
 def lose
   @currentbet = 0
   @money_window.refresh(@currentbet)    
   @help_window.set_text("The ball landed on number  "+@num.to_s+", you lost... Do you want to play again? ")
   delay(1)
   playagain
 end
 
 def playagain
   @yesno_window.visible = true
   @yesno_window.active = true
   @yesno_window.index = 0
 end

 def delay(seconds)
   for i in 0...(seconds * 10)
     sleep 0.1
     Graphics.update
   end
 end
 
end