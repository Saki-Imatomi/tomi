class DogsController < ApplicationController
    before_action :authenticate_user!

    def create
      post= Post.find(params[:post_id])
      dog = post.dogs.build(dog_params) #buildを使い、contentとtweet_idの二つを同時に代入
      dog.user_id = current_user.id
      if dog.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def dog_params
        params.require(:dog).permit(:content)
      end




end
