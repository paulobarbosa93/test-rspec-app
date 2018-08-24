require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  it 'responds successfully' do
    get :index
    expect(response).to be_success # have_http_status '200'
  end
end
