require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(song_name="", artist="")
    @name = song_name
    @artist_name = artist
  end

  def self.all
    return @@all
  end

  def self.create
    new_song = Song.new
    @@all.push(new_song)
    return new_song
  end

  def self.new_by_name(song_name)
    return new_song = Song.new(song_name)
  end

  def self.create_by_name(song_name)
    new_song = Song.new(song_name)
    self.all << new_song
    return new_song
  end

  def self.find_by_name(song_name)
    return self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split(".")
    filename_arr = filename_arr[0].split(" - ")
    artist = filename_arr[0]
    song = filename_arr[1]
    Song.new(song, artist)
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end


end
