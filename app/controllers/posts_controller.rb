class PostsController < ApplicationController
  
  #before_filter :authenicate_user!, only: [:new, :create, :destroy]
  # load_and_authorize_resource
      
  def new
    @post = current_user.posts.new
  end
  
  def edit
    @post = Post.find(params[:id])
    authorize! :update, @post
  end
  
  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
 
    redirect_to posts_path
  end
  
  def update
    @post = Post.find(params[:id])
    authorize! :update, @post
    
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def create
    @post = current_user.posts.new(post_params)
    authorize! :create, @post
 
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all.page params[:page]
  end
  
  private
   
    def post_params
      params.require(:post).permit(:title, :text)
    end
    
  
end