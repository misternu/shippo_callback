# Class for handling the shipping callback
class ShippingController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
    # order = JSON.parse(request.body.read)['order']
    p JSON.parse(request.body.read)
    p order_update = {
      items: [],
      shipping_methods: [
        {
          id: 'pick_up-shipping',
          amount: 0,
          currency: 'usd',
          delivery_estimate: nil,
          description: 'Pick Up'
        },
        {
          id: 'bout_tree_fitty',
          amount: 350,
          currency: 'usd',
          delivery_estimate: nil,
          description: 'About Three Fifty'
        },
        {
          id: 'ten_dollar-shipping',
          amount: 1000,
          currency: 'usd',
          delivery_estimate: nil,
          description: 'deluxe shipping'
        }
      ]
    }
    render json: { order_update: order_update }
  end
end
