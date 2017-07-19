class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  has_many :sent_messages,
    class_name: 'Message',
    foreign_key: 'from_user_id'
  has_many :received_messages,
    class_name: 'Message', 
    foreign_key: 'to_user_id'
  has_many :users_received_from,
    through: :received_messages,
    source: :from_user
  has_many :users_sent_to,
    through: :sent_messages,
    source: :to_user   
end
