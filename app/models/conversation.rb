class Conversation < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
  has_many :messages, dependent: :destroy

  scope :by_user, ->(user_id) do
    where("sender_id = ? OR receiver_id = ?", user_id, user_id)
  end

  def friend user
    (sender == user) ? receiver : sender
  end
end
