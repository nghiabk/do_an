class ActivitiesController < ApplicationController
  before_action :verify_user, only: [:create, :destroy]
  
  def show
    @activities = current_user.activities
  end

  def create
    @course = Course.find params[:id]
    @sum = current_user.activities
    index = 0
    credit = @sum.sum(:credit) + @course.subject.credit
    @activity = Activity.same_time(current_user, @course)

    @activity.each do |activity|
      if activity.start_period < @course.end_period && activity.end_period >= @course.end_period 
        index += 1
      elsif activity.start_period <= @course.start_period && activity.end_period > @course.start_period
        index += 1
      elsif activity.start_period >= @course.start_period && activity.end_period <= @course.end_period
        index += 1
      # elsif activity.start_period < @course.end_period && activity.end_period >= @course.end_period
      #   index += 1
      end
    end

    if credit > 10 && current_user.discipline.level == 3
      flash[:danger] = "Ban da dang qua 10 tin chi"
      redirect_to courses_url

    elsif credit > 12 && current_user.discipline.level == 2
      flash[:danger] = "Ban da dang qua 12 tin chi"
      redirect_to courses_url
    
    elsif credit > 14 && current_user.discipline.level == 1
      flash[:danger] = "Ban da dang qua 14 tin chi"
      redirect_to courses_url
    
    elsif credit > 24 && current_user.discipline.level == 0
      flash[:danger] = "Ban da dang qua 24 tin chi"
      redirect_to courses_url
    
    elsif Activity.is_repeat(current_user, @course).presence
      flash[:danger] = "Ban da dang ky lop roi"
      redirect_to courses_url
    
    elsif @course.is_max?
      flash[:danger] = "Lop da day"
      redirect_to courses_url
    
    elsif @course.is_finish?
      flash[:danger] = "Lop da ket thuc dang ky"
      redirect_to courses_url
    
    elsif index > 0
      flash[:danger] = "Ban da trung thoi khoa bieu"
      redirect_to courses_url
    
    else
      @course.increase
      @course.update_attribute :count, @course.count
      @activity = Activity.new user: current_user, course: @course, 
      subject_id: @course.subject_id, semester: @course.semester,
      end_period: @course.end_period, start_period: @course.start_period,
      credit: @course.subject.credit, day: @course.day
      if Activity.find_by subject_id: @course.subject_id, user_id: current_user
        @activity.again = "true"
      else
        @activity.again = "false" 
      end
    
      @activity.save
      @score = Score.find_by course_id: @course
      @table_score = TableScore.new user: current_user, score: @score, again: @activity.again,
      semester: @course.semester, credit: @course.subject.credit, activity: @activity
      @table_score.save
      flash[:success] = "Ban da dang ky thanh cong"
      redirect_to courses_url
    end
  end

  def destroy
    @activity = Activity.find params[:id]
    
    if @activity.course.state?
      @activity.course.crease
      @activity.course.update_attribute :count, @activity.course.count
      @activity.destroy
      respond_to do |format|
        format.html 
        format.js
      end
    else
      flash[:danger] = "lop da het han dieu chinh"
      redirect_to courses_url
    end
  end
end
