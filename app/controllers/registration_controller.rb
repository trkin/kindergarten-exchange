class RegistrationController < ApplicationController
  def index
    @wish = Wish.find(params[:wish_id])
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @wish = Wish.find params[:wish_id]

    if @user.save
      # Registration successful, update wish_id if present
      @wish.update! user: @user
      sign_in @user
      redirect_to root_path, notice: "Uspešno ste se registrovali!"
    else
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :index, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
