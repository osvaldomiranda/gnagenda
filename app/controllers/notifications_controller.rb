class NotificationsController < ApplicationController
  before_filter :authenticate_user! 
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @notifications = Notification.all
    respond_with(@notifications)
  end

  def show
    respond_with(@notification)
  end

  def new
    @notification = Notification.new
    respond_with(@notification)
  end

  def edit
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.save
    respond_with(@notification)
  end

  def update
    @notification.update(notification_params)
    respond_with(@notification)
  end

  def destroy
    @notification.destroy
    respond_with(@notification)
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:body, :body_textmsg, :event, :delay, :previous, :center_id)
    end
end
