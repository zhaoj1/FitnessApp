class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def main
        render :main
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        @user.update(user_params_with_args(:age, :weight))
        if @user.save
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private
        def set_user
            @user = User.find(params[:id]) 
        end

        def user_params_with_args(*args)
            params.require(:user).permit(*args)
        end

        def user_params
            params.require(:user).permit(:name, :username, :password, :age, :weight)
        end

end
