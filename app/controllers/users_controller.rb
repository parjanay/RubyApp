class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
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
