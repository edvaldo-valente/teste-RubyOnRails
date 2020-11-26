require 'rails_helper'

RSpec.describe "Commiters", type: :request do

  describe "GET /commiters" do
    context "Get commiters" do
      it "When exist commiters" do
        get "/commiters/index"
        expect(response).to have_http_status(:success)
      end
      
    end
  end


end
