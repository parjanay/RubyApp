class SessionsController < ApplicationController
    def new

    end
    def create

        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] ="Logged in Sucessfully!!"
            redirect_to user
        else
            flash.now[:alert] = "Wrong Login Details"
            #Doesn't persist for full HTTP request but now
            render 'new'
        end

    end
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end
