class LovesController < ApplicationController
    def create
        love = current_user.loves.create(post_id: params[:post_id])
        redirect_back(fallback_location: root_path)
    end
    
    
    def destroy
        love = Love.find_by(post_id: params[:post_id], user_id: current_user.id)
        love.destroy
        redirect_back(fallback_location: root_path)
    end


end
