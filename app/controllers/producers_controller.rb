class ProducersController < ApplicationController
  def search
    @items = Producer.search_by_name(params[:q])
    render partial: 'shared/dropdown_search'
  end
end
