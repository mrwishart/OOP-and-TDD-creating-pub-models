require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')


class PubTest < MiniTest::Test

  def setup
    @drink_a = Drink.new("Beer", 2)
    @drink_b = Drink.new("Wine", 5)
    @drink_c = Drink.new("Vodka", 8)
    @drink_d = Drink.new("Cider", 4)
    drinks = [@drink_a, @drink_b, @drink_c]

    @pub = Pub.new("The Gunner", 100, drinks)
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
    expected = [@drink_a, @drink_c]
    @pub.sells_drink(@drink_b)
    actual = @pub.drinks

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

end
