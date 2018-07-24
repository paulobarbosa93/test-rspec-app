require 'rails_helper'

RSpec.describe Customer, type: :model do

  fixtures :customers

  it 'Create a Customer' do
    customer = customers(:paulo)
    expect(customer.full_name).to eq 'Sr. Paulo Barbosa'
  end
end
