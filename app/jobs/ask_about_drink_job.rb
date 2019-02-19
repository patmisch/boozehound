class AskAboutDrinkJob < ActiveJob::Base
  queue_as :drink_questions

  def perform(user, consumed_drink)
    drink = consumed_drink.drink
    puts consumed_drink
    UserMailer.with(user: user, drink: drink, consumed_drink: consumed_drink).follow_up.deliver_now
  end
end
