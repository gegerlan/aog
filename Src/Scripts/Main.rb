FILE_NAME = "..\\Game.bat"
if File.exists?(FILE_NAME)
  p "Unable to find files that should have been imported. Press OK to start #{File.basename(FILE_NAME)}."
  system("start #{FILE_NAME}")
else
  p "Unable to find conversion tool #{File.basename(FILE_NAME)}. Verify that all content has been extracted, and press OK to exit application." 
end
exit