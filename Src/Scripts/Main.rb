#==============================================================================
# ** Main
#------------------------------------------------------------------------------
#  After defining each class, actual processing begins here.
#==============================================================================

begin
  # Prepare for transition
  $fontface = "Arial"  
  $fontsize = 24   
  Graphics.freeze
  # Make scene object (title screen)
  $scene = Scene_Title.new
  # Call main method as long as $scene is effective
  while $scene != nil
    $scene.main
  end
  # Fade out
  Graphics.transition(20)
rescue Errno::ENOENT =>e
  # Supplement Errno::ENOENT exception
  # If unable to open file, display message and end
  filename = $!.message.sub("No such file or directory - ", "")
  File.open("error.log", File::WRONLY|File::APPEND|File::CREAT) do |fh|
    fh << "#{Time.new.inspect}: #{e.backtrace}\n"
  end
  print("Unable to find file #{filename}.\nFull error message written to error.log")
end
