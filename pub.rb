class Pub

  attr_reader :name, :drinks

  def initialize(name, till_amount, drinks)
    @name = name
    @till_amount = till_amount
    @drinks = drinks
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

end
