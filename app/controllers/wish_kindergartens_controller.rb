class WishKindergartensController < ApplicationController
  def index
    @wish = Wish.find(params[:wish_id])
    @wish_kindergarten = WishKindergarten.new
    @wish_kindergartens = @wish.wish_kindergartens
  end

  def create
    @kindergartens = Kindergarten.order(:name)
    respond_to do |format|
      format.html
      format.json { render json: @kindergartens }
    end
    @wish = Wish.find(params[:wish_id])
    @wish_kindergarten = WishKindergarten.new(wish_kindergarten_params)
    @wish_kindergarten.wish = @wish

    if @wish_kindergarten.save
      redirect_to wish_wish_kindergartens_path, notice: "Wish kindergarten added successfully."
    else
      redirect_to wish_wish_kindergarten_path, notice: "Please enter a valid kindergarten."
    end
  end

  def destroy
    @wish_kindergarten = WishKindergarten.find(params[:wish_id], kindergarten_id: params[:kindergarten_id])

    if @wish_kindergarten.nil?
      redirect_to wish_wish_kindergartens_path, notice: "Wish kindergarten not found."
    else
      @wish_kindergarten.destroy
      redirect_to wish_wish_kindergartens_path, notice: "Wish kindergarten deleted successfully."
    end
  end

  private

  def wish_kindergarten_params
    params.require(:wish_kindergarten).permit(:wish_id, :kindergarten_id)
  end
end
