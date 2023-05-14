class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  def index
  end

  def show
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
