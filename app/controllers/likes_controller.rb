class LikesController < ApplicationController
    def create
        like = Like.find_or_create_by(params.permit(:liker_id, :target_id, :status))
        result = []
        result[:is_matched] = is_matched
        render json: result
    end

    def is_matched
        if like.status == 0
            return false
        end
        if like.status == 1
            other_like = Like.find(liker_id: params[:target_id],target_id: params[:liker_id])
            if other_like.status == 1
                return true
            end
            return false
        end
    end
end
