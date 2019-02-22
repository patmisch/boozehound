module ConsumedDrinksHelper
  def created_drink_name(drink)
    drink ? drink.name : ''
  end

  def created_drink_id(drink)
    drink ? drink.id : ''
  end

  def next_day_choices
    [
      ["Ask me later", -1],
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
      ['Ask me later', -1],
      ['Not a fan', 0],
      ['It was ok', 1],
      ['Excellent', 2],
    ]
  end

  def amount_choices
    [
      ['Ask me later', -1],
      ["Doesn't matter", nil],
    ] + [*1..100]
  end

  def amount_question_phrasing(drink)
    if drink.purchase_size
      name = drink.purchase_size.single_serving_name
    else
      name = drink.drink_category.single_drink_name
    end
    return name.pluralize
  end
end
