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
   
    userInput = gets.strip
    
    if userInput.downcase == "list songs"
       list_songs
    end
    if userInput.downcase == "list artists"
       list_artists
    end
    if userInput.downcase == "list genres"
       list_genres
    end
    if userInput.downcase == "list artist"
       list_songs_by_artist
    end   
    if userInput.downcase == "list genre"
       list_songs_by_genre
    end  
    if userInput.downcase == "play song"
       play_song
    end  
    until userInput.downcase == "exit" do 
        puts("Welcome to your music library!")
        puts("To list all of your songs, enter 'list songs'.")
        puts("To list all of the artists in your library, enter 'list artists'.")
        puts("To list all of the genres in your library, enter 'list genres'.")
        puts("To list all of the songs by a particular artist, enter 'list artist'.")
        puts("To list all of the songs of a particular genre, enter 'list genre'.")
        puts("To play a song, enter 'play song'.")
        puts("To quit, type 'exit'.")
        puts("What would you like to do?")
        
userInput = gets.strip
    end
    



  end
  
  def list_songs(number = 0)
    i=0
    newArray = []
    @musicImporter.each do |eachsong|
      newArray << [eachsong.split(" - ")[1], eachsong.split(" - ")[0],eachsong.split(" - ")[2]]
  
    end
    newArray = newArray.sort
    @musicImporter = []
    newArray.each do |eachSong|
      newfile = [eachSong[1],eachSong[0],eachSong[2]].join (" - ")
       if number == 0
        puts "#{i+=1}. #{newfile.split(".")[0]}"
       @musicImporter << "#{i}. #{newfile.split(".")[0]}"
     else
       @musicImporter << "#{i+=1}. #{newfile.split(".")[0]}"
     end
    end
    return @musicImporter
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
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
     gets.strip
    i =0
    newArray = []
    
    Song.all.each do |eachSong|
      
      if gets.strip == eachSong.artist.name
        newArray << eachSong.name + " - " + eachSong.genre.name
       
      end
    end
    newArray = newArray.sort.uniq
    newArray.each do |eachsong|
      puts "#{i+=1}. #{eachsong}"
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    gets.strip
        i =0
    newArray = []
    
    Song.all.each do |eachSong|
      
      if gets.strip == eachSong.genre.name
        newArray << eachSong.name + " - " + eachSong.artist.name
       
      end
    end
    newArray = newArray.sort.uniq
    newArray.each do |eachsong|
      puts "#{i+=1}. #{eachsong.split(" - ")[1]} - #{eachsong.split(" - ")[0]}"
    end
  end
  
  def play_song
    puts("Which song number would you like to play?")
    gets.strip
   
   
    
    list_songs(gets.strip).each do |eachSong|
   
      if gets.strip == eachSong.split(".")[0]
        
        puts "Playing #{eachSong.split(" - ")[1]} by #{eachSong.split(" - ")[0].split(". ")[1]}"

      end  
    end
  end
end