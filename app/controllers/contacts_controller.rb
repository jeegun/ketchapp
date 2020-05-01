class ContactsController < ApplicationController
  before_action :set_contact, only: [:update]

  def update
    if @contact.invited_at.nil?
      @contact.update!(invited_at: Time.zone.now)
      mail = ContactMailer.with(contact: @contact).invite.deliver_now
      redirect_to root_path
    end
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
    authorize @contact
  end

end
