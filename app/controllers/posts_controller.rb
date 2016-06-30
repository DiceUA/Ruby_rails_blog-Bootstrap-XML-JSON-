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
    if !signed_in?
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

  def new_comment
    @comment = Comment.new
  end

  def new_comment_create
    post = Post.find(params[:id])
    @comment = Comment.new(comment_params)
    if !signed_in?
      @comment.user = User.find_by_username('Anonymous')
    else
      @comment.user_id = @current_user.id
    end
    @comment.post_id = post.id
    @comment.visible = true
    if @comment.save
      redirect_to post
    else
      render 'new'
    end

  end


  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
