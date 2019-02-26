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

  def amount_question_phrasing(consumed_drink)
    if consumed_drink.purchase_size
      name = consumed_drink.purchase_size.single_serving_name
    else
      name = consumed_drink.drink.drink_category.single_drink_name
    end
    return name.pluralize
  end

  def full_name(consumed_drink)
    drink = consumed_drink.drink
    return "#{drink.producer.name} - #{drink.name}"
  end

  def verdict_color(consumed_drink)
    case consumed_drink.verdict
    when 0
      'danger'
    when 1
      'warning'
    when 2
      'success'
    else
      'dark'
    end
  end

  def amount_string(consumed_drink)
    if consumed_drink.purchase_size
      return pluralize(consumed_drink.amount_consumed, consumed_drink.purchase_size.single_serving_name) 
    else
      return pluralize(consumed_drink.amount_consumed, consumed_drink.drink.drink_category.single_drink_name)
    end
  end
end
