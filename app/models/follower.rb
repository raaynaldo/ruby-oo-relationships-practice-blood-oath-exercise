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
    BloadOath.all.select{|bo| bo.follower == self}.map{|bo| bo.cult}
  end

  def join_cult(cult)
    # takes in an argument of a Cult instance and adds this follower to the cult's list of followers
    BloadOath.new(cult, self)
  end

  def self.all
    @@all
  end

  def self.of_a_certain_age(age)
    self.all.select { |follower| follower.age == age }
  end
end
