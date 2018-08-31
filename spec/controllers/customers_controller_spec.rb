require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  context "when not logged" do
    it 'responds successfully' do
      get :index
      expect(response).to be_success # have_http_status '200'
    end
  end

  context "when logged" do
    before do
      @member = create(:member)
      @customer = create(:customer)
    end

    it { should route(:get, '/customers').to(action: :index) }

    it '#show' do
      sign_in @member
      get :show, params: { id: @customer.id }
      expect(response).to be_success
    end

    it 'flash notice' do
      customer_params = attributes_for(:customer)
      sign_in @member
      post :create, params: { customer: customer_params }
      expect(flash[:notice]).to match(/successfully created/)
    end

    it 'create with valid attributes' do
      customer_params = attributes_for(:customer)
      sign_in @member
      expect {
        post :create, params: { customer: customer_params }
      }.to change(Customer, :count).by(1)
    end

    it 'create with invalid attributes' do
      customer_params = attributes_for(:customer, address: nil)
      sign_in @member
      expect {
        post :create, params: { customer: customer_params }
      }.not_to change(Customer, :count)
    end

    it 'Content-Type' do
      sign_in @member
      get :show, format: :json, params: { id: @customer.id }
      expect(response.content_type).to eq 'application/json'
    end
  end
end
