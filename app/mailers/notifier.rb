class Notifier < ActionMailer::Base
  default :from => "Colleen Noonan cbnoonan@visionation.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order

    mail :to => order.email, :subject => "Pragmatic Store Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped(order)
    @order = order
    
    mail :to => order.email, :subject => "Pragmatic Store Order Shipped"
  end
  
  def order_shipped(order)
    @order = order
    
    mail :to => order.email, :subject => "Your order has been shipped"
  end
  
  def error_occured(error)
    @error = error
    mail :to => "cbnoonan@visionation.com", :subject => 'Depot App Error Incident'
  end
  
end
