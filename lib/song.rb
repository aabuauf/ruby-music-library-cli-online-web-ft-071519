require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  
  
  @@all = []
  def initialize(name,artistobj = @artist, genreobj = @genre )
    @name = name
    self.save
    
    self.genre = genreobj if genreobj != nil
    
    self.artist = artistobj if artistobj != nil
    
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
    
    @artist
  end
  
  def artist=(artist)   
    @artist = artist
    @artist.add_song(self) 
    @artist
  end

  def genre=(genre)
    @genre =genre
    if @genre.songs.include?(self)
      
    else
      @genre.songs << self
    end
    @genre
  end
  
  def self.find_by_name(songName)
    @@all.find {|e|e.name==songName}
  end
  
  def self.find_or_create_by_name(songName)
   
    if self.find_by_name(songName) 
      self.find_by_name(songName) 
    else
      self.create(songName)
    end
  end
  
  def self.new_from_filename(title)
    
    song = Song.find_or_create_by_name(title.split(" - ")[1])
   
    artist = Artist.find_or_create_by_name(title.split(" - ")[0])
    genre = Genre.find_or_create_by_name(title.split(" - ")[2].split(".")[0])
    
    
    song.genre = genre
    song.artist = artist
 
    return song
 
  end
  
  def self.create_from_filename(title)
    self.new_from_filename(title)
  end
    
end