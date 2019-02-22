class DrinkTypesController < ApplicationController
  def search
    @items = DrinkType.search_by_name(params[:q]).where(drink_category: params[:category])
    render partial: 'shared/dropdown_search'
  end
end