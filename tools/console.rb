require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

catholic = Cult.new("Catholic", "MD", 2020, "Catholic's slogan!")
christian = Cult.new("Christian", "OH", 1900, "Christian's slogan!")

adi = Follower.new("Adi", 20, "Adi's Motto")
budi = Follower.new("Budi", 21, "Budi's Motto")

puts "Cult Testing : "
catholic.recruit_follower(adi)
catholic.recruit_follower(budi)
puts catholic.cult_population == 2
puts Cult.all[0] == catholic
puts Cult.find_by_name(catholic.name) == catholic
puts Cult.find_by_location(catholic.location)[0] == catholic
puts Cult.find_by_founding_year(2020)[0] == catholic
puts catholic.average_age == (20+21).to_f/2
catholic.my_followers_mottos
puts Cult.least_popular == christian
christian = Cult.new("Christian 2", "OH", 1900, "Christian's slogan!")
puts Cult.most_common_location == "OH"

puts "----------"

puts "Follower Testing :"
puts adi.cults == [catholic]
adi.join_cult(christian)
puts Follower.all == [adi,budi]
puts Follower.of_a_certain_age(21) == [budi]
adi.my_cults_slogans
puts Follower.most_active == adi
pp Follower.top_ten

puts "----------"
puts "Bonus Testing:"
sarah = Follower.new("Sarah", 21, "Sarah's Motto")
dewi = Follower.new("Dewi", 21, "Dewi's Motto")
sarah.join_cult(catholic)
dewi.join_cult(catholic)
pp budi.fellow_cult_members
monic = Follower.new("Monic", 19, "Monic's Motto")
catholic.recruit_follower(monic)
anto = Follower.new("Anto", 15, "Anto's Mottor")
anto.join_cult(catholic)
# binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits