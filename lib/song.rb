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
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
      new_song = self.new_by_name(name)
      @@all << new_song
      return new_song
  end

  def self.find_by_name(name)
    self.all.find do |song_title|
      song_title.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    song_names = []
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    dash_index = file.index("-")
    period_index = file.index(".")
    new_song = self.create_by_name(file.slice(dash_index+2...period_index))
    new_song.artist_name = file.slice(0, dash_index-1)
    return new_song
  end

  def self.create_from_filename(file)
      new_song = self.new_from_filename(file)
      @@all << new_song
  end

  def self.destroy_all
    self.all.clear
  end

end
