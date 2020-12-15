class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @conversations = Conversation.by_user(current_user.id)
    @first_conversation = @conversations.first
  end

  def show

  end
end
