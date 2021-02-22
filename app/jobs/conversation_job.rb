class ConversationJob < ApplicationJob
  queue_as :default

  def perform message_id
    message = Message.find message_id
    message = message.as_json
    ConversationChannel.broadcast_to message["receiver_id"], message: message
  end
end
