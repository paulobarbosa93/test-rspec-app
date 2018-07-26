require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with 'Sr. '
  end

  it 'Overwrite attributes' do
    customer = create(:customer, vip: false, days_to_pay: 15)
    expect(customer.vip).to be_falsey
  end

  it 'Inheritance - vip' do
    customer = create(:customer_vip)
    expect(customer.vip).to be_truthy
  end

  it { expect { create(:customer) }.to change(Customer, :count).by(1) }
end
