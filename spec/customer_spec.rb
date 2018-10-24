require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')

class CustomerTest < MiniTest::Test

  def setup

    @drink1 = Drink.new("Beer", 1)
    @drink2 = Drink.new("Wine", 5)
    @drink3 = Drink.new("Sambuca", 8)
    @drinks = [@drink1, @drink2, @drink3]

    @pub1 = Pub.new("The Lamb And Flag", 50, @drinks)

    @customer1 = Customer.new("Yuri", 300)

  end

  def test_customer_name

    expected = "Yuri"
    actual = @customer1.name

    assert_equal(expected, actual)

  end

  def test_customer_wallet_amount

    expected = 300
    actual = @customer1.wallet_amount

    assert_equal(expected, actual)

  end

  def test_customer_spends_money

    expected = 295
    @customer1.spends_money(5)
    actual = @customer1.wallet_amount

    assert_equal(expected, actual)

  end

  def test_customer_buys_drink__available

    expected_customer = 292
    expected_till = 58
    expected_drinks = [@drink1, @drink2]

    @customer1.buys_drink(@pub1, @drink3)

    actual_customer = @customer1.wallet_amount
    actual_till = @pub1.till_amount
    actual_drinks = @pub1.drinks

    assert_equal(expected_customer, actual_customer)
    assert_equal(expected_till, actual_till)
    assert_equal(expected_drinks, actual_drinks)

  end

end
