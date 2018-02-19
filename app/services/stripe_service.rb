# Service for dealing with stripe calls
class StripeService
  def create_order
    Stripe::Order.create(
      currency: 'usd',
      customer: 'cus_CHdv4NciT0Y1MA',
      items: fake_items,
      shipping: {
        name: 'Joe Public',
        address: {
          line1: '222 W Merchandise Mart Plaza',
          city: 'Chicago',
          state: 'IL',
          country: 'US',
          postal_code: '60654'
        }
      }
    )
  end

  def fake_items
    [
      {
        type: 'sku',
        parent: 'sku_BvqnHKG3smcasm',
        quantity: 1
      },
      {
        type: 'sku',
        parent: 'sku_Bvqn9Foea5GIdC',
        quantity: 1
      }
    ]
  end
end
