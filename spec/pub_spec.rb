require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')


class PubTest < MiniTest::Test

  def setup
    @drink_a = Drink.new("Beer", 2)
    @drink_b = Drink.new("Wine", 5)
    @drink_c = Drink.new("Vodka", 8)
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



end
