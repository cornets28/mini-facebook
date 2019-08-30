class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user=User.find_by_id(params[:user_id])
    if @user
      friendship_request=current_user.friendship_sent.build(receiver:@user)
      if friendship_request.save
        redirect_to user_path(@user)
      else
        redirect_to root_path
      end
    end
  end
  def update
  end
  def destroy
    user=User.find_by_id(params[:id])
    if user
      friendship=user.find_friendships(current_user.id).first
      if friendship && friendship.destroy
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    end
  end
end