class Customer

  attr_reader :name

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def can_afford?(price)
    return @wallet >= price
  end

  def spends_money(price)
    @wallet -= price
  end

  def buys_drink(pub, drink)
    if can_afford?(drink.price) && pub.has_drink?(drink)
      spends_money(drink.price)
      pub.takes_money(drink.price)
      pub.sells_drink(drink)
    end
  end

end
