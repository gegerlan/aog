#===============================================================================
# Filename:    rgss_mod.rb
#
# Developer:   Raku (rakudayo@gmail.com)
#
# Description: This file is for any changes that may have been made directly to
#    the RPG module.  Ideally, no one should need to do this, since there are
#    the Game_* classes, but in case you did modify any classes in the RPG
#    module, you need to add those changes here for the importer exporter to
#    work.
#
#    This is required because the Marshal class needs to know the exact data
#    footprint of all the classes in the RPG module.  If new attributes are 
#    added, then the Marshal class with fail loading them from the .rxdata file.
#===============================================================================

# Add any additional classes saved out in the rxdata files here...