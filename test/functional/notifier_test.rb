require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  
  # class ActionView::TestCase 
  #   class TestController
  #     def default_url_options
  #       {:locale => 'en'}
  #     end
  #   end
  # end
  
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal "Colleen Noonan cbnoonan@visionation.com", mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "order_shipped" do
    # (:locale => 'en')
    mail = Notifier.order_shipped(orders(:one))
    assert_equal "Your order has been shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal "Colleen Noonan cbnoonan@visionation.com", mail.from
    assert_match /<td>1 &times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
