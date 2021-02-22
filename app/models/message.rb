class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  after_create_commit :send_message

  enum status: {unread: 0, read: 1}

  scope :newest, -> {order created_at: :asc}

  MESSAGE_ATTR = [:id, :content, :sender_id,
    :receiver_id, :conversation_id, :status]

  private

  def send_message
    ConversationJob.perform_now self.id
  end
end
