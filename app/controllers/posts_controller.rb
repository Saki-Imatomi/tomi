class PostsController < ApplicationController
 


    def index
        @posts = Post.all
        @all_ranks = Post.find(Love.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    end


    def new
        @post=Post.new
    end

    def show
        @post =Post.find(params[:id])
        @love =Love.new
        @dogs = @post.dogs
        @dog = Dog.new

    end

    def create
        @post =Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def edit
      @post =Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to :action => "show", :id => @post.id
        else
          redirect_to :action => "new"
        end
    end


    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index
    end


    private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end

end