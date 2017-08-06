class Message < ApplicationRecord

  validates :user, presence: true
  validates :message, presence: true, length: { in: 1..140}

  default_scope -> { order(created_at: :desc) }

end
