class FriendsController < ApplicationController
  before_action :authorize
  before_action :find_friend, only: %i[show update destroy]

  def index
    @friends = current_user.friends

    render json: @friends
  end

  def show
    render json: @friend
  end

  def create
    @friend = current_user.friends.build(collection_params)

    if @friend.save
      render json: @friend, status: :created
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  def update
    if @friend.update(friend_params)
      render json: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @friend.destroy
    render json: { message: 'Friend deleted' }, status: :ok
  end

  private

  def find_friend
    @friend = current_user.friends.find_by(id: params[:id])
    render json: { failure: "Friend doesn't exist." }, status: :not_found unless @friend
  end

  def friend_params
    params.require(:friend).permit(:name, :email, :user_id)
  end
end
