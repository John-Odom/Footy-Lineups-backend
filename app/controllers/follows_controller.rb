class FollowsController < ApplicationController

    def index
        follows=Follow.all
        render json: follows
    end

    def create 
        follow=Follow.create(follower_id:params['follower_id'], followee_id: params['followee_id'])
        render json: follow
    end
    def destroy
        follow = Follow.find(params[:id])
        follow.destroy
        render json: {message: "No Longer Following That User"}
    end
end
