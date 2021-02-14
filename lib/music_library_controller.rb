require "pry"

class MusicLibraryController

def initialize(path = './db/mp3s')
@path = path
new = MusicImporter.new(path)
new.import
end

def call
puts "Welcome to your music library!"
puts "To list all of your songs, enter 'list songs'."
puts "To list all of the artists in your library, enter 'list artists'."
puts "To list all of the genres in your library, enter 'list genres'."
puts "To list all of the songs by a particular artist, enter 'list artist'."
puts "To list all of the songs of a particular genre, enter 'list genre'."
puts "To play a song, enter 'play song'."
puts "To quit, type 'exit'."
puts "What would you like to do?"
4.times {input = gets}
end 

def list_songs
list = Song.all.sort_by {|song| song.name}
list.each_with_index do |song, index|
  puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
end 
end

def list_artists
  list = Artist.all.sort_by {|artist| artist.name}
list.each_with_index do |artist, index|
  puts "#{index+1}. #{artist.name}"
end 
end

def list_genres
  list = Genre.all.sort_by {|genre| genre.name}
  list.each_with_index do |genre, index|
    puts "#{index+1}. #{genre.name}"
end 
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.strip
  found_artist = Artist.find_by_name(input)
  if found_artist
  found_sort = found_artist.songs.sort_by {|song| song.name}
  found_sort.each_with_index do |song, index|
  puts "#{index+1}. #{song.name} - #{song.genre.name}"
  end 
  end  
end 

def list_songs_by_genre
 puts "Please enter the name of a genre:"
  input = gets.strip
  found_genre = Genre.find_by_name(input)
  if found_genre
  found_sort = found_genre.songs.sort_by {|song| song.name}
   found_sort.each_with_index do |song, index|
     puts "#{index+1}. #{song.artist.name} - #{song.name}"
end
end 
end

  def play_song
    puts  "Which song number would you like to play?"
    input = gets.to_i
    if Song.all[input-1]
    list = Song.all.sort_by {|song| song.name}
    binding.pry
    list[input-1]
    
    end
  end 

end 




