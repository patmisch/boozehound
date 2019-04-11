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

  def self.a_users_consumed_drinks(user)
    includes(:purchase_size, drink: [:producer, :drink_category])
    .where(user: user)
    .order(created_at: :desc)
  end

end
