require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')
require_relative('../food')

class CustomerTest < MiniTest::Test

  def setup

    @food1 = Food.new("chips", 2, 1.3)
    @food2 = Food.new("jelly", 6, 4.5)
    @foods = [@food1, @food2]

    @drink1 = Drink.new("Beer", 1, 2.5, 5)
    @drink2 = Drink.new("Wine", 5, 4.6, 85)
    @drink3 = Drink.new("Sambuca", 8, 1.3, 2)
    @drink4 = Drink.new("Rum", 4, 2.3, 6)
    @drinks = [@drink1, @drink2, @drink3]

    @pub1 = Pub.new("The Lamb And Flag", 50, @drinks, @foods, 100)

    @strictpub = Pub.new("The Nun And Hammer", 100, @drinks, [@food1], 4.5)

    @customer1 = Customer.new("Yuri", 300, 35)
    @customer2 = Customer.new("Cletus", 6, 58)
    @underage = Customer.new("Jimmy", 3000, 17)

  end

  def test_customer_name

    expected = "Yuri"
    actual = @customer1.name

    assert_equal(expected, actual)

  end

  # def test_customer_wallet_amount
  #
  #   expected = 300
  #   actual = @customer1.wallet_amount
  #
  #   assert_equal(expected, actual)
  #
  # end
  #
  # def test_customer_spends_money
  #
  #   expected = 295
  #   @customer1.spends_money(5)
  #   actual = @customer1.wallet_amount
  #
  #   assert_equal(expected, actual)
  #
  # end

  def test_customer_buys_drink__available

    # expected_customer = 292
    expected_till = 58

    @customer1.buys_drink(@pub1, @drink3)

    #actual_customer = @customer1.wallet_amount
    actual_till = @pub1.till_amount
    actual_drinks = @pub1.drinks

    #assert_equal(expected_customer, actual_customer)
    assert_equal(expected_till, actual_till)

  end

  def test_customer_can_afford__true

    expected = true
    actual = @customer1.can_afford?(5)

    assert_equal(expected, actual)

  end

  def test_customer_can_afford__false

    expected = false
    actual = @customer2.can_afford?(20)

    assert_equal(expected, actual)

  end

  def test_customer_buys_drink__poor

    expected = 50

    @customer2.buys_drink(@pub1, @drink3)

    actual = @pub1.till_amount

    assert_equal(expected, actual)

  end

  def test_drink_not_in_stock
    expected = 50
    @customer1.buys_drink(@pub1, @drink4)
    actual = @pub1.till_amount
    assert_equal(expected, actual)

  end

  def test_underage_customer

    expected = 50
    @underage.buys_drink(@pub1, @drink3)
    actual = @pub1.till_amount
    assert_equal(expected, actual)

  end

  def test_check_id
    expected = 17
    actual = @underage.check_id

    assert_equal(expected, actual)

  end

  def test_is_legal__true
    expected = true
    actual = @customer1.is_legal?(@pub1)

    assert_equal(expected, actual)

  end

  def test_is_legal__false
    expected = false
    actual = @underage.is_legal?(@pub1)

    assert_equal(expected, actual)
  end

  def test_customer_initial_drunkenness
    expected = 0
    actual = @customer1.drunkenness
    assert_equal(expected, actual)
  end

  def test_down_drink
    expected = @drink1.alcohol_unit
    @customer1.downs_drink(@drink1)
    actual = @customer1.drunkenness
    assert_equal(expected, actual)
  end

  def test_customer_drunkeness_after_drink
    expected = 4.6
    @customer1.buys_drink(@pub1, @drink2)
    actual = @customer1.drunkenness
    assert_equal(expected, actual)
  end

  def test_too_drunk?
    expected_drunkenness = 4.6
    expected_outcome = true

    @customer1.buys_drink(@strictpub, @drink2)

    actual_drunkenness = @customer1.drunkenness
    actual_outcome = @customer1.too_drunk?(@strictpub)

    assert_equal(expected_drunkenness, actual_drunkenness)
    assert_equal(expected_outcome, actual_outcome)

  end

  def test_too_drunk_to_serve
    expected = 105

    # Customer buys wine from strict pub. Should work
    @customer1.buys_drink(@strictpub, @drink2)
    # Customer buys sambuca from strict pub. Should be too drunk!
    @customer1.buys_drink(@strictpub, @drink3)

    actual = @strictpub.till_amount

    assert_equal(expected, actual)


  end

  def test_customer_eats_food_reduces_drunk

    expected = 0.1

    # Yuri drinks wine. Drunknness should be 4.6
    @customer1.downs_drink(@drink2)
    # Yuri eats jelly. Drunknness should be 0.1
    @customer1.eats_food(@food2)

    actual = @customer1.drunkenness

    assert_equal(expected, actual)

  end

  def test_customer_eats_food_no_drink

    expected = 0

    @customer1.eats_food(@food2)

    actual = @customer1.drunkenness

    assert_equal(expected, actual)

  end

  def test_customer_buys_food__available
    expected = 52
    expected_stock = [@food2]
    @customer1.buys_food(@pub1, @food1)
    actual = @pub1.till_amount
    actual_stock = @pub1.foods
    assert_equal(expected, actual)
    assert_equal(expected_stock, actual_stock)
  end



end
