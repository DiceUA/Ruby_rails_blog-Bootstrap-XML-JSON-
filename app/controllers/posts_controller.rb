include SessionsHelper
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @current_user == nil
      flash[:alert] = "You must be signed in to make new post"
      render 'new'
      return
    else
      @post.user_id = @current_user.id
    end
    @post.visible = true
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to @post
    else
      render 'new'
    end

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end



  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
