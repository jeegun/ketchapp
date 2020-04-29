class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")
    @setup() if @notifications.length > 0

  setup: ->
    $("[data-behavior='notification-item']").on "click", @handleClick
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      datatype: "JSON"
      method: "POST"
      success: ->
        $("[data-behavior='unread-count']").text(0)
    )
  handleSuccess: (data) =>
    console.log(data);
    if data.length > 0
      items = $.map data, (notification) ->
        "<a class='dropdown-item' data-behavior='notification-item' data-id='#{notification.id}' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a>"
      $("[data-behavior='unread-count']").text(items.length)
      $("[data-behavior='notification-items']").html(items)
    else
      $("[data-behavior='notification-items']").html("<a class='dropdown-item' href='#'>See All</a>")
      # "<a class='dropdown-item' href='#{notification.all}'>SEE ALL</a>"
      # $("[data-behavior='notification-items']").html("<a class='dropdown-item' href='users/current_user/notifications'>See All</a>")
jQuery ->
  new Notifications
