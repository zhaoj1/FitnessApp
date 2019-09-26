class MoodsController < ApplicationController

    def new
        @mood = Mood.new
    end

    def create
        @mood = Mood.create(params.require(:mood).permit(:type, :user_id))
        redirect_to user_path(@mood.user)
    end

end
