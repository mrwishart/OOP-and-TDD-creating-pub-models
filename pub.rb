class Pub

  attr_reader :name, :drinks, :age_limit, :drunkenness_limit

  def initialize(name, till_amount, drinks, drunkenness_limit)
    @name = name
    @till_amount = till_amount
    @drinks = drinks
    @age_limit = 18 #In UK
    @drunkenness_limit = drunkenness_limit
  end

  def till_amount
    return @till_amount
  end


  def takes_money(cash)
    @till_amount += cash
  end

  def sells_drink(drink)
    @drinks.delete(drink)
  end

  def has_drink?(drink)
    @drinks.include?(drink)
  end

end
