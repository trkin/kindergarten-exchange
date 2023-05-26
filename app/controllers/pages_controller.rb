class PagesController < ApplicationController
  before_action :redirect_visitors

  def sign_in_development
    render plain: "only_development" and return unless Rails.env.development?

    user = User.find params[:id]
    sign_in :user, user, bypass: true
    redirect_to params[:redirect_to] || root_path
  end

  def contact_show
    @contact_form = ContactForm.new(
      email: current_user&.email
    )
  end

  def contact_create
    @contact_form = ContactForm.new(contact_params)

    if @contact_form.valid?
      ContactMailer.contact_email(@contact_form).deliver_now
      redirect_to contact_path, notice: "Your message was sent successfully."
    else
      redirect_to contact_path, notice: "Please fill in all required fields."
    end
  end

  private

  def contact_params
    params.require(:contact_form).permit(:name, :email, :question)
  end

  def wish_params
    params.require(:wish).permit(:group, :kindergarten_id).tap do |wish_params|
      wish_params[:user_id] = current_user&.id

      wish_params[:group] = Wish.groups.keys[wish_params[:group].to_i] if wish_params[:group].present?
    end
  end

  def wish_kindergarten_params
    params.require(:wish_kindergarten).permit(:wish_id, :kindergarten_id)
  end

  def redirect_visitors
    redirect_to wishes_path unless user_signed_in?
  end
end
