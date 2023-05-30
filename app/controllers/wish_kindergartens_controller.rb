class WishKindergartensController < ApplicationController
  def index
    @kindergartens = Kindergarten.all
    @wish = Wish.find(params[:wish_id])
    @wish_kindergarten = WishKindergarten.new
    @wish_kindergartens = @wish.wish_kindergartens
  end

  def create
    @kindergartens = Kindergarten.order(:name)
    @wish = Wish.find(params[:wish_id])
    @wish_kindergarten = WishKindergarten.new(wish_kindergarten_params)
    @wish_kindergarten.wish = @wish
    @wish_kindergartens = @wish.wish_kindergartens

    if @wish_kindergarten.save
      redirect_to wish_wish_kindergartens_path(@wish), notice: "Uspešno ste dodali vrtić."
    else
      redirect_to wish_wish_kindergartens_path(@wish), notice: "Molimo Vas da unesete željeni vrtić."
    end
  end

  def destroy
    @wish = Wish.find(params[:wish_id])
    @wish_kindergarten = WishKindergarten.find(params[:id])
    @wish_kindergarten.destroy!
    redirect_to wish_wish_kindergartens_path(@wish), notice: "Vrtić je uspešno obrisan."
  end

  private

  def wish_kindergarten_params
    params.require(:wish_kindergarten).permit(:wish_id, :kindergarten_id)
  end
end
