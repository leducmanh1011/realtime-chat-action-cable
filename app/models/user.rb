class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :conversations, class_name: "Conversation", foreign_key: "sender_id"
  has_many :messages_received, class_name: "Message", foreign_key: "receiver_id"
  has_many :messages_sent, class_name: "Message", foreign_key: "sender_id"
end
