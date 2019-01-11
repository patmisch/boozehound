class DrinkCategoriesController < ApplicationController
  before_action :set_drink_category, only: [:show, :edit, :update, :destroy]

  # GET /drink_categories
  # GET /drink_categories.json
  def index
    @drink_categories = DrinkCategory.all
  end

  # GET /drink_categories/1
  # GET /drink_categories/1.json
  def show
  end

  # GET /drink_categories/new
  def new
    @drink_category = DrinkCategory.new
  end

  # GET /drink_categories/1/edit
  def edit
  end

  # POST /drink_categories
  # POST /drink_categories.json
  def create
    @drink_category = DrinkCategory.new(drink_category_params)

    respond_to do |format|
      if @drink_category.save
        format.html { redirect_to @drink_category, notice: 'Drink category was successfully created.' }
        format.json { render :show, status: :created, location: @drink_category }
      else
        format.html { render :new }
        format.json { render json: @drink_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drink_categories/1
  # PATCH/PUT /drink_categories/1.json
  def update
    respond_to do |format|
      if @drink_category.update(drink_category_params)
        format.html { redirect_to @drink_category, notice: 'Drink category was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink_category }
      else
        format.html { render :edit }
        format.json { render json: @drink_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drink_categories/1
  # DELETE /drink_categories/1.json
  def destroy
    @drink_category.destroy
    respond_to do |format|
      format.html { redirect_to drink_categories_url, notice: 'Drink category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink_category
      @drink_category = DrinkCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_category_params
      params.require(:drink_category).permit(:name)
    end
end
