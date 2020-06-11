$(document).ready(function() {
  var chatbox = document.getElementById('chatbox');
  var messages = $('#chatbox');

  if (chatbox) {
    function init() {
      messages.scrollTop(messages[0].scrollHeight);
    }
  }

  window.setTimeout(init, 50);
});
