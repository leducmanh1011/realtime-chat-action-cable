class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  enum status: {unread: 0, read: 1}

  scope :newest, -> {order created_at: :asc}
end