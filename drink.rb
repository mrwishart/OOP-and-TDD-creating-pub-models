class Drink

  attr_reader :name, :price, :alcohol_unit

  def initialize(name, price, alcohol_unit)
    @name = name
    @price = price
    @alcohol_unit = alcohol_unit
  end

end
