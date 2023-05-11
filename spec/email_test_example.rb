RSpec.describe LocationMailer do
  let(:location) { create :location }

  before { location }

  describe 'new_location_user_request_to_admin' do
    let(:admin_location_user) { create :location_user, location: location, user_type: Constant.LOCATION_USER_TYPES[:ADMIN], enabled: true }
    let(:not_admin_location_user) { create :location_user, location: location, user_type: Constant.LOCATION_USER_TYPES[:MANAGEMENT_STAFF], enabled: true }
    let(:not_enabled_location_user) { create :location_user, location: location, user_type: Constant.LOCATION_USER_TYPES[:ADMIN], enabled: false }
    let(:other_location_location_user) do
      other_location = create :location, operator: location.operator, subdomain: 'othersubdomain'
      create :location_user, location: other_location, enabled: true
    end
    let(:email) { LocationMailer.new_location_user_request_to_admin location, admin_location_user.user.email }

    before do
      admin_location_user
      not_admin_location_user
      not_enabled_location_user
      other_location_location_user
    end

    it 'proper subject and recipients' do
      expect(email.subject).to eq "(#{location.short_name}) New User Request from #{admin_location_user.user.email}"
      expect(email.to).to eq [admin_location_user.user.email]
    end

    it 'use operator email when there are no admins' do
      admin_location_user.user_type = Constant.LOCATION_USER_TYPES[:SALES_STAFF]
      admin_location_user.save validate: false
      expect(email.to).to eq [location.operator.email1]
    end
  end

  describe 'location_migrated_to_xceednet' do
    let(:email) { LocationMailer.location_migrated_to_xceednet location }

    it 'proper #subject and recipients' do
      expect(email.subject).to eq "(#{location.short_name}), Your dashboard is migrated to #{location.subdomain}.xceednet.com.!!!"
      expect(email.to).to include location.email1
    end
  end

  describe 'create_user_and_send_password' do
    let(:user) { create :user }
    let(:password) { '12345678' }
    let(:email) { LocationMailer.create_user_and_send_password location, user, password }

    it 'proper #subject and recipients' do
      expect(email.subject).to eq "(#{location.short_name}) Welcome!!!"
      expect(email.to).to include user.email
    end

    it 'renders username and password' do
      expect(email.body).to include user.email
      expect(email.body).to include password
    end
  end

  describe 'new_user_added' do
    let(:user) { create :user }
    let(:email) { LocationMailer.new_user_added location, user }

    it 'proper #subject and recipients' do
      expect(email.subject).to eq "(#{location.short_name}) Welcome!!!"
      expect(email.to).to eq [user.email]
    end
  end

  describe 'send_test_email' do
    let(:email_address) { 'my@email.com' }
    let(:email) { LocationMailer.send_test_email location, email_address }

    it 'proper #subject and recipients' do
      expect(email.subject).to eq 'Test email for my smtp server'
      expect(email.to).to eq [email_address]
    end
  end
end
