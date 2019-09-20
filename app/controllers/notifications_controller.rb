class NotificationsController < ApplicationController
before_action :authenticate_user!
before_action :set_notifications

  def index
    @notifications = Notification.where(recipient: current_user).recent
  end

  def mark_as_read
    # @notifications = Notification.where(recipient: current_user).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end
end