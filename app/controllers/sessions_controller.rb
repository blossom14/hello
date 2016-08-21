class SessionsController < ApplicationController
	def create
		cookies.signed[:username] = current_user.name
		redirect_to messages_path
	end
end
