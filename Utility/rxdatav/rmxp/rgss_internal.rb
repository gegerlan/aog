#===============================================================================
# Filename:    rgss_internal.rb
#
# Developer:   Raku (rakudayo@gmail.com)
#
# Description: This file contains Ruby implementations of the RGSS Built-in
#    classes Table, Color, and Tone.  These classes are required to load and
#    dump the .rxdata files used by RMXP to store game data.
#===============================================================================
# These classes are based on the version provided by vgvgf on the RMXP.org 
# forums at the link below.  Thanks vgvgf!!
#
#    http://www.rmxp.org/forums/viewtopic.php?t=49838
#
# I have modified them to more closely mimic the behavior of the RGSS Built-in
# classes Table, Color, and Tone.  When these classes are dumped by the 
# importer/exporter scripts, they can now be correctly read by RMXP.
#===============================================================================

class Table
  def initialize(x, y = 0, z = 0)
    @dim = 1 + (y > 0 ? 1 : 0) + (z > 0 ? 1 : 0)
    @xsize, @ysize, @zsize = x, [y, 1].max, [z, 1].max
    @data = Array.new(x * y * z, 0)
  end
  def [](x, y = 0, z = 0)
    @data[x + y * @xsize + z * @xsize * @ysize]
  end
  def []=(*args)
    x = args[0]
    y = args.size > 2 ? args[1] : 0
    z = args.size > 3 ? args[2] : 0
    v = args.pop
    @data[x + y * @xsize + z * @xsize * @ysize] = v
  end
  def _dump(d = 0)
    [@dim, @xsize, @ysize, @zsize, @xsize * @ysize * @zsize].pack('LLLLL') <<
    @data.pack("S#{@xsize * @ysize * @zsize}")
  end
  def self._load(s)
    size, nx, ny, nz, items = *s[0, 20].unpack('LLLLL')
    t = Table.new(*[nx, ny, nz][0,size])         # The * turn the array into an argument list
    t.data = s[20, items * 2].unpack("S#{items}")
    t
  end
  attr_accessor(:xsize, :ysize, :zsize, :data)
end

class Color
  def initialize(r, g, b, a = 255.0)
    self.red = r.to_f
    self.green = g.to_f
    self.blue = b.to_f
    self.alpha = a.to_f
  end
  def set(r, g, b, a = 255.0)
    self.red = r.to_f
    self.green = g.to_f
    self.blue = b.to_f
    self.alpha = a.to_f
  end
  attr_reader(:red, :green, :blue, :alpha)
  def red=(val)
    @red   = [[val.to_f, 0.0].max, 255.0].min
  end
  def green=(val)
    @green = [[val.to_f, 0.0].max, 255.0].min
  end
  def blue=(val)
    @blue  = [[val.to_f, 0.0].max, 255.0].min
  end
  def alpha=(val)
    @alpha = [[val.to_f, 0.0].max, 255.0].min
  end
  def color
    Color.new(@red, @green, @blue, @alpha)
  end
  def _dump(d = 0)
    [@red, @green, @blue, @alpha].pack('d4')
  end
  def self._load(s)
    Color.new(*s.unpack('d4'))
  end
end

class Tone
  def initialize(r, g, b, a = 0.0)
    self.red = r.to_f
    self.green = g.to_f
    self.blue = b.to_f
    self.gray = a.to_f
  end
  def set(r, g, b, a = 0.0)
    self.red = r.to_f
    self.green = g.to_f
    self.blue = b.to_f
    self.gray = a.to_f
  end
  def color
    Color.new(@red, @green, @blue, @gray)
  end
  def _dump(d = 0)
    [@red, @green, @blue, @gray].pack('d4')
  end
  def self._load(s)
    Tone.new(*s.unpack('d4'))
  end
  attr_reader(:red, :green, :blue, :gray)
  def red=(val)
    @red   = [[val.to_f, -255.0].max, 255.0].min
  end
  def green=(val)
    @green = [[val.to_f, -255.0].max, 255.0].min
  end
  def blue=(val)
    @blue  = [[val.to_f, -255.0].max, 255.0].min
  end
  def gray=(val)
    @gray  = [[val.to_f, 0.0].max, 255.0].min
  end
end
