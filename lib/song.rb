class Song
  attr_accessor :name, :artist
  
  @@all = []
  def initialize(name,artistobj = @artist)
    @name = name
    self.save
    self.artist = artistobj
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
  end
end