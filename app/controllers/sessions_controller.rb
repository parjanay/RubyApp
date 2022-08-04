class SessionsController < ApplicationController
    def new

    end
    def create
        p params[:sessions][:email]
        user = User.find_by( email: params[:sessions][:email])
        if user && user.authenticate(params[:sessions][:password])
            flash[:notice] ="Logged in Sucessfully!!"
            redirect_to user
        else
            flash.now[:alert] = "Wrong Login Details"
            #Doesn't persist for full HTTP request but now
            render 'new'
        end

    end
    def destroy

    end

end
