class FriendsController < ApplicationController
  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(Friend_params)
    if request_exist?
      redirect_to users_path,
                  alert: 'Request already sent'
    elsif !request_exist? && @friend.save
      redirect_to users_path
    end
  end

  def show; end

  def update
    @friend = Friend.find(params[:id])
    redirect_to users_path if @friend.confirmed == false and @friend.accept_request
  end

  def destroy
    @friend = Friend.where(user_id: [params[:id], current_user.id],
                           friend_id: [current_user.id, params[:id]])
    redirect_to users_path if @friend.destroy_all
  end

  private

  def request_exist?
    current_user.already_friend?(User.find_by(id: params[:friend][:friend_id]))
  end

  def friend_params
    params.require(:friend).permit(:name, :email, :user_id)
  end
end
