# Class for handling the shipping callback
class ShippingController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    # order = JSON.parse(request.body.read)['order']
    _, rates = ShippoService.new.create_shipment_and_rates
    render json: {
      order_update: {
        items: [],
        shipping_methods: rates
      }
    }
  end
end
