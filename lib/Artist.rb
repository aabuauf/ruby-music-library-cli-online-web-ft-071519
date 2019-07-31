require 'pry'
class Artist
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
    song = Song.new(nameSong,self)
  
    song.artist = self
    @songs << song
  end
end