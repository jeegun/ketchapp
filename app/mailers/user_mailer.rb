class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user]

    mail to: @user.email, subject: "Welcome to Ketchup, #{@user.full_name}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirm_ketchup.subject
  #
  def confirm_ketchup
    @user = params[:user]

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite_contact.subject
  #
  def invite_contact
    @contact = params[:contact]

    mail to: @contact.email
  end
end
