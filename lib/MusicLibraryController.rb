class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path="./db/mp3s")
    @path = path
    @musicImporter = MusicImporter.new(path).import
  end
  
  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")
    gets.strip
    
    until gets.strip.downcase == "exit" do 
        puts("Welcome to your music library!")
        puts("To list all of your songs, enter 'list songs'.")
        puts("To list all of the artists in your library, enter 'list artists'.")
        puts("To list all of the genres in your library, enter 'list genres'.")
        puts("To list all of the songs by a particular artist, enter 'list artist'.")
        puts("To list all of the songs of a particular genre, enter 'list genre'.")
        puts("To play a song, enter 'play song'.")
        puts("To quit, type 'exit'.")
        puts("What would you like to do?")
        gets.strip
    end
  end
  
  def list_songs
    i=0
    newArray = []
    @musicImporter.each do |eachsong|
      newArray << [eachsong.split(" - ")[1], eachsong.split(" - ")[0],eachsong.split(" - ")[2]]
  
    end
    newArray = newArray.sort
    
    newArray.each do |eachSong|
      newfile = [eachSong[1],eachSong[0],eachSong[2]].join (" - ")
       puts "#{i+=1}. #{newfile.split(".")[0]}"
    end
  end
  
  def list_artists
    allArtists =[]
    Artist.all.each do |artist_el|
      allArtists << artist_el.name
    end
    allArtists = allArtists.sort.uniq
    
    i = 0
    allArtists.each do |eachArtist|
      puts "#{i+=1}. #{eachArtist}"
    end
  end
  
  def list_genres
    allGenres =[]
    
    Genre.all.each do |genres_el|
      allGenres<< genres_el.name
    end
    allGenres = allGenres.sort.uniq
    
    i = 0
    allGenres.each do |eachGenre|
      puts "#{i+=1}. #{eachGenre}"
    end
  end
end