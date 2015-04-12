class TableScoresController < ApplicationController
  before_action :logged_in_user

  def index
    @table_scores = TableScore.paginate page: params[:page], per_page: 15
    respond_to do |format|
      format.html
      format.csv {send_data @table_scores.to_csv}
      format.xls
    end
  end

  # def new
  #   @table_score = TableScore.new
  #   @users = User.all_except(current_user)
  # end

  def show
    @table_scores = current_user.table_scores
    @total_scores = current_user.total_scores
  end

  # def create
  #   @table_score = TableScore.new params_table_scores
  #   @score = Score.find params[:table_score][:score_id]
  #   @table_score.semester = @score.semester
  #   @table_score.credit = @score.credit
  #   if @table_score.save 
  #     flash[:success] = "create table score is success"
  #     redirect_to root_url
  #   else
  #     render 'new'
  #   end 
  # end

  def edit
    @table_score = TableScore.find params[:id]
  end

  def update
    @table_score = TableScore.find params[:id]
    middle_score = params[:table_score][:middle_score]
    end_score = params[:table_score][:end_score]
    finish_score = calculate middle_score.to_f, end_score.to_f
    @table_score.finish_score = finish_score

    if @table_score.update_attributes params_table_scores
      flash[:success] = "update table score is success"
      redirect_to table_scores_url
    else
      render 'edit'
    end
  end

  private
  def params_table_scores
    params.require(:table_score).permit :middle_score, :end_score, :finish_score
  end
end
