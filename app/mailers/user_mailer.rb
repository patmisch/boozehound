class UserMailer < ApplicationMailer
  def amount_consumed_question
    @user = params[:user]
    @drink = params[:drink]
    @consumed_drink = params[:consumed_drink]
    mail(to: @user.email, subject: "How much #{@drink.name} did you drink?")
  end
end
