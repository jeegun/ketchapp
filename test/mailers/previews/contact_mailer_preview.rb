# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/invite
  def invite
    contact = Contact.find(8)
    ContactMailer.with(contact: contact).invite
  end

end
