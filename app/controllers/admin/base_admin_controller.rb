class Admin::BaseAdminController < ApplicationController
  before_action :verify_admin

  private
  def verify_admin
    redirect_to root_url unless current_user.admin?
  end
end