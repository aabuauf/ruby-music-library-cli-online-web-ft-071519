
  module Concerns
    module Findable
        def find_by_name(songName)
          all.find {|e|e.name==songName}
        end
        
        def find_or_create_by_name(songName)
         
          if find_by_name(songName) 
            find_by_name(songName) 
          else
            create(songName)
          end
        end
    end
  end

