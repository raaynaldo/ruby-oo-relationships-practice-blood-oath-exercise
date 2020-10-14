class Follower
  attr_reader :name, :age, :life_motto
  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def cults
    # returns an Array of this follower's cults
    BloadOath.all.select { |bo| bo.follower == self }.map { |bo| bo.cult }
  end

  def join_cult(cult)
    # takes in an argument of a Cult instance and adds this follower to the cult's list of followers
    if self.age >= cult.minimum_age
        BloadOath.new(cult, self)
    else
        puts "Sorry #{self.name}, you are too young."
    end
  end

  def my_cults_slogans
    cults.each { |cult| puts cult.slogan }
  end

  def fellow_cult_members
    members = []
    self.cults.each { |cult| members += cult.followers }
    members.uniq
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age == age }
  end

  def self.most_active
    self.all.max_by { |follower| follower.cults.count() }
  end

  def self.top_ten
    self.all.sort_by { |follower| -follower.cults.count() }.take(10)
  end
end
