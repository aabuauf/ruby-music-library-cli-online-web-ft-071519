

class Song
  attr_accessor :name, :artist, :genre
  
  @@all = []
  def initialize(name,artistobj = @artist, genreobj = @genre )
    @name = name
    self.save
    self.artist = artistobj
    self.genre = genreobj
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
  def artist

#   @artist.songs << self if @artist != nil 
#   @artist.add_song(self) if @artist != nil 
    @artist
  end
  
  def genre
    @genre.songs << self
    @genre
  end
    
end