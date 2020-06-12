App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {},

  disconnected: function() {},

  received: function(data) {
    var chatbox = $('#chatbox');
    var message = data['message'];
    var userId = $(chatbox).attr('data-userId');
    var senderId = $(message).attr('data-senderId');

    var messageDiv = document.createElement('div');
    messageDiv.innerHTML = message;
    if (chatbox) {
      if (userId === senderId) {
        messageDiv.classList.add('my-message-bubble');
        messageDiv.classList.add('my-msg');
        var messageOuterDiv = document.createElement('div');
        messageOuterDiv.classList.add('col-8');
        messageOuterDiv.classList.add('offset-4');
        messageOuterDiv.classList.add('d-flex');
        messageOuterDiv.classList.add('justify-content-end');
        messageOuterDiv.appendChild(messageDiv);
      } else {
        messageDiv.classList.add('other-message-bubble');
        messageDiv.classList.add('other-msg');
        var messageOuterDiv = document.createElement('div');
        messageOuterDiv.classList.add('col-8');
        messageOuterDiv.classList.add('d-flex');
        messageOuterDiv.appendChild(messageDiv);
      }
      chatbox.append(messageOuterDiv);
      chatbox.scrollTop(chatbox[0].scrollHeight);
    }
  }
});
