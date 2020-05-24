App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {},

  disconnected: function() {},

  received: function(data) {
    var chatbox = $('#chatbox');
    var message = data['message']

    // message.classList.add('my-message-bubble my-msg');
    chatbox.append(message);
    chatbox.scrollTop(chatbox[0].scrollHeight);
  }
});
