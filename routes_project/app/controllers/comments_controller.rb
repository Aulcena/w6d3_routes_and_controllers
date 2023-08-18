class CommentsController < ApplicationController

    def index
        case 
        when params[:author_id]
            comment = Comment.where(author_id: params[:author_id])   
        when params[:artwork_id]
            comment = Comment.where(artwork_id: params[:artwork_id])   
        else
            comment = Comment.all
        end

        render json: comment
    end

    def create
        comment = Comment.new(comment_params)

        if comment.save
            render json: comment, status: :created
        else
            comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])

        if comment.destroy
            render json: comment, status: :deleted
        else
            comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :artwork_id, :author_id)
    end

end