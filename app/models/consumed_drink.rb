class ConsumedDrink < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_size, optional: true
  belongs_to :drink

  VERDICT_NAME = {
    -1 => 'Ask me later',
    0 => 'No Good',
    1 => 'Okay',
    2 => 'Excellent',
  }

  def ask_later(hours, minutes)
    in_hours = hours.to_i
    in_minutes = minutes.to_i
    AskAboutDrinkJob.set(wait: (in_hours.hours + in_minutes.minutes))
      .perform_later(self)
  end

end
