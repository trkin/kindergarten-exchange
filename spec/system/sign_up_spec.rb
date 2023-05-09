require "rails_helper"

#
# PLEASE DO NOT WRITE SLOW SYSTEM SPEC TO TEST EDGE CASES
# MODEL AND REQUESTS SPEC ARE MUCH FASTER
#
RSpec.describe "Home management", type: :system do
  before do
    driven_by(:selenium_chrome_headless) if ENV["CI"].present?
  end
  it "home" do
    visit "/"

    expect(page).to have_text("Login")
  end
end
