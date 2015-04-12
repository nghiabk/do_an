class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def calculate a,b
    c = (a * 0.3 + b * 0.7).round(1)
    if c >= 4
      return c
    else
      return 0
    end
  end

  def money_fee a,b
    a*100000 + b * 150000
  end

  private
  	def logged_in_user
  		unless logged_in?
  			store_location
  			flash[:danger] = "Please log in."
  			redirect_to login_url
  		end
  	end

    def verify_admin
      redirect_to root_url unless current_user.admin?
    end

    def verify_user
      # flash[:danger] = "Ban khong phai la user"
      redirect_to root_url if current_user.admin?
    end
end
