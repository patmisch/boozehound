include Pagy::Backend

class ConsumedDrinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_consumed_drink, only: 
    [:show, :edit, :update, :destroy, :follow_up, :next_day_condition, :ask_later]
  before_action :handle_from_saved_drink, only: [:new, :create, :edit]

  # GET /consumed_drinks
  # GET /consumed_drinks.json
  def index
    @pagy, @consumed_drinks = pagy(ConsumedDrink.a_users_consumed_drinks(current_user), items: 10)
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
    @consumed_drink.user = current_user

    respond_to do |format|
      if @consumed_drink.save
        format.html { redirect_to follow_up_consumed_drink_path(@consumed_drink),
          notice: 'Got it. Now answer the questions below. If you have not had any
                    of your drink yet, you can always select "Ask Me Later" and we will
                   remind you to finish your answers later.' }
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
        if params[:asklater] == 'true'
          @consumed_drink.ask_later(params[:ask_later_hours], params[:ask_later_minutes])
        end
        format.html { redirect_to consumed_drinks_path, notice: 'Your drinking experience has been saved successfully.' }
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
    render layout: false
  end

  def follow_up
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumed_drink
      @consumed_drink = ConsumedDrink.find(params[:id])
    end

    def handle_from_saved_drink
      @drink = Drink.includes(:purchase_sizes).find_by_id(params[:drink_id])
      @purchase_sizes = @drink ? @drink.purchase_sizes : []
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumed_drink_params
      params.require(:consumed_drink).permit(:user_id, :drink_id, :price_paid,
        :amount_consumed, :next_day_condition, :purchase_size_id, :verdict, :notes)
    end

end
