# Class for handling the shipping callback
class ShippingController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    # order = JSON.parse(request.body.read)['order']
    render json: {
      order_update: {
        items: [],
        shipping_methods: ShippoService.new.create_rates
      }
    }
  end
end
