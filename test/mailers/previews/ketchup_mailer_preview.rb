# Preview all emails at http://localhost:3000/rails/mailers/ketchup_mailer
class KetchupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ketchup_mailer/confirm_ketchup_creator
  def confirm_ketchup_creator
    ketchup = Ketchup.find(1)
    KetchupMailer.with(ketchup: ketchup).confirm_ketchup_creator
  end

  # Preview this email at http://localhost:3000/rails/mailers/ketchup_mailer/confirm_ketchup_receiver
  def confirm_ketchup_receiver
    ketchup = Ketchup.find(1)
    KetchupMailer.with(ketchup: ketchup).confirm_ketchup_receiver
  end

end
