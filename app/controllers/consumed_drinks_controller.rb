class ConsumedDrinksController < ApplicationController
  before_action :set_consumed_drink, only: [:show, :edit, :update, :destroy]

  # GET /consumed_drinks
  # GET /consumed_drinks.json
  def index
    @consumed_drinks = ConsumedDrink.all
  end

  # GET /consumed_drinks/1
  # GET /consumed_drinks/1.json
  def show
  end

  # GET /consumed_drinks/new
  def new
    @consumed_drink = ConsumedDrink.new
  end

  # GET /consumed_drinks/1/edit
  def edit
  end

  # POST /consumed_drinks
  # POST /consumed_drinks.json
  def create
    @consumed_drink = ConsumedDrink.new(consumed_drink_params)

    respond_to do |format|
      if @consumed_drink.save
        format.html { redirect_to @consumed_drink, notice: 'Consumed drink was successfully created.' }
        format.json { render :show, status: :created, location: @consumed_drink }
      else
        format.html { render :new }
        format.json { render json: @consumed_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumed_drinks/1
  # PATCH/PUT /consumed_drinks/1.json
  def update
    respond_to do |format|
      if @consumed_drink.update(consumed_drink_params)
        format.html { redirect_to @consumed_drink, notice: 'Consumed drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @consumed_drink }
      else
        format.html { render :edit }
        format.json { render json: @consumed_drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumed_drinks/1
  # DELETE /consumed_drinks/1.json
  def destroy
    @consumed_drink.destroy
    respond_to do |format|
      format.html { redirect_to consumed_drinks_url, notice: 'Consumed drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchase_sizes_for_select
    @purchase_sizes = Drink.find(params[:drink_id]).purchase_sizes
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumed_drink
      @consumed_drink = ConsumedDrink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumed_drink_params
      params.require(:consumed_drink).permit(:user_id, :drink_id, :price_paid, :amount_consumed, :next_day_condition)
    end
end
