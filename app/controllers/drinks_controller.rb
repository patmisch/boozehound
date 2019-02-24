class DrinksController < ApplicationController
  before_action :authorize_admin, only: [:edit, :update, :destroy]
  before_action :set_drink, only: [:edit, :update, :destroy]

  # GET /drinks
  # GET /drinks.json
  def index
    @drinks = Drink.all
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
    @drink = Drink.includes(:producer, :drink_type).find(params[:id])
    @consumed_drinks = @drink.consumed_drinks.where(user: current_user)
    @last_consumed_drink = @consumed_drinks.last
    @count = @consumed_drinks.count
  end

  # GET /drinks/new
  def new
    @drink = Drink.new
    @categories = DrinkCategory.all
  end

  # GET /drinks/1/edit
  def edit
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @drink = Drink.new(drink_params)
    if drink_params[:producer_id].blank?
      producer = Producer.create(name: params[:producer_text])
      @drink.producer = producer
    end
    
    if drink_params[:drink_type_id].blank?
      drink_type = DrinkType.create(name: params[:drink_type_text], drink_category_id: drink_params[:drink_category_id])
      @drink.drink_type = drink_type
    end
    @categories = DrinkCategory.all
    respond_to do |format|
      if @drink.save
        format.html { redirect_to new_consumed_drink_path(drink_id: @drink), notice: 'Drink was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        puts @drink.errors.first.message
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to drinks_url, notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def type_selected
    @category = DrinkCategory.find(params[:category_id])
    render partial: 'new_drink' 
  end

  def search
    @items = Drink.joins(:producer).search_by_name_and_producer(params[:q])
      .select('drinks.id as id', "CONCAT_WS(' - ', producers_drinks.name, drinks.name, drinks.year) as name")
    if @items.any?
      render partial: params[:partial] || 'shared/dropdown_search'
    else
      render partial: 'add_new_drink'
    end
  end

  def main_search
  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :drink_category_id, :producer_id, :abv, :drink_type_id, :year)
    end
end
