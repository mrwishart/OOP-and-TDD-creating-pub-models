class Customer

  attr_reader :name

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def wallet_amount
    return @wallet
  end

  def spends_money(price)
    @wallet -= price
  end

  def buys_drink(pub, drink)
    spends_money(drink.price)
    pub.takes_money(drink.price)
    pub.sells_drink(drink)
  end

end
