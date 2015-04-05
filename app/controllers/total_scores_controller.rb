class TotalScoresController < ApplicationController
  def index
    @total_scores = TotalScore.all 
  end

  def new
    @total_score = TotalScore.new
    @users = User.all_except current_user
  end

  def create
    total_score = 0
    total_credit = 0
    gpa = 0
    temp_score = 0
    temp_credit = 0
    
    @table_scores = TableScore.same params[:total_score][:user_id], params[:total_score][:semester]
    @total_scores = TotalScore.same_user params[:total_score][:user_id]
    @repeat = TotalScore.same params[:total_score][:user_id], params[:total_score][:semester] 
    
    if @repeat.presence
      flash[:success] = "da co roi"
      redirect_to total_scores_url
    else
      @table_scores.each do |table_score|
        total_score += table_score.finish_score * table_score.credit
        total_credit += table_score.credit
        gpa = (total_score / total_credit).round(2)
      end
      @total_scores.each do |total_score|
        temp_score += total_score.semester_score
        temp_credit += total_score.semester_credit 
      end
      temp_score += total_score
      temp_credit += total_credit
      cpa = (temp_score / temp_credit).round(2)
      @total_score = TotalScore.new semester: params[:total_score][:semester],
      user_id: params[:total_score][:user_id], gpa: gpa, semester_credit: total_credit,
      semester_score: total_score, cpa: cpa
      @total_score.save
      redirect_to total_scores_url
    end
  end

  def edit
    @total_score = TotalScore.find params[:id]
    @users = User.all_except current_user
  end

  def update
    total_score = 0
    total_credit = 0
    gpa = 0
    temp_score = 0
    temp_credit = 0
    
    @table_scores = TableScore.same params[:total_score][:user_id], params[:total_score][:semester]
    @total_scores = TotalScore.same_user params[:total_score][:user_id]

    @table_scores.each do |table_score|
      total_score += table_score.finish_score * table_score.credit
      total_credit += table_score.credit
      gpa = (total_score / total_credit).round(2)
    end

    @total_scores.each do |total_score|
      temp_score += total_score.semester_score
      temp_credit += total_score.semester_credit 
    end

    temp_score += total_score
    temp_credit += total_credit
    cpa = (temp_score / temp_credit).round(2)


    @total_score = TotalScore.find params[:id]
    @total_score.semester = params[:total_score][:semester]
    @total_score.user_id = params[:total_score][:user_id]
    @total_score.gpa = gpa
    @total_score.cpa = cpa
    @total_score.semester_credit = total_credit
    @total_score.semester_score = total_score
   
    # @total_score = TotalScore.new semester: params[:total_score][:semester],
    # user_id: params[:total_score][:user_id], gpa: gpa, semester_credit: total_credit,
    # semester_score: total_score, cpa: cpa
    @total_score.update_attributes total_score_params
    redirect_to total_scores_url
  end

  private

  def total_score_params
    params.require(:total_score).permit :semester, :semester_credit, :semester_score, :user_id, :cpa, :gpa
  end
end
