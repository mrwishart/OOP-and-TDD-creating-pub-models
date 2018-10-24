class Pub

  attr_reader :name, :drinks, :age_limit, :drunkenness_limit, :foods, :stock

  def initialize(name, till_amount, drinks, foods, drunkenness_limit)
    @name = name
    @till_amount = till_amount
    @drinks = drinks
    @stock = {}
    for drink in drinks
      stock[drink.name] = drink.stock
    end

    @foods = foods
    @age_limit = 18 #In UK
    @drunkenness_limit = drunkenness_limit.to_f
  end

  def till_amount
    return @till_amount
  end


  def takes_money(cash)
    @till_amount += cash
  end

  def sells_drink(drink)
    stock[drink.name] -= 1
  end

  def sells_food(food)
    @foods.delete(food)
  end

  def in_stock?(drink)
    return @stock[drink.name] != 0
  end

  def check_stock(drink)
    return @stock[drink.name]
  end

  def has_drink?(drink)
    @drinks.include?(drink)
  end

  def has_food?(food)
    @foods.include?(food)
  end

end
