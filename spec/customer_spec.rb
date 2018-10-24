require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')

class CustomerTest < MiniTest::Test

  def setup

    @customer1 = Customer.new("Yuri", 300)

  end

  def test_customer_name

    expected = "Yuri"
    actual = @customer1.name

    assert_equal(expected, actual)

  end

end
