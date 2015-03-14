class ScopesController < ApplicationController
	before_action :logged_in_user, only: [:show]
  def show
  	@scopes = current_user.scopes
  end
end
