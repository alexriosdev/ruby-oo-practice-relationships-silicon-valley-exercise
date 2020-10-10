class VentureCapitalist

  @@all = []
  attr_reader :name, :total_worth

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select{ |vc| vc.total_worth > 1000000000 }
  end

  def offer_contract(startup, type, investment)
    new_round = FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.venture_capitalist == self }
  end

  def portfolio
    self.funding_rounds.map { |fr| fr.startup}.uniq
  end
  
  def biggest_investment
    self.funding_rounds.max_by { |fr| fr.investment }
    
    # # ALTERNATIVE SOLUTION 1
    # amount = self.funding_rounds.map { |index| index.investment }.max
    # self.funding_rounds.find { |index| index.investment == amount }

    # # ALTERNATIVE SOLUTION 2
    # self.funding_rounds.max { |a, b| a.investment <=> b.investment } 
  end
  
  def invested(domain)
    rounds = self.funding_rounds.select { |fr| fr.startup.domain == domain }
    rounds.map { |fr| fr.investment }.sum
  end
  
end