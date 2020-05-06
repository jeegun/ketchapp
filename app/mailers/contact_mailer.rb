class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.invite.subject
  #
  def invite
    @contact = params[:contact]

    mail to: @contact.email, subject: "#{@contact.user.full_name} has invited you to Ketchup"
  end
end
