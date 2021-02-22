class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages_sent.build message_params
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(Message::MESSAGE_ATTR)
  end
end
