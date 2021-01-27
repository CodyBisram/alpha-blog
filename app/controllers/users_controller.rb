class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to Cody's Blog, #{@user.username}! You have successfully signed up."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    byebug
    if @user.update(user_params)
      flash[:notice] = "Your account information was updated successfully!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end