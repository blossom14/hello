# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from stream_target
  end

  def speak(data)
  	ActionCable.server.broadcast(stream_target,
		message: render_message(data['message']))
  end

  private

  def render_message(message)
  	ApplicationController.render(partial: 'messages/message',
  								locals: { message: message, username: current_user.name})
  end

  def stream_target
    if params[:friendship_id].present?
      "friendship_chat_#{params[:friendship_id]}"
    else
      "all_chat"
    end
  end
end
