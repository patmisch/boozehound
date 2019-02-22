module DrinksHelper
  def show_year_field(category)
    if category.name == 'Wine'
      render partial: 'year_field'
    end
  end
end
