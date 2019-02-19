module ConsumedDrinksHelper
  def created_drink_name(drink)
    drink ? drink.name : ''
  end

  def created_drink_id(drink)
    drink ? drink.id : ''
  end

  def next_day_choices
    [
      ["Ask me later"],
      ["I don't want to share", 0],
      ["1 - Very Bad", 1],
      ["2", 2],
      ["3", 3],
      ["4", 4],
      ["5", 5],
      ["6", 6],
      ["7", 7],
      ["8", 8],
      ["9", 9],
      ["10 - Excellent", 10]
    ]
  end

  def verdict_choices
    [
      ['Ask me later'],
      ['Not a fan', 0],
      ['It was ok', 1],
      ['Excellent', 2],
    ]
  end
end
