# 'array!' is a jbuilder helper
json.array! @notifications do |notification|
  # load notifications array for current user and return JSON
  # design of JSON that we want to return:
  json.id notification.id
  json.recipient notification.recipient
  json.actor notification.actor.full_name
  json.action notification.action
  json.notifiable do
    json.type "#{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.all user_notifications_path(notification.notifiable)
  # JSON url to link to. anchor links to the request itself and takes us down to the notifiable friend request
  if notification.notifiable_type == "Friendship" || notification.notifiable_type == "FriendRequest"
    json.url user_friends_path(notification.recipient)
  elsif notification.notifiable_type == "Ketchup"
    json.url user_ketchups_path(notification.recipient)
  end
    # user_ketchups_path(notification.notifiable, anchor: dom_id(notification.notifiable))
end
