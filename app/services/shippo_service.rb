# Class for making calls to the shippo service
class ShippoService
  def create_shipment
    Shippo::Shipment.create(
      address_from: address_from,
      address_to: address_to,
      parcels: parcel,
      async: false
    )
  end

  def create_rates
    p shipment = create_shipment
    rates = convert_rates(shipment.rates)
    rates.unshift(pick_up_option)
    rates
  end

  def convert_rates(rates)
    rates.map do |rate|
      {
        id: rate['object_id'],
        amount: (rate.amount.to_f * 100).to_i,
        currency: 'usd',
        delivery_estimate: nil,
        description: "#{rate['provider']} #{rate['servicelevel']['name']}"
      }
    end
  end

  def pick_up_option
    {
      id: 'pick_up-shipping',
      amount: 0,
      currency: 'usd',
      delivery_estimate: nil,
      description: 'Pick Up'
    }
  end

  def address_from
    {
      name: 'Back of the Yards Coffee',
      street1: '2059 W 47th St',
      city: 'Chicago',
      state: 'IL',
      country: 'US',
      zip: '60609'
    }
  end

  def address_to
    {
      name: 'Joe Public',
      street1: '222 W Merchandise Mart Plaza',
      city: 'Chicago',
      state: 'IL',
      country: 'US',
      zip: '60654'
    }
  end

  def parcel
    {
      length: 5,
      width: 1,
      height: 5.555,
      distance_unit: :in,
      weight: 2,
      mass_unit: :lb
    }
  end
end
