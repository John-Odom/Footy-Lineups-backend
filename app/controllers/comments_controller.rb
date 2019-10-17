class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments, include: [:user]
    end
    def show
        comment = Comment.find_by(id:params[:id])
        render json: comment, include: [:user]
    end

    def create
        lineup_id=params["lineup"]["id"]
        user_id=params["user"]["id"]
        content=params["content"]["textContent"]
        comment = Comment.create(content:content, user_id:user_id, lineup_id:lineup_id)
        render json: comment
    end

end
