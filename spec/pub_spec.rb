require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../food')


class PubTest < MiniTest::Test

  def setup
    @food1 = Food.new("chips", 2, 1.3)
    @food2 = Food.new("jelly", 6, 4.5)
    @food3 = Food.new("banana", 5, 2.2)
    foods = [@food1, @food2]


    @drink_a = Drink.new("Beer", 2, 2.5, 5)
    @drink_b = Drink.new("Wine", 5, 5.7, 16)
    @drink_c = Drink.new("Vodka", 8, 2.1, 2)
    @drink_d = Drink.new("Cider", 4, 2.4, 84)
    drinks = [@drink_a, @drink_b, @drink_c]

    @pub = Pub.new("The Gunner", 100, drinks, foods, 50)
  end

  def test_pub_has_name
    assert_equal("The Gunner", @pub.name)
  end

  def test_pub_drinks
    assert_equal([@drink_a, @drink_b, @drink_c], @pub.drinks)
  end

  def test_pub_till
    assert_equal(100, @pub.till_amount)
  end

  def test_till_takes_in_money
    @pub.takes_money(5)
    assert_equal(105, @pub.till_amount)

  end

  def test_pub_sells_drink
    expected = 15
    @pub.sells_drink(@drink_b)
    actual = @pub.check_stock(@drink_b)

    assert_equal(expected, actual)

  end

  def test_pub_has_drink__true
    expected = true
    actual = @pub.has_drink?(@drink_a)
    assert_equal(expected, actual)
  end

  def test_pub_has_drink__false
    expected = false
    actual = @pub.has_drink?(@drink_d)
    assert_equal(expected, actual)
  end

  def test_pub_age_limit
    expected = 18
    actual = @pub.age_limit
    assert_equal(expected, actual)
  end

  def test_pub_drunkenness_limit
    expected = 50
    actual = @pub.drunkenness_limit
    assert_equal(expected, actual)
  end

  def test_pub_food
    expected = [@food1, @food2]
    actual = @pub.foods
    assert_equal(expected, actual)
  end

  def test_pub_has_food__true
    expected = true
    actual = @pub.has_food?(@food1)
    assert_equal(expected, actual)
  end

  def test_pub_has_food__false
    expected = false
    actual = @pub.has_food?(@food3)
    assert_equal(expected, actual)
  end

  def test_pub_sells_food
    expected = [@food1]
    @pub.sells_food(@food2)
    actual = @pub.foods

    assert_equal(expected, actual)

  end

  def test_pub_stock
    expected = { "Beer" => 5, "Wine" => 16, "Vodka" => 2}
    actual = @pub.stock
    p @pub.stock
    assert_equal(expected, actual)
  end

end
