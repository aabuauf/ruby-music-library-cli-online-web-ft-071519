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
end