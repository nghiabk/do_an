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
    total_credit_1 = 0
    gpa = 0
    temp_score = 0
    temp_credit = 0
    
    @table_scores = TableScore.same params[:total_score][:user_id], params[:total_score][:semester]
    @total_scores = TotalScore.same_user params[:total_score][:user_id]
    @repeat = TotalScore.same params[:total_score][:user_id], params[:total_score][:semester] 
    
    if @repeat.presence
      flash[:success] = "da co roi"
      redirect_to total_scores_url
    elsif @table_scores.blank?
      flash[:success] = "khong co bang diem"
      redirect_to total_scores_url
    elsif
      @table_scores.each do |table_score|
        total_score += table_score.finish_score * table_score.credit
        total_credit_1 += table_score.credit
        total_credit += table_score.credit unless table_score.again == true
        gpa = (total_score / total_credit_1).round(2)
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
end
