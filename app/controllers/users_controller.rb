class UsersController < ApplicationController
	before_action :authenticate_user!
	def update
	end

	def index
		@users = User.all
	end

end
