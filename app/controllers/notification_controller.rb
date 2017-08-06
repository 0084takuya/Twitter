class NotificationController < ApplicationController
  def index
    @notifications = Notification.where(to_user_id: current_user.id)
    #eager_load(user: :inverse_follows).where(follows: { follower_id: current_user.id})
    writer_id = @notifications.map(&:from_user_id).uniq
    @screen_name = Hash[User.select(:id, :screen_name).where(id: writer_id).map { |user| [user.id, user.screen_name] }]
    @name = Hash[User.select(:id, :name).where(id: writer_id).map { |user| [user.id, user.name] }]
  end

  def show
  end

  def delete
  end
end
