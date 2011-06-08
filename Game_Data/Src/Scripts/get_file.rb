def find_file(filename, path, extension)
  filename = filename.is_a?(Array) ? "{%s}" % [filename.join(",")] : filename
  path = path.is_a?(Array) ? "{%s}" % [path.join(",")] : path
  extension = extension.is_a?(Array) ? "{%s}" % [extension.join(",")] : extension
  return Dir["%s/%s.{%s}" % [path, filename, extension]]
end

def file_exists?(filename, path, extension)
   return !!find_file(filename, path, extension).shift
end
 
def get_picture_name(filename, variation = [], exact = false, path="Graphics/Pictures", extension=['png','gif','jpg','jpeg'])
  if exact == false
    filename_variation_points = variation.map { |text| sprintf("{ %s,}", text) }
  else
    filename_variation_points = variation
  end
  f = find_file(filename + filename_variation_points.join(" "), path, extension).shift
  return File.basename(f) unless !f || f.empty?
  return nil
end