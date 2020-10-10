require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Startups
s1 = Startup.new("PLACEHOLDER", "placeholder.com", "Elon Musk")
s2 = Startup.new("AMAZON", "amazon.com", "Jeff Bezos")
s3 = Startup.new("FACEBOOK", "facebook.com", "Mark Zukerberg")
# puts Startup.find_by_founder("Elon Musk")
# puts Startup.domains


# Venture Capitalists
vc1 = VentureCapitalist.new("Alex", 500000)
vc2 = VentureCapitalist.new("Dom", 9000000000)
vc3 = VentureCapitalist.new("Mara", 5000000000)
# puts VentureCapitalist.all.inspect.split(/[>]+/)
# puts VentureCapitalist.tres_commas_club.inspect.split(/[>]+/)

# Funding Rounds
f1 = FundingRound.new(s1, vc1, "Series X", 200)
f2 = FundingRound.new(s1, vc1, "Series Y", 300)
f3 = FundingRound.new(s3, vc1, "Series Z", 600.5)
f4 = FundingRound.new(s2, vc2, "Series A", 1000000000)
f5 = FundingRound.new(s3, vc2, "Series B", 2.5)
f6 = FundingRound.new(s3, vc2, "Series C", 2.5)
f7 = FundingRound.new(s2, vc3, "Series T", 5000000000)
# puts FundingRound.all.inspect.split(/[>]+/)

# Sign Contracts
s1.sign_contract(vc1, "Angel", 20)
s1.sign_contract(vc2, "Seed", 2000000000)
s1.sign_contract(vc2, "Seed", 4000000000)

# Offer Contracts
vc2.offer_contract(s2, "Seed", 5000)

# Confirms if startup data is updated after everything is already created
s1.pivot("TESLA", "tesla.com")

binding.pry
0 #leave this here to ensure binding.pry isn't the last line