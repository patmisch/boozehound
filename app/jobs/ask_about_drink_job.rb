class AskAboutDrinkJob < ActiveJob::Base
  queue_as :drink_questions

  def perform(user, consumed_drink)
    drink = consumed_drink.drink
    puts consumed_drink
    UserMailer.with(user: user, drink: drink, consumed_drink: consumed_drink).amount_consumed_question.deliver_now
  end
end
