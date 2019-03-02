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

  def verdict_display(hash)
    if hash.count == 1
      modifier = hash[hash.keys.first] > 1 ? 'always' : ''
    elsif hash.count > 0
      modifier = 'usually';
    else
      return nil
    end
    render 'had_it_once',
      verdict: ConsumedDrink::VERDICT_NAME[hash.keys.first],
      verdict_key: hash.keys.first,
      modifier: modifier
  end
end
