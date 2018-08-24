require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid with description, price and category' do
    product = create(:product)
    expect(product).to be_valid
  end

  context "validates" do
    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:price) }

    it { is_expected.to validate_presence_of(:category) }
  end

  context "associations" do
    it { is_expected.to belong_to(:category) }
  end
end
