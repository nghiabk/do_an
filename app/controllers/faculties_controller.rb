class FacultiesController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy]
  
  def index
    @faculties = Faculty.paginate page: params[:page], per_page: 15
  end

  def create
    @faculty = Faculty.new faculty_params
    if @faculty.save
      flash[:success] = "create faculty is success"
      redirect_to faculties_url
    else
      render 'new'
    end
  end

  def new
    @faculty = Faculty.new
  end

  def edit
    @faculty = Faculty.find params[:id]
  end

  def update
    @faculty = Faculty.find params[:id]
    if @faculty.update_attributes faculty_params
      flash[:success] = "Faculty update"
      redirect_to faculties_url
    else
      render 'edit'
    end
  end

  def destroy
    Faculty.find(params[:id]).destroy
    flash[:success] = "Faculty is deleted"
    redirect_to faculties_url
  end

  private
  def faculty_params
    params.require(:faculty).permit :name
  end
end
