class ProducersController < ApplicationController
  def search
    @producers = Producer.search_by_name(params[:q])
    render layout: false
  end
end
