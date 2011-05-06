# Fixes the issue with words disappearing to the right in dialog windows
# Can be inserted in UMS, Window_Message, refresh; before reset_window (line 122)
class Window_Message < Window_Selectable
  alias window_message_refresh refresh
  def refresh
    window_message_refresh
    
    #format text
    if @text != nil
      offset = 42 # offset from sides for dialog window, approx value
      if @face and @face.bitmap and $game_system.face_graphic != ""
        offset += @face.bitmap.width + 20 #extra offset from \face use
      end
      lines = @text.split("\n")
      lines.map! {|line| line.split(" ") }
      out = []
      i=0
      while i < lines.length
        overflow = []
        if lines[i] == nil
          lines[i] = [""]
        end
        words = lines[i]
        #remove words until a fit is met, or only a word is left
        while self.contents.text_size(words.join(" ")).width > width - offset and words.length > 1
          overflow.unshift(words.pop)
        end
        out.push(words.join(" "))
        if overflow.length > 0
          if i < lines.length - 1
            lines[i+1] = overflow + lines[i+1]
          else
            lines.push(overflow)
          end
        end
        i+=1
      end
      @text = out.join("\n")
    end
    
    #tune height
    if @text != nil
      h = (self.contents.text_size("dj").height + 4) * @text.split("\n").length
      if h > self.height - 32
        self.height = h + 32
      end
    end
    
    
    #remake contents
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
    
    if $game_system.window_image != nil
      # figure out how we're going to resize this          
      @window_back.zoom_x = self.width.to_f / @window_back.bitmap.width 
      @window_back.zoom_y = self.height.to_f / @window_back.bitmap.height
    end
    
    #reposition contents
    reset_window #looks slow
  end
end