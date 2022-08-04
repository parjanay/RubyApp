class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
  # GET /users/new
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account information has been updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to blogsite #{@user.name}, you have successfully signed up!!"
      redirect_to articles_path
    else
      render :new
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
