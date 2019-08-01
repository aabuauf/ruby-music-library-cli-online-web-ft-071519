require 'pry'

class Genre
  attr_accessor :name, :songs
  
  @@all = []
  def initialize(name)
    @name = name
    self.save
    @songs = []
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
    genre = self.new(name)
  end
  
  def artists
    artistsArray = []
    @@all.each do |genre_el|
      
      genre_el.songs.each do |songs_el|
        artistsArray << songs_el.artist
      end
    end
    artistsArray.uniq
  end
end