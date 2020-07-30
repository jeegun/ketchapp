require "google/apis/people_v1"
require "google/api_client/client_secrets.rb"

class GooglePeopleAPI
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

    begin
      service.authorization = secrets.to_authorization
      service.authorization.grant_type = "refresh_token"

      if current_user.expired?
        service.authorization.refresh!
        current_user.update_attributes(
          access_token: service.authorization.access_token,
          refresh_token: service.authorization.refresh_token,
          expires_at: service.authorization.expires_at.to_i
        )
      end
    rescue => e
      raise e.message
    end
    response = service.list_person_connections(
     'people/me',
      page_size: 500,
      person_fields: ['names', 'emailAddresses', 'phoneNumbers']
    )
    response
  end
end

