class SessionsController < ApplicationController

    def new
        render :new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:error] = "Invalid email or password combination."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

end
