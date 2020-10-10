class Startup

  @@all = []
  attr_reader :name, :domain, :founder

  def initialize(name, domain, founder)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def pivot(name, domain)
    @name = name
    @domain = domain
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find{ |startup| startup.founder == founder }
  end
  
  def self.domains
    self.all.map{ |startup| startup.domain }.uniq
  end

  def sign_contract(venture_capitalist, type, investment)
    new_round = FundingRound.new(self, venture_capitalist, type, investment)
  end
  
  def rounds
    FundingRound.all.select { |fr| fr.startup == self }    
  end
  
  def num_funding_rounds
    self.rounds.length
  end  
  
  def total_funds
    self.rounds.map { |fr| fr.investment }.sum   
  end
  
  def investors
    self.rounds.map { |fr| fr.venture_capitalist }.uniq
  end
  
  def big_investors
    self.investors.select { |startup| startup if VentureCapitalist.tres_commas_club.include?(startup) }
  end 
  
end