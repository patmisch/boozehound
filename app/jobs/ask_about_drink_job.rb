class AskAboutDrinkJob < ActiveJob::Base
  queue_as :drink_questions

  def perform(consumed_drink)
    drink = consumed_drink.drink
    user = consumed_drink.user
    puts consumed_drink
    UserMailer.with(user: user, drink: drink, consumed_drink: consumed_drink).follow_up.deliver_now
  end
end
