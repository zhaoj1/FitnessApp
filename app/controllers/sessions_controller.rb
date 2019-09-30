class SessionsController < ApplicationController

    skip_before_action :authenticate, only: [:new, :create, :destroy]
    
    def new
        render :new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(BCrypt::Password.new(params[:user][:password_digest]))
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

end
