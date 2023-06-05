require "rails_helper"

RSpec.describe "PagesController", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "GET any page" do
    context "when user is logged in" do
      before do
        sign_in users(:user)
      end
      it "gets requested page" do
        get root_path
        expect(response).to have_http_status(200)
      end
    end

    context "when user is not logged in" do
      before do
        sign_out users(:user)
      end
      it "redirects to wishes_path unless requested path is contact_path" do
        get root_path
        expect(response).to redirect_to(wishes_path)

        get "/contact"
        expect(response).to have_http_status(200)
      end
    end
  end
end
