class SessionsController < ApplicationController

    skip_before_action :authenticate, only: [:new, :create, :destroy]
    
    def new
        render :new
    end
    
    def create
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Invalid email or password combination."
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end

end
