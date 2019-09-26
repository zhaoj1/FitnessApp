class SleepsController < ApplicationController

    def new
        @sleep = Sleep.new
    end

    def create
        @sleep = Sleep.create(params.require(:sleep).permit(:hours, :user_id))
        redirect_to user_path(@sleep.user)
    end

end
