# 'array!' is a jbuilder helper
json.array! @notifications do |notification|
  # load notifications array for current user and return JSON
  # design of JSON that we want to return:
  json.recipient notification.recipient
  json.actor notification.actor.full_name
  json.action notification.action
  json.notifiable do
    json.type "#{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  # JSON url to link to. anchor links to the request itself and takes us down to the notifiable friend request
  json.url user_friend_requests_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end