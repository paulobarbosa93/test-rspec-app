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

  it 'Using attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with 'Sr. '
  end

  it { expect { create(:customer) }.to change(Customer, :count).by(1) }

  it 'Transient attributes' do
    customer = create(:customer_free, upcased: true)
    expect(customer.name.upcase).to eq customer.name
  end

  it 'Male customer' do
    customer = create(:customer_vip, :male)
    expect(customer.gender).to eq 'M'
    expect(customer.vip).to be_truthy
  end

  it 'has_many' do
    customer = create(:customer, :with_orders, qtt_orders: 5)
    expect(customer.orders.count).to eq 5
  end
end
