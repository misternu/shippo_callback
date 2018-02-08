# Create orders and respond to requests for shipping options
class OrdersController < ApplicationController
  def create
    begin
      p StripeService.new.create_order
    rescue Stripe::StripeError => e
      p e
    end
    redirect_to '/orders'
  end
end
