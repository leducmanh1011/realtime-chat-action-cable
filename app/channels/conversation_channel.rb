class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
