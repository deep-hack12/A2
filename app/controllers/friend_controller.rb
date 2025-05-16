class FriendController < ApplicationController
  before_action :set_Friend, only: %i[ show update destroy ]

  def index
    @friend = Friend.all
    render json: @friend
  end


  def show
    render json: @friend
  end


  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      render json: @friend, status: :created, location: @friend
    else
      render json: @friend.errors, status: :unprocessable_entity
    end
  end


  def update # It will find article and update the article
    unless @friend.update(friend_params)
        render json: { errors: errors.full_messages },
               status: :unprocessable_entity
    end
  end

  def destroy # it will find the article and delete it i.e. DELETE operation
    @friend = Friend.find(params[:id])
    @friend.destroy
  end

private
    def find_friend
      @friend = Friend.find_by_friendname!(params[:_friendname])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Friend not found' }, status: :not_found
    end

    def friend_params
        params.permit(:name, :friendname, :email, :password)
    end
end
