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
    newsong = Song.new
    newsong.save
    newsong
  end

  def self.new_by_name(name)
    newsong = Song.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    newsong = Song.new
    newsong.save
    newsong.name = name
    newsong
  end

  def self.find_by_name(song_name)
    @@all.find {|song_inst| song_inst.name == song_name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song_inst| song_inst.name}
  end

  def self.new_from_filename(filename)
    # artist_and_song = filename.split(' - ')
    newsong = Song.new
    newsong.artist_name = filename.split(' - ')[0]
    newsong.name = filename.split(' - ')[1].chomp('.mp3')
    newsong
  end

  def self.create_from_filename(filename)
    newsong = new_from_filename(filename)
    @@all << newsong
    newsong
  end

  def self.destroy_all
    @@all = []
  end

end
