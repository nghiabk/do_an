class FeesController < ApplicationController
  before_action :logged_in_user

  def index
    @fees = Fee.all
    respond_to do |format|
      format.html
      format.csv { send_data @fees.to_csv }
      format.xls 
    end
  end

  def show
    @fees = current_user.fees
  end
  
  def new
    @fee = Fee.new
    @users = User.all_except(current_user)
  end

  def create
    total_credit = Activity.not_again(params[:fee][:user_id], params[:fee][:semester]).sum :credit
    total_credit_again = Activity.again(params[:fee][:user_id], params[:fee][:semester]).sum :credit
    total_money = money_fee total_credit, total_credit_again
    
    if Fee.where(user_id: params[:fee][:user_id], semester: params[:fee][:semester]).presence
      flash[:danger] = "hoc phi da duoc tinh"
      redirect_to fees_url
    else
      @fee = Fee.new fee_params
      @fee.total_money = total_money
      @fee.total_credit = total_credit + total_credit_again
      @fee.save
      redirect_to fees_url
    end
  end
  # def edit
  #   @fee = Fee.find params[:id]
  #   @users = User.all_except(current_user)
  # end

  # def update
  #   @fee = Fee.find params[:id]
  #   total_credit = Activity.not_again(params[:fee][:user_id], params[:fee][:semester]).sum :credit
  #   total_credit_again = Activity.again(params[:fee][:user_id], params[:fee][:semester]).sum :credit 
  #   total_money = money_fee total_credit, total_credit_again
  #   @fee.total_money = total_money
  #   @fee.total_credit = total_credit + total_credit_again
    
  #   if @fee.update_attributes fee_params
  #     flash[:success] = "Update is success"
  #     redirect_to fees_url
  #   else
  #     render 'edit'
  #   end
  # end

  private
  def fee_params
    params.require(:fee).permit :user_id, :semester, :total_money, :total_credit
  end
end