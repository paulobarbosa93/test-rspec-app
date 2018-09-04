require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "200 OK" do
      get customers_path
      expect(response).to have_http_status(200)
    end
  end
end
