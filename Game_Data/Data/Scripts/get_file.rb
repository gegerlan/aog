def find_file(filename, path, extension)
  filename = filename.is_a?(Array) ? "{%s}" % [filename.join(",")] : filename
  path = path.is_a?(Array) ? "{%s}" % [path.join(",")] : path
  extension = extension.is_a?(Array) ? "{%s}" % [extension.join(",")] : extension
  return Dir["%s/%s.{%s}" % [path, filename, extension]]
end

def file_exists?(filename, path, extension)
   return !!find_file(filename, path, extension).shift
end
 
def get_picture_name(filename, exact = false, path="Graphics/Pictures", extension=['png','gif','jpg','jpeg'])
  filename = filename.split(/[\s]/)
  begin
    f = find_file(filename.join(" "), path, extension).shift
    return File.basename(f) unless !f || f.empty?
    filename.pop
  end while filename[0] && !exact
  return ""
end