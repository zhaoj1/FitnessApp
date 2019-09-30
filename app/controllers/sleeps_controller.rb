class SleepsController < ApplicationController

    def new
        @sleep = Sleep.new
    end

    def create
        @sleep = Sleep.create(params.require(:sleep).permit(:hours, :sleep_date, :user_id))
        redirect_to user_path(@sleep.user)
    end

    def index
        @sleeps = Sleep.all
    end

    def show
        @sleep = Sleep.find(params[:id])
    end

end
