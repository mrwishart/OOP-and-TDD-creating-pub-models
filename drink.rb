class Drink

  attr_reader :name, :price, :alcohol_unit, :stock

  def initialize(name, price, alcohol_unit, stock)
    @name = name
    @price = price
    @alcohol_unit = alcohol_unit.to_f
    @stock = stock
  end

end
