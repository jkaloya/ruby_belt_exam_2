class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email( params[:Email] )
        if user && user.authenticate( params[:Password] )
            session[:user_id] = user.id
            redirect_to "/bright_ideas"
        else
            flash[:errors] = ["Invalid email and password combination"]
            redirect_to "/main"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/main"
    end
end
