class NotificationSchedulesController < ApplicationController
  before_action :set_notification_schedule, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @notification_schedules = NotificationSchedule.all
    respond_with(@notification_schedules)
  end

  def show
    respond_with(@notification_schedule)
  end

  def new
    @notification_schedule = NotificationSchedule.new
    respond_with(@notification_schedule)
  end

  def edit
  end

  def create
    @notification_schedule = NotificationSchedule.new(notification_schedule_params)
    @notification_schedule.save
    respond_with(@notification_schedule)
  end

  def update
    @notification_schedule.update(notification_schedule_params)
    respond_with(@notification_schedule)
  end

  def destroy
    @notification_schedule.destroy
    respond_with(@notification_schedule)
  end

  private
    def set_notification_schedule
      @notification_schedule = NotificationSchedule.find(params[:id])
    end

    def notification_schedule_params
      params.require(:notification_schedule).permit(:receiver, :means, :notification_id)
    end
end
