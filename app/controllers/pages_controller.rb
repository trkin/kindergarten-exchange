class PagesController < ApplicationController
  def index
  end

  def sign_in_development
    render plain: "only_development" and return unless Rails.env.development?

    user = User.find params[:id]
    sign_in :user, user, bypass: true
    redirect_to params[:redirect_to] || root_path
  end

  def select_kindergarten
    redirect_to pages_step1_path
  end

  def step1
  end

  def step2
  end

  def step1_post
    redirect_to pages_step2_path
  end

  def step2_post
  end
end
