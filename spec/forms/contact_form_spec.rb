require "rails_helper"

describe "Send Email with Contact Form", type: :system do
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password(min_length: 6) }
  let(:text) { Faker::Lorem.characters(number: 50) }

  before do
    visit new_user_registration_path
    fill_in "user_email", with: email
    fill_in "user_password", with: password
    fill_in "user_password_confirmation", with: password
    click_button "Sign up"
  end

  # If User is logged in

  scenario "if user signed in" do
    click_link "Contact"
    expect(page).to have_content(email)
  end

  scenario "form object is not valid" do
    click_link "Contact"
    click_button "Send Email"
    expect(page).to have_content("Text is too short (minimum is 50 characters) and text can't be blank")
  end

  scenario "form object is valid" do
    click_link "Contact"
    fill_in "Message", with: text
    click_button "Send Email"
    expect(page).to have_content("Your email is sent")
  end

  # If User is not logged in

  scenario "if  non logged user can visit contact page" do
    click_button "Sign out"
    click_link "Contact"
    expect(page).not_to have_content(email)
  end

  scenario "sending email with non logged user if form is not valid" do
    click_button "Sign out"
    click_link "Contact"
    click_button "Send Email"
    expect(page).to have_content("Email is invalid, text is too short (minimum is 50 characters), email can't be blank, and text can't be blank")
  end

  scenario "sending email with non logged user if form is  valid" do
    click_button "Sign out"
    click_link "Contact"
    fill_in "Email address", with: email
    fill_in "Message", with: text
    click_button "Send Email"
    expect(page).to have_content("Your email is sent")
  end
end
