class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      @user.access_token = auth.credentials.token
      @user.expires_at = auth.credentials.expires_at
      @user.refresh_token = auth.credentials.refresh_token
      @user.save!
      # for testing purpose
      if @user.contacts.empty?
        Contact.create!(user_id: @user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 009', email: 'fanny@gmail.com')
        Contact.create!(user_id: @user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 007', email: 'valerie@gmail.com')
        Contact.create!(user_id: @user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 008', email: 'claire@gmail.com')
        Contact.create!(user_id: @user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone_number: '000 000 012', email: 'juan@gmail.com')
        Connection.create!(connection_sender_id: 9, connection_receiver_id: @user.id)
        Connection.create!(connection_sender_id: @user.id, connection_receiver_id: 12)
      end
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
