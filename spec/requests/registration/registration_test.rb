require "rails_helper"

RSpec.describe "PagesController", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "Registration" do
    it "redirects to wishes_path" do
      get root_path
      expect(response).to redirect_to(wishes_path)
    end

    it "register new user" do
      another_kindergarten = kindergartens(:another_kindergarten)
      expect do
        post wishes_path, params: {
          wish: {
            kindergarten_id: another_kindergarten.id,
            group: Wish.groups[:age3]
          }
        }
      end.to change(Wish, :count).by(1)

      wish = Wish.order(created_at: :asc).last
      expect(wish.user_id).to be_nil
      expect(wish.kindergarten_id).to eq(another_kindergarten.id)
      expect(wish.group).to eq(Wish.groups[:age3])

      kindergarten = kindergartens(:kindergarten)
      expect do
        post wish_wish_kindergartens_path(wish), params: {
          wish_kindergarten: {
            wish_id: wish.id,
            kindergarten_id: kindergarten.id
          }
        }
      end.to change(WishKindergarten, :count).by(1)

      expect(wish.wish_kindergartens.first.kindergarten_id).to eq(kindergarten.id)

      expect do
        post registration_path, params: {
          user: {
            email: "user1@example.com",
            password: "password",
            password_confirmation: "password"
          }
        }
      end.to change(User, :count).by(1)

      user = User.order(created_at: :asc).last
      expect(wish.reload.user_id).to eq(user.id)
    end
  end
end
