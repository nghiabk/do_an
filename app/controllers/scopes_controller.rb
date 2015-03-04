class ScopesController < ApplicationController
  def index
  	@scopes = current_user.scopes.all
  	# @scopes = Scope.all
  end
end
