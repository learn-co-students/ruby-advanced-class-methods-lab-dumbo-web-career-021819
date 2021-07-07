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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = find_by_name(name)
    return create_by_name(name) if song.nil?

    song
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    artist_title = filename.split('-')
    song_artist = artist_title[0].strip
    song_name = artist_title[1].strip.chomp('.mp3')

    song = new_by_name(song_name)
    song.artist_name = song_artist

    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end
end
