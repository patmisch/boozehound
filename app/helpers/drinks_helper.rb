module DrinksHelper
  def show_year_field(category)
    if category.name == 'Wine'
      render partial: 'year_field'
    end
  end

  def last_time_drank(count)
    if count > 0
      render partial: 'last_time_drank'
    end
  end

  def again?(count)
    return count > 0 ? ' Again' : nil
  end
end
