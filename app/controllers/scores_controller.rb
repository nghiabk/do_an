class ScoresController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin, only: [:new, :edit, :create, :update, :destroy]
  
  def index
    @scores = current_user.scores.paginate page: params[:page], per_page: 15
  end

  def create
    @score = Score.new score_params
    if @score.save
      flash[:success] = "Create score is success"
      redirect_to scores_url
    else
      render 'new'
    end
  end

  def new
    @score = Score.new
    # @users = User.all_except(current_user)
  end

  def edit
    @score = Score.find params[:id]
    @users = User.all_except(current_user)
  end

  def update
    @score = Score.find params[:id]
    if @score.update_attributes score_params
      flash[:success] = "Score is update"
      redirect_to scores_url
    else
      render 'edit'
    end
  end

  def destroy
    Score.find(params[:id]).destroy
    flash[:success] = "score is deleted"
    redirect_to scores_url
  end

  private
  def score_params
    params.require(:score).permit :semester, :subject_id, 
    :class_student_id, :course_id
  end
end
