class ActivitiesController < ApplicationController
  def create
    @course = Course.find params[:id]
    @activity = Activity.new user: current_user, course: @course
    @activity.save
    redirect_to activities_show_url
  end

  def show
    @activities = current_user.activities
  end
end
