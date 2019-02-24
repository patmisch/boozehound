class ConsumedDrink < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_size, optional: true
  belongs_to :drink

  def ask_later(hours, minutes)
    in_hours = hours.to_i
    in_minutes = minutes.to_i
    AskAboutDrinkJob.set(wait: (in_hours.hours + in_minutes.minutes))
      .perform_later(self)
  end

end
