class WishesController < ApplicationController
  before_action :set_wish, only: [:show, :edit, :update, :destroy]

  # GET /wishes or /wishes.json
  def index
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
    @wish = Wish.new(wish_params)
    @wish.user_id = current_user&.id

    respond_to do |format|
      if @wish.save
        format.html { redirect_to wish_wish_kindergartens_path(@wish), notice: "Wish was successfully created." }
        format.json { render :show, status: :created, location: @wish }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
        return
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
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Wish was successfully destroyed." }
      format.json { head :no_content }
    end
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
      wish_params[:group] = Wish.groups.keys[wish_params[:group].to_i] if wish_params[:group].present?
    end
  end

  private
end
