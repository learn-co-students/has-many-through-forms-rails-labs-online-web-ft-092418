class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @posters = @post.comments.map do |comment|
      comment.user
    end.uniq
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    #binding.pry
    redirect_to post
  end

  def update
    post = Post.find(params[:id])
    #binding.pry
    post.update(post_params)
    redirect_to post_path(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name],
      comments_attributes: [:content], users_attributes:[:username,:email, :id]
    )
  end
end
