# Service for dealing with stripe calls
class StripeService
  def initialize(options = {})
    @customer_id = options.fetch(:customer_id, 'cus_CHdv4NciT0Y1MA')
    @name = options.fetch(:name, 'Joe Public')
    @address = options.fetch(:address, fake_address)
    @items = options.fetch(:items, fake_items)
  end

  def create_order
    Stripe::Order.create(
      currency: 'usd',
      customer: @customer_id,
      items: @items,
      shipping: {
        name: @name,
        address: @address
      }
    )
  end

  def fake_address
    {
      line1: '222 W Merchandise Mart Plaza',
      city: 'Chicago',
      state: 'IL',
      country: 'US',
      postal_code: '60654'
    }
  end

  def fake_items
    [
      { type: 'sku', parent: 'sku_BvqnHKG3smcasm', quantity: 1 },
      { type: 'sku', parent: 'sku_Bvqn9Foea5GIdC', quantity: 1 }
    ]
  end
end
