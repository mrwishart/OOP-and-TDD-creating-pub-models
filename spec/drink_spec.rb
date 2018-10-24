require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 1, 1.8)
    @drink2 = Drink.new("Wine", 4, 4.5)
    @drink3 = Drink.new("Long Island Ice Tea", 9, 10.5)

  end

  def test_drink_name

    expected = "Beer"
    actual = @drink1.name

    assert_equal(expected, actual)

  end

  def test_drink_price

    expected = 4
    actual = @drink2.price

    assert_equal(expected, actual)

  end

  def test_drink_alcohol_unit
    expected = 10.5
    actual = @drink3.alcohol_unit
    assert_equal(expected, actual)
  end

  
end
