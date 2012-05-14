=begin

made by LanLan
www.lanlangames.tk
v0.1

=end

class Scene_Poker
   
 def initialize(max_bet, music)
   @max_bet = max_bet
   @music = music
 end
 
 def main
   $game_system.bgm_memorize
   Audio.bgm_play("Audio/BGM/"+@music, 100, 100)
   @help_window = Window_Help.new
   @table_window = Window_Table2.new
   @table_window.active = false
   @bet_window = Window_Command.new(128,["10","50","100","500","Ready","Exit"])
   @bet_window.x = 512
   @bet_window.y = 64
   @bet_window.index = 0
   @money_window = Window_Money.new
   @yesno_window = Window_Command.new(128,["Yes","No"])
   @yesno_window.active = false
   @yesno_window.visible = false
   @yesno_window.x =  256
   @yesno_window.y =  208
   @yesno_window.z =  9999
   @cards = []
   @cards2 = []
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
       @dummybet = 10
       if ($game_party.fichas >= @dummybet) and ((@currentbet+@dummybet) <= @max_bet)
         $game_system.se_play($data_system.decision_se)
         @bet = 10
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
         start_poker
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
   @help_window.set_text("Choose cards to discard")
   if Input.trigger?(Input::B)
     $game_system.se_play($data_system.cancel_se)
     @table_window.index = 5
     return
   end
   if Input.trigger?(Input::DOWN)
     $game_system.se_play($data_system.decision_se)
     @table_window.index = 5
     return
   end
   if Input.trigger?(Input::C)
     case @table_window.index
     when 0
       if @flip1 == false
         @flip1 = true
       else
         @flip1 = false
       end
     when 1
       if @flip2 == false
         @flip2 = true
       else
         @flip2 = false
       end
     when 2
       if @flip3 == false
         @flip3 = true
       else
         @flip3 = false
       end
     when 3
       if @flip4 == false
         @flip4 = true
       else
         @flip4 = false
       end
     when 4
       if @flip5 == false
         @flip5 = true
       else
         @flip5 = false
       end
     when 5
       @table_window.active = false
       deal
     end
     draw_cards
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
       @money_window.refresh(@currentbet)
       @yesno_window.active = false
       @yesno_window.visible = false
       @bet_window.active = true
       @bet_window.index = 0
       shuffle
       draw_cards
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
 
 def start_poker
   @bet_window.active = false
   @m_hand1 =  @cards[@card_used]
   @s_hand1 =  @cards2[@card_used]
   @graphic1 = @graphic[@card_used]
   @card_used+=1
   @m_hand2 =  @cards[@card_used]
   @s_hand2 =  @cards2[@card_used]
   @graphic2 = @graphic[@card_used]
   @card_used+=1
   @m_hand3 =  @cards[@card_used]
   @s_hand3 =  @cards2[@card_used]
   @graphic3 = @graphic[@card_used]
   @card_used+=1
   @m_hand4 =  @cards[@card_used]
   @s_hand4 =  @cards2[@card_used]
   @graphic4 = @graphic[@card_used]
   @card_used+=1
   @m_hand5 =  @cards[@card_used]
   @s_hand5 =  @cards2[@card_used]
   @graphic5 = @graphic[@card_used]
   @card_used+=1
   draw_cards
   @table_window.active = true
   
 end
   
 def deal
   if @flip1 == true
     @m_hand1 =  @cards[@card_used]
     @s_hand1 =  @cards2[@card_used]
     @graphic1 = @graphic[@card_used]
     @card_used+=1
     @flip1 = false
   end
   if @flip2 == true
     @m_hand2 =  @cards[@card_used]
     @s_hand2 =  @cards2[@card_used]
     @graphic2 = @graphic[@card_used]
     @card_used+=1
     @flip2 = false
   end
   if @flip3 == true
     @m_hand3 =  @cards[@card_used]
     @s_hand3 =  @cards2[@card_used]
     @graphic3 = @graphic[@card_used]
     @card_used+=1
     @flip3 = false
   end
   if @flip4 == true
     @m_hand4 =  @cards[@card_used]
     @s_hand4 =  @cards2[@card_used]
     @graphic4 = @graphic[@card_used]
     @card_used+=1
     @flip4 = false
   end
   if @flip5 == true
     @m_hand5 =  @cards[@card_used]
     @s_hand5 =  @cards2[@card_used]
     @graphic5 = @graphic[@card_used]
     @card_used+=1
     @flip5 = false
   end    
   draw_cards
   check_win
 end
 
 def check_win
     temp4 = 0
     @card_array = [@m_hand1, @m_hand2, @m_hand3, @m_hand4, @m_hand5]
     @symbol_array = [@s_hand1, @s_hand2, @s_hand3, @s_hand4, @s_hand5]
     for i in 0...5
       for j in 0...5
         if @card_array[i] < @card_array[j]
           temp4 = @card_array[j]
           @card_array[j] = @card_array[i]
           @card_array[i] = temp4
         end
       end
     end
     
     @royal = false
     @flush = false
     @straight = false
     @cbetter = false
     @pair_ctr = 0
     @status = 0
           
     #check for flush
     for i in 0...5
       if @symbol_array[0] == @symbol_array[i]
         @flush = true
       else
         @flush = false
         break
       end
     end
     
     #check for straight
     for i in 0...5
       if @card_array[i] == @card_array[0]+1*i
         @straight = true
       else
         @straight = false
         break
       end
     end
     
     #check for pair
     for i in 0...5
       for j in 0...5
         if @card_array[i] == @card_array[j] and i !=j
           @pair_ctr +=1
         end
         if @card_array[i] == @card_array[j] and @card_array[i] > 10 and i != j
           @cbetter = true
         end
       end
     end
     
     #@pair_ctr -= 5
     
     if @pair_ctr == 2 and @cbetter == true
       @status = 9
     elsif @pair_ctr == 4
       @status = 8
     elsif @pair_ctr == 6
       @status = 7      
     elsif @pair_ctr == 8
       @status = 4  
     elsif @pair_ctr == 12
       @status = 3
     elsif @flush == true and @straight == true and @card_array[4] == 14
       @status = 1
     elsif @flush == true and @straight == true and @card_array[4] != 14
       @status = 2
     elsif @flush == true and @straight == false
       @status = 5
     elsif @straight == true and @flush == false
       @status = 6        
     end
     
   if @status == 0
     @currentbet *= 0
     @text = "Lost"
   elsif @status == 1
     @currentbet *= 1000
     @text = "Royal Flush"
   elsif @status == 2
     @currentbet *= 100
     @text = "Straight Flush"
   elsif @status == 3
     @currentbet *= 50
     @text = "Four of a Kind"
   elsif @status == 4
     @currentbet *= 30
     @text = "Full House"
   elsif @status == 5
     @currentbet *= 20
     @text = "Flush"
   elsif @status == 6
     @currentbet *= 12
     @text = "Straight"
   elsif @status == 7
     @currentbet *= 10
     @text = "Three of a Kind"
   elsif @status == 8
     @currentbet *= 5
     @text = "Two Pairs"
   elsif @status == 9
     @currentbet *= 2
     @text = "Pair"
   end
   
   win
   
 end
   
 def shuffle
   j = 51
   k = 0
   temp = 0
   temp2 = 0
   temp3 = 0
   
   while (j>=0)
     k = rand(j)
     
     temp = @cards[j]
     temp3 = @cards2[j]
     temp2 = @graphic[j]
     @cards[j] = @cards[k]
     @cards2[j] = @cards2[k]
     @graphic[j] = @graphic[k]
     @cards[k] = temp
     @cards2[k] = temp3
     @graphic[k] = temp2
     
     j-=1
     
   end
     
 end
 
 def shuffle2
   @cards = [14,2,3,4,5,6,7,8,9,10,11,12,13,
                   14,2,3,4,5,6,7,8,9,10,11,12,13,
                   14,2,3,4,5,6,7,8,9,10,11,12,13,
                   14,2,3,4,5,6,7,8,9,10,11,12,13,
                   0,0]
   @cards2 = [1,1,1,1,1,1,1,1,1,1,1,1,1,
                     2,2,2,2,2,2,2,2,2,2,2,2,2,
                     3,3,3,3,3,3,3,3,3,3,3,3,3,
                     4,4,4,4,4,4,4,4,4,4,4,4,4,
                     0,0]
 end
 
 def val_graphic
   for i in 0...53
     @graphic[i] = i
   end
 end
 
 def draw_cards
   @table_window.refresh(@graphic1,
                                     @graphic2,
                                     @graphic3,
                                     @graphic4,
                                     @graphic5,
                                     @flip1,
                                     @flip2,
                                     @flip3,
                                     @flip4,
                                     @flip5,
                                     @status,
                                     @currentbet)
 end
 
 def variable_init
   @bet = 0
   @dummybet = 0
   @currentbet = 0
   @dummy_fichas = 0
   @m_hand1 = 0
   @s_hand1 = 0
   @graphic1 = 53
   @m_hand2 = 0
   @s_hand2 = 0
   @graphic2 = 53
   @m_hand3 = 0
   @s_hand3 = 0
   @graphic3 = 53
   @m_hand4 = 0
   @s_hand4 = 0
   @graphic4 = 53
   @m_hand5 = 0
   @s_hand5 = 0
   @graphic5 = 53    
   @card_array = []
   @card_used = 0
   @flip1 = false
   @flip2 = false
   @flip3 = false
   @flip4 = false
   @flip5 = false
   @text = " "
 end
 
 def win
   $game_party.gain_fichas(@currentbet)
   @currentbet = 0
   @money_window.refresh(@currentbet)
   @help_window.set_text(@text)
   delay(3)
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
