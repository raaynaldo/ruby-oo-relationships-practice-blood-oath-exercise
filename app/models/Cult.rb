class Cult
  attr_reader :name, :location, :founding_year, :slogan, :minimum_age
  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = 20
    @@all << self
  end

  def recruit_follower(follower)
    # takes in an argument of a Follower instance and adds them to this cult's list of followers
    if follower.age >= self.minimum_age
      BloadOath.new(self, follower)
    else
      puts "Sorry #{follower.name}, you are too young."
    end
  end

  def cult_population
    # returns an Integer that is the number of followers in this cult
    BloadOath.all.count { |bo| bo.cult == self }
  end

  def followers
    BloadOath.all
      .select { |bo| bo.cult == self }
      .map { |bo_cult| bo_cult.follower }
  end

  def average_age
    followers_ages = self.followers
      .map { |follower| follower.age }

    followers_ages.inject { |sum, item| sum + item }.to_f / followers_ages.count
  end

  def my_followers_mottos
    self.followers.each { |follower| puts follower.life_motto }
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find { |cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.select { |cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    self.all.select { |cult| cult.founding_year == year }
  end

  def self.least_popular
    self.all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location
    cult_locations = self.all.map{|cult| cult.location}
    cult_locations.max_by {|i| cult_locations.count(i)}
  end
end
