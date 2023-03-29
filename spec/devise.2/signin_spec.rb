require "rails_helper"

describe "User signs in", type: :system do
  before do
    @user = create :user
    visit new_user_session_path
  end

  scenario "valid with correct credentials" do
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Login"

    expect(page).to have_text "You have to confirm your email address before continuing."
  end

  scenario "invalid with incorrect credentials" do
    fill_in "user_email", with: Faker::Internet.email
    fill_in "user_password", with: "incorrectpassword"
    click_button "Login"

    expect(page).to have_text "Invalid Email or password."
    expect(page).to have_no_link "Sign Out"
  end
end