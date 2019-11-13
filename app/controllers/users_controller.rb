class UsersController < ApplicationController

    def index
        @users=User.all
        render json: @users, include: [:lineups, :team, 
           {:followees => {
              :include => [:lineups, :followees, :followers]
           }}, 
           {:followers => {
            :include => [:lineups, :followees, :followers]
         }}]
    end

    def show
      @user=User.find(params[:id])
      render json: @user, include: [:lineups, :team, 
         {:followees => {
            :include => [:lineups, :followees, :followers]
         }}, 
         {:followers => {
          :include => [:lineups, :followees, :followers]
       }}]
    end

    def profile
        render json: { user: current_user}, include: [:lineups, :team,
          {:followees => {
             :include => [:lineups, :followees, :followers]
          }}, 
          {:followers => {
           :include => [:lineups, :followees, :followers]
        }}] , status: :accepted
    end

    def create
        @user = User.new(user_params)
        team=Team.find(params["user"]["team"]["id"])
        @user[:team_id]=team.id
        @user.save
        if @user.valid?
            @token = encode_token(user_id: @user.id)
          render json: { user: @user, jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end


    # Person.update(15, :user_name => 'Samuel', :group => 'expert')

    def update
      user = User.find(params["user_id"])
      team = Team.find_by(club_name: params["team"])
      if user
        # byebug
        updated_user = User.update(params["user_id"],
          username:params["username"], 
          bio:params["bio"], 
          team_id:team.id, 
          avatar:params["avatar"])
        render json: { user: updated_user }
      else
        render json: { error: 'failed to update profile' }, status: :not_acceptable
      end
    end

     
      private
      def user_params
        params.require(:user).permit(:username, :password, :bio, :avatar)
      end
end
