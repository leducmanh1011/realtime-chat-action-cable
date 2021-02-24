import consumer from "./consumer"

const conversationChannel = consumer.subscriptions.create("ConversationChannel", {
  connected() {
    console.log('Conversations connected')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('<li class="replies"><img src="'+ getImg(data.message.sender_id) +'" alt="" /><p>' + data.message.content + '</p></li>').appendTo($('.messages ul'));
  }
});

export default conversationChannel;
