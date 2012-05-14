class Window_Table < Window_Base
 def initialize
   super(0, 64, 512, 416)
   self.contents = Bitmap.new(width - 32, height - 32)
   #self.contents.font.name = $defaultfonttype
   #self.contents.font.size = $defaultfontsize
   refresh
 end
#--------------------------------------------------------------------------
 def refresh(graphic1 = 53, 
                 graphic2 = 53,
                 graphic3 = 53, 
                 graphic4 = 53,
                 graphic5 = 53,
                 d_graphic1 = 53, 
                 d_graphic2 = 53,
                 d_graphic3 = 53,
                 d_graphic4 = 53,
                 d_graphic5 = 53,
                 total = 0)
   
   @graphic1 = graphic1
   @graphic2 = graphic2  
   @graphic3 = graphic3
   @graphic4 = graphic4
   @graphic5 = graphic5
   @d_graphic1 = d_graphic1
   @d_graphic2 = d_graphic2
   @d_graphic3 = d_graphic3
   @d_graphic4 = d_graphic4
   @d_graphic5 = d_graphic5
   @total = total
   
   self.contents.clear
   
   self.contents.draw_text(32, 320, 128, 32, "Your hand: " + @total.to_s)
   
   graphic
 end

 def graphic
   x = 0
   y = 0
   @frame_width = 71
   @frame_height = 96
   @xpos1 = @graphic1*@frame_width
   @xpos2 = @graphic2*@frame_width
   @xpos3 = @graphic3*@frame_width
   @xpos4 = @graphic4*@frame_width
   @xpos5 = @graphic5*@frame_width
   @xposd1 = @d_graphic1*@frame_width
   @xposd2 = @d_graphic2*@frame_width
   @xposd3 = @d_graphic3*@frame_width
   @xposd4 = @d_graphic4*@frame_width
   @xposd5 = @d_graphic5*@frame_width
   bitmap = RPG::Cache.picture("cards")
   src_rect_hand1 = Rect.new(@xpos1, 0, @frame_width, @frame_height)
   src_rect_hand2 = Rect.new(@xpos2, 0, @frame_width, @frame_height)
   src_rect_hand3 = Rect.new(@xpos3, 0, @frame_width, @frame_height)
   src_rect_hand4 = Rect.new(@xpos4, 0, @frame_width, @frame_height)
   src_rect_hand5 = Rect.new(@xpos5, 0, @frame_width, @frame_height)    
   src_rect_d_hand1 = Rect.new(@xposd1, 0, @frame_width, @frame_height)
   src_rect_d_hand2 = Rect.new(@xposd2, 0, @frame_width, @frame_height)
   src_rect_d_hand3 = Rect.new(@xposd3, 0, @frame_width, @frame_height)
   src_rect_d_hand4 = Rect.new(@xposd4, 0, @frame_width, @frame_height)
   src_rect_d_hand5 = Rect.new(@xposd5, 0, @frame_width, @frame_height)
   self.contents.blt(0,192,bitmap,src_rect_hand1)
   self.contents.blt(96,192,bitmap,src_rect_hand2)
   self.contents.blt(96*2,192,bitmap,src_rect_hand3)
   self.contents.blt(96*3,192,bitmap,src_rect_hand4)
   self.contents.blt(96*4,192,bitmap,src_rect_hand5)
   self.contents.blt(0,0,bitmap,src_rect_d_hand1)
   self.contents.blt(96,0,bitmap,src_rect_d_hand2)
   self.contents.blt(96*2,0,bitmap,src_rect_d_hand3)
   self.contents.blt(96*3,0,bitmap,src_rect_d_hand4)
   self.contents.blt(96*4,0,bitmap,src_rect_d_hand5)
   
 end
 
 
end

class Window_Table2 < Window_Selectable
 
 def initialize
   super(0, 64, 512, 416)
   self.contents = Bitmap.new(width - 32, height - 32)
   @column_max = 5
   @item_max = 6
   @frame_width = 71
   @frame_height = 96
   self.contents = Bitmap.new(width - 32, height - 32)
   #self.contents.font.name = $defaultfonttype
   #self.contents.font.size = $defaultfontsize
   refresh()
   self.index = 0    
 end
#--------------------------------------------------------------------------
 def refresh(graphic1 = 53, 
                 graphic2 = 53,
                 graphic3 = 53, 
                 graphic4 = 53,
                 graphic5 = 53,
                 flip1 = false,
                 flip2 = false,
                 flip3 = false,
                 flip4 = false,
                 flip5 = false,
                 status = 0,
                 currentbet = 0)
   
   @graphic1 = graphic1
   @graphic2 = graphic2  
   @graphic3 = graphic3
   @graphic4 = graphic4
   @graphic5 = graphic5
   @flip1 = flip1
   @flip2 = flip2
   @flip3 = flip3
   @flip4 = flip4
   @flip5 = flip5
   @status = status    
   @currentbet = currentbet
   self.contents.clear

   graphic
 
 end
   
 def graphic
   x = 0
   y = 0
   
   if @flip1 == false 
     @xpos1 = @graphic1*@frame_width
   else
     @xpos1 = 52*@frame_width
   end
   if @flip2 == false 
     @xpos2 = @graphic2*@frame_width
   else
     @xpos2 = 52*@frame_width
   end
   if @flip3 == false 
     @xpos3 = @graphic3*@frame_width
   else
     @xpos3 = 52*@frame_width
   end
   if @flip4 == false 
     @xpos4 = @graphic4*@frame_width
   else
     @xpos4 = 52*@frame_width
   end
   if @flip5 == false 
     @xpos5 = @graphic5*@frame_width
   else
     @xpos5 = 52*@frame_width
   end    
   bitmap = RPG::Cache.picture("Cards")
   src_rect_hand1 = Rect.new(@xpos1, 0, @frame_width, @frame_height)
   src_rect_hand2 = Rect.new(@xpos2, 0, @frame_width, @frame_height)
   src_rect_hand3 = Rect.new(@xpos3, 0, @frame_width, @frame_height)
   src_rect_hand4 = Rect.new(@xpos4, 0, @frame_width, @frame_height)
   src_rect_hand5 = Rect.new(@xpos5, 0, @frame_width, @frame_height)    
   self.contents.blt(0,192,bitmap,src_rect_hand1)
   self.contents.blt(96,192,bitmap,src_rect_hand2)
   self.contents.blt(96*2,192,bitmap,src_rect_hand3)
   self.contents.blt(96*3,192,bitmap,src_rect_hand4)
   self.contents.blt(96*4,192,bitmap,src_rect_hand5)
   
   self.contents.draw_text(128+80, 288, 204, 64, "Done", 0)
   
   x = 16
   y = 16
   
   self.contents.draw_text(x, y, 400, 24,   "ROYAL FLUSH - "+@currentbet.to_s+"x1000", 0)
   self.contents.draw_text(x, y*2, 400, 24, "Straight Flush - - -"+@currentbet.to_s+"x100", 0)
   self.contents.draw_text(x, y*3, 400, 24, "Four of a kind - - -"+@currentbet.to_s+"x50", 0)
   self.contents.draw_text(x, y*4, 400, 24, "Full House - - - - - "+@currentbet.to_s+"x30", 0)
   self.contents.draw_text(x, y*5, 400, 24, "Flush - - - - - - - - - "+@currentbet.to_s+"x20", 0)
   self.contents.draw_text(x, y*6, 400, 24, "Straight - - - - - - - -"+@currentbet.to_s+"x12", 0)
   self.contents.draw_text(x, y*7, 400, 24, "Three of a kind- - -"+@currentbet.to_s+"x10", 0)
   self.contents.draw_text(x, y*8, 400, 24, "Two pairs - - - - - - "+@currentbet.to_s+"x5", 0)
   self.contents.draw_text(x, y*9, 400, 24, "Pair - - - - - - - - - - -"+@currentbet.to_s+"x2", 0)

   
 end
 
 def update_cursor_rect
     if self.index == 5
       self.cursor_rect.set(96+80, 304, 96, 32)
     else
       x = 96*(index)
       y = 192
       self.cursor_rect.set(x-4,y-4, @frame_width+8, @frame_height+8)
     end
     
 end
 
 
end

class Window_Table3 < Window_Selectable
 
 def initialize
   super(0, 64, 512, 416)
   self.contents = Bitmap.new(width - 32, height - 32)
   #self.contents.font.name = $defaultfonttype
   #self.contents.font.size = $defaultfontsize
   @item_max = 48
   @column_max = 3
   refresh
   self.index = 0    
 end
#--------------------------------------------------------------------------
 def refresh

   s1 = "1-18"
   s2 = "19-36"
   s3 = ""
   s4 = "Even"
   s5 = "Odd"
   s6 = ""
   s7 = "1-12"
   s8 = "13-24"
   s9 = "25-36"
   s10 = "Column 1"
   s11 = "Column 2"
   s12 = "Column 3"
   
   @commands = [s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12]      

   self.contents.clear
   
   for i in 0...@item_max
     if i < 12
       draw_item1(i)
     else
       j = i-11
       draw_item2(i,j)
     end
   end

 end

 def draw_item1(index)
   x = 4 + index % 3 * (160+12)
   y = index / 3 * 24
   rect = Rect.new(x, y, self.width / @column_max - 32, 24)
   self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
   self.contents.draw_text(rect, @commands[index])
 end
 
 def draw_item2(index,ctr)
   x = 4 + index % 3 * (160+12)
   y = index / 3 * 24
   rect = Rect.new(x, y, self.width / @column_max - 32, 24)
   self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
   self.contents.draw_text(rect, ctr.to_s)
 end
 
 def update_cursor_rect
   x = 4 + index % 3 * (160+12)
   y = index / 3 * 24
   self.cursor_rect.set(x, y, self.width / @column_max - 32, 24)
 end
 
end
 class Window_Money < Window_Base
# ------------------------------------
def initialize
   super(512, 288, 128, 96)
   self.contents = Bitmap.new(width - 32, height - 32)
   #self.contents.font.name = $defaultfonttype
   #self.contents.font.size = $defaultfontsize    
   @bet = 0
   refresh(@bet)
 end
# ------------------------------------
 def refresh(bet)
   @bet = bet
   self.contents.clear
   self.contents.font.color = normal_color
   self.contents.draw_text(0, 0, 96, 32, $game_party.fichas.to_s,2)
   self.contents.draw_text(0, 32, 96, 32, @bet.to_s, 2)
 end
end


