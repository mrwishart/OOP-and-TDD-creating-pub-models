class Pub

  attr_reader :name, :drinks, :age_limit

  def initialize(name, till_amount, drinks)
    @name = name
    @till_amount = till_amount
    @drinks = drinks
    @age_limit = 18 #In UK
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
