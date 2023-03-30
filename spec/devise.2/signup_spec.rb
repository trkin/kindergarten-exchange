require "rails_helper"

describe "User signs up", type: :system do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 6) }

  before do
    visit new_user_registration_path
  end

  scenario "with valid data" do
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password
    click_button "Sign up"

    expect(page).to have_content("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.")
  end

  scenario "invalid when email already exists" do
    user = create :user

    fill_in "user_email", with: user.email
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password
    click_button "Sign up"

    expect(page).to have_no_text "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    expect(page).to have_text "Email has already been taken"
  end

  scenario "invalid when password confirmation doesn't match password" do
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    fill_in "user_password", with: "dontmatch"
    click_button "Sign up"

    expect(page).to have_no_text "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
    expect(page).to have_text "Password confirmation doesn't match Password"
  end
end
