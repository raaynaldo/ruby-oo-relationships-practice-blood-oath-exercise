class Cult
  attr_reader :name, :location, :founding_year, :slogan
  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all < all
  end

  def recruit_follower(follower)
    # takes in an argument of a Follower instance and adds them to this cult's list of followers
  end

  def cult_population
    # returns an Integer that is the number of followers in this cult
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.select { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    self.all.select { |cult| cult.year == year }
  end
end
