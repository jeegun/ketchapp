class KetchupMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ketchup_mailer.confirm_ketchup_creator.subject
  #
  def confirm_ketchup_creator
    @ketchup = params[:ketchup]

    mail to: @ketchup.trip.user.email, subject: "Your ketchup with #{@ketchup.user.full_name} has been set"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ketchup_mailer.confirm_ketchup_receiver.subject
  #
  def confirm_ketchup_receiver
    @ketchup = params[:ketchup]

    mail to: @ketchup.user.email, subject: "Your ketchup with #{@ketchup.trip.user.full_name} has been set"
  end
end
