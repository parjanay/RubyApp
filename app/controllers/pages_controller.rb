class PagesController < ApplicationController
    def home
        @user = User.find(session[:user_id])
        byebug
        redirect_to @user if logged_in?
    end
    def about
    end
end
