# Class for handling the shipping callback
class ShippingController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    shipment = ShippoService.new.create_shipment
    rates = shipment.rates
    shipping_methods = rates.map do |rate|
      {
        id: rate['object_id'],
        amount: (rate.amount.to_f * 100).to_i,
        currency: 'usd',
        description: "#{rate['provider']} #{rate['servicelevel']['name']}"
      }
    end
    pick_up = {
      id: 'pick_up-shipping',
      amount: 0,
      currency: 'usd',
      description: 'Pick Up'
    }
    shipping_methods.unshift(pick_up)
    # order = JSON.parse(request.body.read)['order']
    # JSON.parse(request.body.read)
    render json: { order_update: { shipping_methods: shipping_methods } }
  end
end
