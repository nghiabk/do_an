class ClassStudentsController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy]

  def index
    @class_students = ClassStudent.paginate page: params[:page], per_page: 15
  end

  def create
    @class_student = ClassStudent.new class_student_params
    if @class_student.save
      flash[:success] = "Create class is success"
      redirect_to class_students_url
    else
      render 'new'
    end
  end

  def new
    @class_student = ClassStudent.new
  end

  def edit
    @class_student = ClassStudent.find params[:id]
  end

  def show
  end

  def update
    @class_student = ClassStudent.find params[:id]
    if @class_student.update_attributes class_student_params
      flash[:success] = "student class updated"
      redirect_to class_students_url
    else
      render 'edit'
    end
  end

  def destroy
    ClassStudent.find(params[:id]).destroy
    flash[:success] = "student class is deleted"
    redirect_to class_students_url
  end

  private
  def class_student_params
    params.require(:class_student).permit  :faculty_id, :name, :specialized, :count, :start_year, :end_year
  end
end
