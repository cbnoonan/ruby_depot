class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    @products = Product.all
    @counter = increment_count
    @cart = current_cart
  end

  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end
  
end
