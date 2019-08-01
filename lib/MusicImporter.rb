class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
   fileArray =[]
    fileNameArray = []
    Dir[@path + "/*"].each do|file| 
    fileArray << file if file.end_with?(".mp3")
    end
   
    fileArray.each do|file|
    fileNameArray << file.split("/").last
    
    end
    fileNameArray
  end
end