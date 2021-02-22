class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.by_user(current_user.id)
    @first_conversation = @conversations.first
    @messages = @first_conversation.messages
    @message = current_user.messages_sent.build
  end

  def show

  end
end
