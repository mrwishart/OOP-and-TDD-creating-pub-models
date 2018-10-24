class Customer

  attr_reader :name, :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0.0
  end

  def drunkenness
    return @drunkenness.round(1)
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

  def too_drunk?(pub)
    return @drunkenness > pub.drunkenness_limit
  end

  def downs_drink(drink)
    @drunkenness += drink.alcohol_unit
  end

  def eats_food(food)
    @drunkenness -= food.rejuvenation_level
    @drunkenness = 0 if @drunkenness < 0
  end

  def buys_drink(pub, drink)
    if can_afford?(drink.price) && pub.has_drink?(drink) && is_legal?(pub) && !too_drunk?(pub)

      spends_money(drink.price)

      pub.takes_money(drink.price)

      pub.sells_drink(drink)

      downs_drink(drink)

    end
  end

  def buys_food(pub, food)
    if can_afford?(food.price) && pub.has_food?(food)

      spends_money(food.price)
      pub.takes_money(food.price)
      pub.sells_food(food)
      eats_food(food)

    end


  end

end
