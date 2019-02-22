require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    count = 0
    @@all.map do |each_song|
      if each_song.name == song_name
        count += 1
        return each_song
      end
      end
      if count == 0
        nil
      end
      end

def self.find_or_create_by_name(song_name)
  new_song = find_by_name(song_name)
  if new_song == nil
    Song.create_by_name(song_name)
  else
    new_song
  end
end

def self.alphabetical
  @@all.sort_by {|each_song| each_song.name}
end

def self.new_from_filename(filename)
  filename.split("-")
  new_song = create_by_name(filename.split("-")[1].split(".")[0].strip)
  new_song.artist_name = filename.split("-")[0].strip
  new_song
end

def self.create_from_filename(filename)
  @@all << new_from_filename(filename)
end

def self.destroy_all
  @@all.clear
end

end
