# Testing index function

require "rails_helper"

RSpec.describe "PagesController", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "User Dashboard" do
    before do
      sign_in users(:user)
    end

    it "gets requested page" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "creates wish" do
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
      expect(wish.kindergarten_id).to eq(another_kindergarten.id)
      expect(wish.group).to eq(Wish.groups[:age3])
    end

    it "creates wish kindergarten" do
      wish = wishes(:wish)
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
    end
  end
end
