module ConsumedDrinksHelper
  def created_drink_name(drink)
    drink ? drink.name : ''
  end

  def created_drink_id(drink)
    drink ? drink.id : ''
  end
end
