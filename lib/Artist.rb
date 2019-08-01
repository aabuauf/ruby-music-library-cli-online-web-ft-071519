require 'pry'


class Artist
 
 
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    self.save
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
    artist = self.new(name)
  end
  
  def add_song(nameSong)
 
   nameSong.artist = self if nameSong.artist == nil
    
   if @songs.include?(nameSong) 
   else
     @songs << nameSong 
   end
 
  end
  
   def genres
   allGenre =[]
    @@all.each do |artist_el|
       
      artist_el.songs.each do |song_el|
       
       allGenre << song_el.genre
      end
    end
    return allGenre.uniq
   end
end