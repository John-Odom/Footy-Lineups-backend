class UsersController < ApplicationController

    def index
        @users=User.all
        render json: @users, include: [:lineups]
    end

    def profile
        render json: { user: current_user }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
          render json: { user: @user, jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def update
      user = User.find(params["user_id"])
      if user.valid?
        user.update(username:params["username"], 
          bio:params["bio"], 
          team:params["team"], 
          avatar:params["avatar"])
        render json: { user: user }, status: :created
      else
        render json: { error: 'failed to update profile' }, status: :not_acceptable
      end
    end

     
      private
      def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar, :team)
      end
end
