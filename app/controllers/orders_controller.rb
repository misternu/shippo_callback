# Create orders and respond to requests for shipping options
class OrdersController < ApplicationController
  def create
    redirect_to '/orders'
  end
end
