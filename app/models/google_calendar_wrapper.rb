require 'google/apis/calendar_v3'
require "google/api_client/client_secrets.rb"

# initializing a constant CALENDAR_ID to grab user's GCAL
CALENDAR_ID = 'primary'

class GoogleCalendarWrapper
  # calls Google API to get user's attributes. access_token, refresh_token,
  # and expires_at are populated upon user creation (see user model)
  # for this method to work, user must have already signed in/authenticated
  # with google
  # code for the methods below repurposed from
  # https://viblo.asia/p/integrating-google-calendar-api-with-rails-5-gAm5yq6D5db
  # and
  # https://www.thegreatcodeadventure.com/using-the-google-api-ruby-client-with-google-calendar-api/
  def self.get_google_calendar_client current_user
    client = Google::Apis::CalendarV3::CalendarService.new
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
      client.authorization = secrets.to_authorization
      client.authorization.grant_type = "refresh_token"

      if current_user.expired?
        client.authorization.refresh!
        current_user.update_attributes(
          access_token: client.authorization.access_token,
          refresh_token: client.authorization.refresh_token,
          expires_at: client.authorization.expires_at.to_i
        )
      end
    rescue => e
      raise e.message
    end
    client
  end

  def self.create(ketchup, user)
    client = get_google_calendar_client user
    event = gcal_get_event ketchup
    event = Google::Apis::CalendarV3::Event.new(event)
    client.insert_event(CALENDAR_ID, event)
  end

  def self.gcal_edit(ketchup, user)
    client = get_google_calendar_client user
    event = gcal_get_event ketchup
    event = Google::Apis::CalendarV3::Event.new(event)
    client.update_event(CALENDAR_ID, event.id, event)
  end

  def self.gcal_delete(event_id, user)
    client = get_google_calendar_client user
    client.delete_event(CALENDAR_ID, event_id)
  end

  def self.gcal_get(event_id, user)
    client = configure_client(current_user)
    client.get_event(CALENDAR_ID, event_id)
  end

  def calendar_id(ketchup)
    response = @client.execute(api_method:
      @service.calendar_list.list)
    calendars = JSON.parse(response.body)
    calendar = calendars["items"].select {|cal|
      cal["id"].downcase == ketchup.calendar_id}
    calendar["id"]
  end

  def self.gcal_get_event ketchup
    event = {
      summary: "Your ketchup with #{ketchup.user.full_name}",
      description: ketchup.message,
      start: Google::Apis::CalendarV3::EventDateTime.new(
        date_time: ketchup.start_date.strftime('%FT%T%z')
      ),
      end: Google::Apis::CalendarV3::EventDateTime.new(
        date_time: ketchup.end_date.strftime('%FT%T%z')
      )
    }
  end
end
