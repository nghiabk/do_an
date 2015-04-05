class SubjectsController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy]

  def index
    @subjects = Subject.paginate page: params[:page], per_page: 15
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      redirect_to subjects_url
      flash[:success] = "Create subject is success"
    else
      render 'new'
    end
  end

  def new
    @subject = Subject.new
  end

  def edit
    @subject = Subject.find params[:id]
  end

  def update
    @subject = Subject.find params[:id]
    if @subject.update_attributes subject_params
      flash[:success] = "Subject update"
      redirect_to subjects_url
    else
      render 'edit'
    end
  end

  def destroy
    Subject.find(params[:id]).destroy
    @subjects = Subject.all
    respond_to do |format|
      format.html 
      format.js
    end
  end

  private
  def subject_params
    params.require(:subject).permit :faculty_id, :name, :credit
  end
end
