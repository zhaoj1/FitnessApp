class DateOfsController < ApplicationController

    before_action :set_date, only: [:show, :edit, :update, :destroy]

    def index
        @date_ofs = DateOf.all
    end

    def new
        @date_of = DateOf.new
    end

    def create
        @date_of = DateOf.create(date_params)
    end

    def show
    end

    def edit
    end

    def update
        @date.update(date_params)
        redirect_to @date
    end
        
    def destroy
        @date.destroy
        redirect_to user_path(@date.user.id)
    end

    private
        def set_date
            @date = DateOf.find(params[:id])
        end

        def date_params
            params.require(:date_of).permit(:date_of, :user_id)
        end

end
