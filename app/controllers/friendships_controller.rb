class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friendship, only: [ :messages, :update, :destroy ]

  def messages
    gon.friendship = @friendship
  end

  def index
    @friendships = current_user.friendships.accepted
  end

  def create
  	   @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to users_path
      else
        flash[:error] = "Unable to request friendship."
        redirect_to users_path
      end
  end

  def update
    @friendship.update(accepted: true)
      if @friendship.save
        redirect_to users_path, notice: "Successfully confirmed friend!"
      else
        redirect_to users_path, notice: "Sorry! Could not confirm friend!"
      end
  end

  def destroy
  	   @friendship = Friendship.find_by(id: params[:id])
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to :back
  end

  private 

  def set_friendship
    @friendship = Friendship.find_by(id: params[:id])
  end
end
