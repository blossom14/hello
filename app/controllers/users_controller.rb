class UsersController < ApplicationController
	def update
	end

	def index
		@users = User.all
	end

end
