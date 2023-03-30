require "rails_helper"

RSpec.describe User, type: :model do
  describe "email, password validation" do
    subject { build(:user) }

    context "when valid email" do
      let(:email) { Faker::Internet.email }
      it { should have_db_column(:email) }
      it { should have_db_index(:email).unique }
      it { should validate_presence_of(:email) }
      it { should allow_value(email).for(:email) }
    end
    context "when valid password" do
      let(:password) { Faker::Internet.password }
      it { should validate_presence_of(:password) }
      it { should allow_value(password).for(:password) }
    end
  end
end
