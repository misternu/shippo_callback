# Create orders and respond to requests for shipping options
class OrdersController < ApplicationController
  def create
    order = nil
    begin
      p order = StripeService.new.create_order
    rescue Stripe::StripeError => e
      p e
    end
    redirect_to "/orders/#{order.id}"
  end

  def show
    @order = Stripe::Order.retrieve(params[:id])
  end
end
