class SessionsController < ApplicationController
	def create
		cookies.signed[:user_id] = current_user.id
		redirect_to messages_path
	end

	def destroy
	end
end
