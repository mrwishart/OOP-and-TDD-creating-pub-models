class Customer

  attr_reader :name

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
  end

  def check_id
    return @age
  end

  def can_afford?(price)
    return @wallet >= price
  end

  def spends_money(price)
    @wallet -= price
  end

  def is_legal?(pub)
    return check_id >= pub.age_limit
  end

  def buys_drink(pub, drink)
    if can_afford?(drink.price) && pub.has_drink?(drink) && is_legal?(pub)

      spends_money(drink.price)

      pub.takes_money(drink.price)

      pub.sells_drink(drink)

    end
  end

end
