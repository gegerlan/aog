
=begin
=begin
-----------------------------------------------------------------
:A script brought to you by LanLanGames,
:www.LanLanGames.tk, its horrendousgusting

:made by lanlan
:special thanks to those who helped at the
:rmxp.net RGSS support thread
:and to the guy who envented blackjack

Am I real? Do the words I speak before you make feel
That the love I've got for you will see no ending?
Well if you look into my eyes then you should know
That you have nothing here to doubt nothing to fear
And you can lay your questions down 'cause if you'll hold me
we can fade into the night and you'll know
CHORUS:
The world would die and everything may lie
Still you shan't cry 'Cause time may pass
But longer than it'll last I'll be by your side
Take my hand And gently close your eyes so you could understand
That there's no greater love tonight than what I've for you
Well if you feel the same way for me then let go
We can journey to a garden no one knows
Life is short my darling tell me that you love me
So we can fade into the night and you'll know
The world could die and everything may lie
But you won't cry 'cause time may pass
And everything won't last but I'll be by your side
Forever by your side so you won't cry

 now for the update: V0.6
-----------------------------------------------------------------
=end

class Scene_Blackjack
 
 def initialize(max_bet, music, sound)
   @max_bet = max_bet
   @music = music
   @sound = sound
 end
 
 def main
   $game_system.bgm_memorize
   Audio.bgm_play("Audio/BGM/"+@music, 100, 100)
   @help_window = Window_Help.new
   @table_window = Window_Table.new
   @bet_window = Window_Command.new(128,["25","50","100","500","Place bet","Exit"])
   @bet_window.x = 512
   @bet_window.y = 64
   @bet_window.index = 0
   @money_window = Window_Money.new
   @hitstay_window = Window_Command.new(128,["Hit!","Stay"])
   @hitstay_window.x = 512
   @hitstay_window.y = 384    
   @hitstay_window.active = false
   @yesno_window = Window_Command.new(128,["Yes","No"])
   @yesno_window.active = false
   @yesno_window.visible = false
   @yesno_window.x =  256
   @yesno_window.y =  208
   @yesno_window.z =  9999
   @cards = []
   @graphic = []
   @card_used = 0
   variable_init
   shuffle2
   val_graphic
   shuffle
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
   @hitstay_window.dispose
   @yesno_window.dispose
 end
 
 def update
   @table_window.update
   @bet_window.update
   @help_window.update
   @money_window.update    
   @hitstay_window.update
   @yesno_window.update
   if @bet_window.active
     update_bet
     return
   end
   if @hitstay_window.active
     update_hitstay
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
       @dummybet = 25
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 25
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 1
       @dummybet = 50
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 50
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 2
       @dummybet = 100
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 100
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 3
       @dummybet = 500
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 500
         bet
       else
         $game_system.se_play($data_system.buzzer_se)
         return
       end
     when 4
       @dummybet = 25
       if @currentbet > 0
         $game_system.se_play($data_system.decision_se)
         start_blackjack
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
 
 def update_hitstay
   @help_window.set_text("Hit or stay")
   if Input.trigger?(Input::B)
     $game_system.se_play($data_system.cancel_se)
     @hitstay_window.index = 1
     return
   end
   if Input.trigger?(Input::C)
     case @hitstay_window.index
     when 0
       hit
     when 1
       stay
     end
   end
 end
 
 def update_yesno
   @help_window.set_text("Do you want to play again?")
   if Input.trigger?(Input::B)
     $game_system.se_play($data_system.cancel_se)
     $scene = Scene_Map.new
     return
   end
   if Input.trigger?(Input::C)
     case @yesno_window.index
     when 0
       variable_init
       draw_real_cards
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
 
 def bet
   $game_party.lose_fichas(@bet)
   @currentbet += @bet
   @money_window.refresh(@currentbet)
   @bet = 0
 end
 
 def start_blackjack
   @bet_window.active = false
   @m_hand1 = @cards[@card_used]
   @graphic1 = @graphic[@card_used]
   check_cards
   @card_used +=1
   @m_hand2 = @cards[@card_used]
   @graphic2 = @graphic[@card_used]
   check_cards
   @card_used +=1
   @d_hand1 = @cards[@card_used]
   @d_graphic1 = @graphic[@card_used]
   check_cards
   @card_used +=1
   @d_hand2 = @cards[@card_used]
   @d_graphic2 = @graphic[@card_used]
   @m_total = @m_hand1+@m_hand2
   @d_total = @d_hand1+@d_hand2
   if @m_hand1 == 1
     @m_ace =1
     @m_hand1=@m_hand1+10
     @m_total=@m_hand1 + @m_hand2
   end
   if @m_hand2 == 1
     if @m_hand1 != 11
       @m_ace = 1
       @m_hand2 = @m_hand2+10
       @m_total = @m_hand1+@m_hand2
     else
       @m_hand2 = 1
       @m_total = @m_hand1+@m_hand2
     end
   end
   
   if @d_hand1 == 1
     @d_ace =1
     @d_hand1=@d_hand1+10
     @d_total=@d_hand1 + @d_hand2
   end
   if @d_hand2 == 1
     if @d_hand1 != 11
       @d_ace = 1
       @d_hand2 = @d_hand2+10
       @d_total = @d_hand1+@d_hand2
     else
       @d_card2 = 1
       @d_total = @d_hand1+@d_hand2
     end
   end
   draw_cards
   
   check_win

 end
 
 def shuffle
   j = 51
   k = 0
   temp = 0
   temp2 = 0
   
   while (j>=0)
     k = rand(j)
     
     temp = @cards[j]
     temp2 = @graphic[j]
     @cards[j] = @cards[k]
     @graphic[j] = @graphic[k]
     @cards[k] = temp
     @graphic[k] = temp2
     
     j-=1
     
   end
     
 end
 
 def shuffle2
   @cards = [1,2,3,4,5,6,7,8,9,10,10,10,10,
                   1,2,3,4,5,6,7,8,9,10,10,10,10,
                   1,2,3,4,5,6,7,8,9,10,10,10,10,
                   1,2,3,4,5,6,7,8,9,10,10,10,10,
                   0,0]
 end
 
 def val_graphic
   for i in 0...53
     @graphic[i] = i
   end
 end
 
 def check_cards
   if @card_used == 51
     shuffle
     @card_used = 0
   end
 end
   
 def draw_cards
   @table_window.refresh(@graphic1,
                                     @graphic2,
                                     @graphic3,
                                     @graphic4,
                                     @graphic5,
                                     52,
                                     @d_graphic2,
                                     @d_graphic3,
                                     @d_graphic4,
                                     @d_graphic5,
                                     @m_total)
 end
 
 def draw_real_cards
   @table_window.refresh(@graphic1,
                                     @graphic2,
                                     @graphic3,
                                     @graphic4,
                                     @graphic5,
                                     @d_graphic1,
                                     @d_graphic2,
                                     @d_graphic3,
                                     @d_graphic4,
                                     @d_graphic5,
                                     @m_total)
 end
   
 def variable_init
   @bet = 0
   @dummybet = 0
   @currentbet = 0
   @dummy_fichas = 0
   @m_hand1 = 0
   @graphic1 = 53
   @m_hand2 = 0
   @graphic2 = 53
   @m_hand3 = 0
   @graphic3 = 53
   @m_hand4 = 0
   @graphic4 = 53
   @m_hand5 = 0
   @graphic5 = 53    
   @d_hand1 = 0
   @d_graphic1 = 53
   @d_hand2 = 0
   @d_graphic2 = 53
   @d_hand3 = 0
   @d_graphic3 = 53
   @d_hand4 = 0
   @d_graphic4 = 53   
   @d_hand5 = 0
   @d_graphic5 = 53    
   @m_ace = 0
   @d_ace = 0
   @test = 0
 end
 
 def hit
   check_cards
   @card_used +=1
   if @m_hand3 == 0
     @m_hand3 = @cards[@card_used]
     @graphic3 = @graphic[@card_used]      
   elsif @m_hand4 == 0 and @m_hand3 != 0
     @m_hand4 = @cards[@card_used]
     @graphic4 = @graphic[@card_used] 
   elsif @m_hand5 == 0 and @m_hand4 != 0
     @m_hand5 = @cards[@card_used]
     @graphic5 = @graphic[@card_used] 
   end
   
   if @cards[@card_used]  == 1
     if @m_total <=10
       @m_ace = 1
       @m_total += 11
     else
       @m_total += 1
     end
   else
     @m_total += @cards[@card_used]
   end
   check_win2
 end
 
 def stay
   @hitstay_window.active = false
   if @d_total >= @m_total
     check_win3
   end
   while (@d_total<@m_total)
     check_cards
     @card_used +=1
     if @d_hand5 == 0 and @d_hand4 != 0
       @d_hand5 = @cards[@card_used]
       @d_graphic5 = @graphic[@card_used] 
     elsif @d_hand4 == 0 and @d_hand3 != 0
       @d_hand4 = @cards[@card_used]
       @d_graphic4 = @graphic[@card_used]         
     elsif @d_hand3 == 0
       @d_hand3 = @cards[@card_used]
       @d_graphic3 = @graphic[@card_used]      
     end
     
     if @cards[@card_used]  == 1
       if @d_total <=10
         @d_ace = 1
         @d_total += 11
       else
         @d_total += 1
       end
     else
       @d_total += @cards[@card_used]
     end
     
     if @d_total >= 22 and @d_ace == 1
       @d_total -= 10
       @d_ace = 0
       draw_real_cards
     end
   end
   
   check_win3

 end
 
 def check_win
   if @test == 0
     if @m_total == 21 and @d_total != 21
       draw_real_cards
       win
     elsif @m_total != 21 and @d_total == 21
       draw_real_cards
       lose
     elsif @m_total == 21 and @d_total == 21
       draw_real_cards
       tie
     else
       @test = 1
       @hitstay_window.active = true 
       @hitstay_window.index = 0
     end
   end
 end
 
 def check_win2
   if @m_hand5 > 0 and @m_total <= 21
     draw_real_cards
     @hitstay_window.active = false      
     win
   elsif @m_total >= 22 and @m_ace == 1
     @m_total -= 10
     @m_ace = 0
     draw_cards
   elsif @m_total >= 22
     draw_real_cards
     @hitstay_window.active = false
     lose
   elsif @m_total == 21
     draw_real_cards
     @hitstay_window.active = false
     win
   elsif @m_total <=20
     draw_cards
   end
 end
 
 def check_win3
   if @d_hand5 > 0 and @d_total <= 21
     draw_real_cards
     lose
   elsif @d_total >= 22
     draw_real_cards
     win
   elsif @d_total == 21
     draw_real_cards
     lose
   elsif @d_total > @m_total and @d_total <= 20
     draw_real_cards
     lose
   elsif @d_total == @m_total
     draw_real_cards
     tie
   elsif @d_total < @m_total
     draw_real_cards
     win
   end
 end
   
 def win
   $game_party.gain_fichas(@currentbet*2)
   @currentbet = 0
   @money_window.refresh(@currentbet)
   @help_window.set_text("You win!!! ")
   if @sound == true
     $game_system.me_play($game_system.battle_end_me)
   end
     delay(2)
   playagain
 end
 
 def lose
   @currentbet = 0
   @money_window.refresh(@currentbet)    
   @help_window.set_text("You lost...")
   if @sound == true
     $game_system.me_play($data_system.gameover_me)
   end
   delay(2)
   playagain
 end
 
 def tie
   $game_party.gain_fichas(@currentbet)
   @currentbet = 0
   @money_window.refresh(@currentbet)
   @help_window.set_text("Push")
   delay(2)
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
