require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with 'Sr. '
  end

  it { expect { create(:customer) }.to change(Customer, :count).by(1) }
end
