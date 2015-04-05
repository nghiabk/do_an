class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy]

  def index
    if params[:faculty_id].blank?
      @courses = Course.paginate page: params[:page], per_page: 15
    else
      @faculty = Faculty.find params[:faculty_id]
      @courses = @faculty.courses.paginate page: params[:page], per_page: 15
    end
    @activities = current_user.activities
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params
    
    if @course.save
      @score = Score.new subject_id: @course.subject_id, semester: @course.semester,
      credit: @course.subject.credit, course_id: @course.id
      @score.save
      redirect_to courses_url
    else
      render 'new'
    end
  end

 

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:success] = "Course update"
      redirect_to courses_url
    else
      render 'edit'
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course is deleted"
    redirect_to courses_url
  end

  private
  def course_params
    params.require(:course).permit :faculty_id, :subject_id, :start_period,
    :end_period, :class_student_id, :state, :teacher, :semester, :max, :min, 
    :day, scores_attributes: [:id, :semester, :credit]
  end
end