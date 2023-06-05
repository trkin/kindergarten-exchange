class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]

  # GET /wishes or /wishes.json
  def index
    @kindergartens = Kindergarten.all
    @wish = Wish.new
  end

  # GET /wishes/1 or /wishes/1.json
  def show
  end

  # GET /wishes/new
  def new
    @wish = Wish.new
  end

  # GET /wishes/1/edit
  def edit
  end

  # POST /wishes or /wishes.json
  def create
    @kindergartens = Kindergarten.order(:name)
    @wish = Wish.new(wish_params)
    @wish.user_id = current_user&.id

    respond_to do |format|
      if @wish.save
        format.html { redirect_to wish_wish_kindergartens_path(@wish) }
        format.json { render :index, status: :created, location: @wish }
      else
        flash.now[:alert] = @wish.errors.full_messages.join(", ")
        render :index, status: :unprocessable_entity
        # format.json { render json: @wish.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /wishes/1 or /wishes/1.json
  def update
    respond_to do |format|
      if @wish.update(wish_params)
        format.html { redirect_to wishes_url(@wish), notice: "Wish was successfully updated." }
        format.json { render :show, status: :ok, location: @wish }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishes/1 or /wishes/1.json
  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy!

    flash[:notice] = "Ponuda je uspešno obrisana."
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wish
    @wish = Wish.find(params[:id])
  end

  private

  def wish_params
    params.require(:wish).permit(:group, :kindergarten_id).tap do |wish_params|
      wish_params[:user_id] = current_user&.id
    end
  end
end
