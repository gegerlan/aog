module RPG
  module Cache
    def self.face(filename)
      self.load_bitmap("Graphics/Faces/", filename)
    end
  end
end
