class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_params, only: [:create, :update]
  def new
    @post = current_user.posts.new
  end

  def create
    current_user.posts.create(post_params)
    redirect_to home_index_path
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
        redirect_to home_index_path
    end
  end

  def update
    Post.find(params[:id]).update(post_params)
    redirect_to home_index_path
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      @post.destroy
    end
    redirect_to home_index_path
  end

  def like
    @post = Post.find(params[:id])
    @like = @post.likes
    @post.update(likes: @like+1)
    redirect_to home_index_path
  end

  private
  def post_params
    params.require(:post).permit(:img)
  end
end
