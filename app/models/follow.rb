class Follow < ApplicationRecord
  belongs_to :follower, class_name: User
  belongs_to :inverse_follower, class_name: User

  validates :follower, presence: true
  validates :inverse_follower, presence: true
  validates :inverse_follower_id, uniqueness: { scope: :follower_id }

  def followed_by? user
    inverse_follows.where(follower_id: user.id).exists?
  end
end