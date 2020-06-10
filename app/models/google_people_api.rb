require "google/apis/people_v1"
require "google/api_client/client_secrets.rb"

class GooglePeopleAPI
  # OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
  # TOKEN_PATH = "token.yaml".freeze
  # SCOPE = Google::Apis::PeopleV1::AUTH_CONTACTS_READONLY

  # def self.authorize
  #   client_id = ENV["GOOGLE_CLIENT_ID"]
  #   token_store = Google::Auth::Stores::FileTokenStore.new url: "https://oauth2.googleapis.com/token"
  #   authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
  #   user_id = "default"
  #   credentials = authorizer.get_credentials user_id
  #   if credentials.nil?
  #     url = authorizer.get_authorization_url base_url: OOB_URI
  #     puts "Open the following URL in the browser and enter the " \
  #          "resulting code after authorization:\n" + url
  #     code = gets
  #     credentials = authorizer.get_and_store_credentials_from_code(
  #       user_id: user_id, code: code, base_url: OOB_URI
  #     )
  #   end
  #   credentials
  # end

  def self.get_google_connection_list current_user
    service = Google::Apis::PeopleV1::PeopleServiceService.new

    return unless (current_user.present? && current_user.access_token.present? && current_user.refresh_token.present?)

    secrets = Google::APIClient::ClientSecrets.new({
      "web" => {
        "access_token" => current_user.access_token,
        "refresh_token" => current_user.refresh_token,
        "client_id" => ENV["GOOGLE_CLIENT_ID"],
        "client_secret" => ENV["GOOGLE_CLIENT_SECRET"]
      }
    })


    service.authorization = secrets.to_authorization
    #   service.authorization.grant_type = "refresh_token"

    #   if current_user.expired?
    #     service.authorization.refresh!
    #     current_user.update_attributes(
    #       access_token: service.authorization.access_token,
    #       refresh_token: service.authorization.refresh_token,
    #       expires_at: service.authorization.expires_at.to_i
    #     )
    #   end
    # rescue => e
    #   raise e.message
    # end
    response = service.list_person_connections(
     'people/me',
      page_size: 50,
      person_fields: ['names', 'emailAddresses', 'phoneNumbers']
    )
    response
  end
end

