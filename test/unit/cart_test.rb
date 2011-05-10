require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "add products to a cart" do
    cart = Cart.create
    product1 = products(:ruby)
    product2 = products(:two)

    cart.add_product(product1.id).save
    cart.add_product(product2.id).save
    
    assert_equal 2, cart.line_items.size
    assert_equal product1.price + product2.price, cart.total_price
  end
  
  test "add duplicate products to a cart" do
    cart = Cart.create
    product1 = products(:ruby)
    product2 = products(:ruby)

    cart.add_product(product1.id).save
    cart.add_product(product2.id).save
    
    assert_equal 1, cart.line_items.size
    assert_equal product1.price * 2, cart.total_price
    assert_equal 2, cart.line_items[0].quantity
  end
end
