class SubjectsController < ApplicationController
  def index
    @subjects = Subject.paginate page: params[:page], per_page: 15
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      # respond_to do |format|
      #   format.html {redirect_to root_url, notice: "Subject is created"}
      #   format.js
      # end  
      respond_to do |format|
        format.html {redirect_to subjects_url, notice: "Book is created"}
        format.js
      end
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
    flash[:success] = "subject is deleted"
    redirect_to subjects_url
  end

  private
  def subject_params
    params.require(:subject).permit :faculty_id, :name, :count
  end
end
