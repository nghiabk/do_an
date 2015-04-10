class RequestsController < ApplicationController
  def index
    @requests = Request.paginate page: params[:page], per_page: 15
  end

  def new
    @request = Request.new
  end

  def show
    @requests = current_user.requests
  end

  def create
    @request = Request.new request_params
    @request.user_id = current_user.id
    if @request.save
      flash[:success] = "Tao yeu cau thanh cong"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit :class_student_id, :user_id
  end
end
