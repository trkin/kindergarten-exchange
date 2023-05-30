require "rails_helper"

RSpec.describe "ContactForm", type: :request do
  include Capybara::DSL

  describe "POST /contact_form" do
    it "sends an email" do
      get contact_path
      post "/contact", params: {contact_form: {name: "John Smith", email: "john@example.com", question: "Hello, I have a question."}}

      expect(response).to have_http_status(302)
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end
  end
end
