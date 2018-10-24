require('minitest/autorun')
require('minitest/rg')
require_relative('../food')

class FoodTest < MiniTest::Test

  def setup
    @food1 = Food.new("chips", 2, 1.3)
    @food2 = Food.new("jelly", 6, 4.5)
  end

  def test_food_has_name_and_price_and_rej
    assert_equal("chips", @food1.name)
    assert_equal(6, @food2.price)
    assert_equal(1.3, @food1.rejuvenation_level)
  end

end
