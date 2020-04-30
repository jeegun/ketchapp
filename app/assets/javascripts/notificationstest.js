// // class Notifications {
// //   constructor(notifications)
// //     // ("[data-behavior='notifications']")
// //     // this.setup() if this.notifications.length > 0
// //   }

// const notifications = document.querySelector("[data-behavior='notification-items']")
// console.log(notifications);

// // GET request NEW
// // const setup = fetch("/notifications.json")
// //   .then(response => response.json())
// //   .then((data) => {
// //     console.log(data); // array of objects
// //     console.log(data[0]); // individual object
// //     console.log(data[0].actor); // accessing an element within an object
// //     console.log(data[0].action);
// //   });

// document.getElementById("dropdownMenu1").addEventListener("click", handleSuccess);

// function handleSuccess(data) {
//   // items = data.map(notification => {
//   notifications.insertAdjacentHTML("beforeend", "<a class='dropdown-item' data-behavior='notification-item' data-id='setup.id' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a>")
//   console.log(data);
//   console.log("Success!")
//   }


// //   .remove();


// // POST request OLD

// // const data = { name: "a name", email: "an@email.com" };

// // $.ajax({
// //   url: url,
// //   type: "POST",
// //   data: data,
// //   success: function(data) {
// //     console.log(data);
// //   }
// // });

// // // POST request NEW
// // const data = { name: "a name", email: "an@email.com" };
// // fetch(url, {
// //   method: 'POST',
// //   headers: { "Content-Type": "application/json" },
// //   body: JSON.stringify(data)})
// //    .then(response => response.json())
// //    .then((data) => {
// //      console.log(data);
// //    });

// // // POST request OLD
// //   handleClick: (e) =>
// //     $.ajax(
// //       url: "/notifications/mark_as_read"
// //       datatype: "JSON"
// //       method: "POST"
// //       success: ->
// //         $("[data-behavior='unread-count']").text(0)
// //     )

















// //   setup: ->
// //     $("[data-behavior='notifications-link']").on "click", @handleClick
// //     $.ajax(
// //       url: "/notifications.json"
// //       dataType: "JSON"
// //       method: "GET"
// //       success: @handleSuccess
// //     )










// //   handleSuccess: (data) =>
// //     console.log(data);
// //     if data.length > 0
// //       items = $.map data, (notification) ->
// //         "<a class='dropdown-item' data-behavior='notification-item' data-id='#{notification.id}' href='#{notification.url}'>#{notification.actor} #{notification.action} #{notification.notifiable.type}</a>"
// //       $("[data-behavior='unread-count']").text(items.length)
// //       $("[data-behavior='notification-items']").html(items)
// //     else
// //       $("[data-behavior='notification-items']").html("<a class='dropdown-item' href='#'>See All</a>")
// //       # "<a class='dropdown-item' href='#{notification.all}'>SEE ALL</a>"
// //       # $("[data-behavior='notification-items']").html("<a class='dropdown-item' href='users/current_user/notifications'>See All</a>")
// // jQuery ->
// //   new Notifications
