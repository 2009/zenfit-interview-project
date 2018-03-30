require 'rails_helper'

RSpec.describe "ZenTimes", type: :request do
  let(:headers) do
    authenticated_header
  end

 describe "GET /zen_times" do
    it "works! (now write some real specs)" do
      get zen_times_path, headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
