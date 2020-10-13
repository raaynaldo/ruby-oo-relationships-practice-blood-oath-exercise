require "date"

class BloadOath
  attr_reader :cult, :follower, :initiation_date
  @@all = []

  def initialize(cult, follower)
    @cult = cult
    @follower = follower
    @initiation_date = DateTime.now.strftime("%F")
    @@all << self
  end

  def self.all
    @@all
  end
end
