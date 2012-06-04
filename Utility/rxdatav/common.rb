#===============================================================================
# Filename:    common.rb
#
# Developer:   Raku (rakudayo@gmail.com)
#
# Description: This file contains all global variables and functions which are
#    common to all of the import/export scripts.
#===============================================================================

#require 'win32ole'
require 'zlib'
#require 'digest/md5'

#-------------------------------------------------------------------------------------
# This change to Hash is critical if we want to version YAML files.  By default, the
# order of hash keys is not guaranteed.  This change modifies the Hash#to_yaml method
# to sort the hash based on key before emitting the YAML for it.
#-------------------------------------------------------------------------------------
class Hash
  # Replacing the to_yaml function so it'll serialize hashes sorted (by their keys)
  def to_yaml( opts = {} )
    YAML::quick_emit( object_id, opts ) do |out|
      out.map( taguri, to_yaml_style ) do |map|
        sort.each do |k, v|   # <-- here's my addition (the 'sort')
          map.add( k, v )
        end
      end
    end
  end
end

require 'yaml'

# Read the config YAML file
config = nil
File.open( "config.yaml", "r+" ) do |configfile|
  config = YAML::load( configfile )
end

# Initialize configuration parameters
$RXDATA_DIR         = config["rxdata_dir"]
$YAML_DIR           = config["yaml_dir"]
$SCRIPTS_DIR        = config["scripts_dir"]
$RXDATA_IGNORE_LIST = config["rxdata_ignore_list"]
$VERBOSE            = config["verbose"]
$MAGIC_NUMBER       = config["magic_number"]

# This is the filename for the export digest.  This file has an entry for
# each RGSS script which has been exported from RMXP.  Each entry has 
# information about the script such as its title in RMXP and the name of
# the Ruby file it was exported to.
$EXPORT_DIGEST_FILE = "digest.txt"

# This is the filename where the startup timestamp is dumped.  Later it can
# be compared with the modification timestamp for rxdata files to determine
# if they need to be exported.
$TIME_LOG_FILE = "timestamp.bin"

$CHECKSUM_FILE = "checksum.bin"

# An array of invalid Windows filename strings and their substitutions. This
# array is used to modify the script title in RMXP's script editor to construct
# a filename for saving the script out to the filesystem.
$INVALID_CHARS_FOR_FILENAME= [ 
         [" - ", "_"], 
			   [" ",   "_"],
			   ["-", "_"],
			   [":", "_"],
			   ["/", "_"],
			   ["\\", "_"],
			   ["*", "_"],
			   ["|", "_"],
			   ["<", "_"],
			   [">", "_"],
			   ["?", "_"] ]

# Lengths of the columns in the script export digest
$COLUMN1_WIDTH  = 12
$COLUMN2_WIDTH  = 45

# Length of a filename (for output formatting purposes)
$FILENAME_WIDTH = 35

# Length of a line separator for output
$LINE_LENGTH = 80

#----------------------------------------------------------------------------
# recursive_mkdir: Creates a directory and all its parent directories if they
# do not exist.
#   directory: The directory to create
#----------------------------------------------------------------------------
def recursive_mkdir( directory )
  begin
    # Attempt to make the directory
    Dir.mkdir( directory )
  rescue Errno::ENOENT
    # Failed, so let's use recursion on the parent directory
    base_dir = File.dirname( directory )
    recursive_mkdir( base_dir )
    
    # Make the original directory
    Dir.mkdir( directory )
  end
end

#----------------------------------------------------------------------------
# print_separator: Prints a separator line to stdout.
#----------------------------------------------------------------------------
def print_separator( enable = $VERBOSE )
  puts "-" * $LINE_LENGTH if enable
end

#----------------------------------------------------------------------------
# pause_prompt: Prints a pause prompt to stdout.
#----------------------------------------------------------------------------
def pause_prompt
  puts "Press ENTER to continue . . ."
  STDIN.getc
end

#----------------------------------------------------------------------------
# pause_prompt: Prints a string to stdout if verbosity is enabled.
#   s: The string to print
#----------------------------------------------------------------------------
def puts_verbose(s = "")
  puts s if $VERBOSE
end

#----------------------------------------------------------------------------
# file_modified_since?: Returns true if the file has been modified since the
# specified timestamp.
#   filename: The name of the file.
#   timestamp: The timestamp to check if the file is newer than.
#----------------------------------------------------------------------------
def file_modified_since?( filename, timestamp )
  modified_timestamp = File.mtime( filename )
  bname = File.basename(filename)
  if timestamp[bname] != nil && timestamp[bname] == modified_timestamp
    return false
  else
    timestamp[bname] = modified_timestamp
    return true
  end
end
=begin
def file_modified_from?( filename, checksum )
  hash  = get_file_hash(filename) 
  bname = File.basename(filename)
  if checksum[bname] != nil && checksum[bname] == hash 
    return false
  else
    checksum[bname] = hash
    return true
  end
end
def get_file_hash(filename)
  return Digest::MD5.hexdigest(File.read(filename))
end
=end
#----------------------------------------------------------------------------
# rxdata_file_exported?: Returns true if the .rxdata file has been exported.
#   filename: The name of the .rxdata file.
#----------------------------------------------------------------------------
def rxdata_file_exported?(filename)
  exported_filename = $PROJECT_DIR + '/' + $YAML_DIR + '/' + File.basename(filename, ".rxdata") + ".yaml"
  return File.exists?( exported_filename )
end

#----------------------------------------------------------------------------
# rxdata_file_imported?: Returns true if the .rxdata file has been imported.
#   filename: The name of the .yaml file.
#----------------------------------------------------------------------------
def rxdata_file_imported?(filename)
  exported_filename = $PROJECT_DIR + '/' + $RXDATA_DIR + '/' + File.basename(filename, ".yaml") + ".rxdata"
  return File.exists?( exported_filename )
end

#----------------------------------------------------------------------------
# dump_startup_time: Dumps the current system time to a temporary file.
#   directory: The directory to dump the system tile into.
#----------------------------------------------------------------------------
def dump_startup_time(timestamp)
  File.open( $PROJECT_DIR + '/' + $TIME_LOG_FILE, "w+" ) do |outfile|
    Marshal.dump( timestamp, outfile )
  end
end
=begin
def dump_checksum(checksum)
  File.open( $PROJECT_DIR + '/' + $CHECKSUM_FILE, "w+" ) do |outfile|
    Marshal.dump( checksum, outfile )
  end
end
=end
#----------------------------------------------------------------------------
# load_startup_time: Loads the dumped system time from the temporary file.
#   directory: The directory to load the system tile from.
#----------------------------------------------------------------------------
def load_startup_time(delete_file = false)
  t = nil
  if File.exists?( $PROJECT_DIR + '/' + $TIME_LOG_FILE )
    File.open( $PROJECT_DIR + '/' + $TIME_LOG_FILE, "r+" ) do |infile|
      begin
        t = Marshal.load( infile )
	t = {} if not t.is_a?(Hash)
      rescue
        t = {}
      end
    end
    if delete_file then File.delete( $PROJECT_DIR + '/' + $TIME_LOG_FILE ) end
  end
  t
end

#----------------------------------------------------------------------------
# process_running?: Returns true if a win32 process with the specified name
# is currently running.
#   process_name: The name of the process.
#----------------------------------------------------------------------------
def process_running?(process_name)
#  names = []
#  procs = WIN32OLE.connect("winmgmts:\\\\.")
#  procs.InstancesOf("win32_process").each do |p|
#	  names.push(p.name.to_s.downcase)
#  end
#  return names.index(process_name) != nil
   return false
end

#----------------------------------------------------------------------------
# check_for_rmxp: Checks if rpgxp.exe is running and, if so, exits.  Also
# returns true if RMXP was running.
#   notify: A boolean for whether to print a notification if RMXP is running.
#----------------------------------------------------------------------------
def check_for_rmxp( notify = false )
  if process_running?( "rpgxp.exe" )
    if notify
	    puts "RPG Maker XP is already running!  Please close it and try again. :)"
      puts "Exiting..."
      pause_prompt
	  end
	  return true
  else
    return false
  end
end

#----------------------------------------------------------------------------
# generate_filename: Generates a filename given an RGSS script entry.
#   script: An entry for a script in the loaded Scripts.rxdata file. This
#           is a three element array with the 0th element as the unique id,
#           the 1st element is the script's title in RMXP, and the 3rd 
#           element is the script's compressed text
#----------------------------------------------------------------------------
def generate_filename(script)
  (Zlib::Inflate.inflate(script[2]) != '' ? "#{fix_name(script[1])}.rb" : 'EMPTY')
end

#----------------------------------------------------------------------------
# generate_filename: Generates a filename given an RGSS script's title.
#   title: The title of the script in RMXP's script editor
#----------------------------------------------------------------------------
def fix_name(title)
  result = String.new( title )
  # Replace all invalid characters
  for substitution in $INVALID_CHARS_FOR_FILENAME
    result.gsub!(substitution[0], substitution[1])
  end
  result
end
=begin
def load_checksum(delete_file = false)
  t = nil
  if File.exists?( $PROJECT_DIR + '/' + $CHECKSUM_FILE )
    File.open( $PROJECT_DIR + '/' + $CHECKSUM_FILE, "r+" ) do |infile|
      t = Marshal.load( infile )
    end
    if delete_file then File.delete( $PROJECT_DIR + '/' + $CHECKSUM_FILE ) end
  end
  t
end
=end

# Get the project directory from the command-line argument
$PROJECT_DIR = ARGV[1]

