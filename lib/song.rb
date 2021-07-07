require "pry"

class Song

  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |object|
      object.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    if song == nil
      song = self.create_by_name(song_name)
    end
      song
  end

  def self.alphabetical
    self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(file_name)
    d = [" - ",".mp3"]
    song_artist_name = file_name.split(Regexp.union(d))[0]
    song_name = file_name.split(Regexp.union(d))[1]
    song = self.new
    song.name = song_name
    song.artist_name = song_artist_name
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

end
