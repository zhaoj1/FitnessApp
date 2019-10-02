class DateOfsController < ApplicationController

    require 'date'
    before_action :set_date, only: [:show, :edit, :update, :destroy]

    def index
        @date_ofs = DateOf.all
    end

    def new
        @date_of = DateOf.create(date_params)
        redirect_to user_date_of_path(id: @date_of.id)
    end

    # remove new page, when new date_of created, redirect to date show page

    # def create
    #     redirect_to user_date_of_path(id: @date_of.id)
    # end

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
            @date = DateOf.find_by(id: params[:id], user_id: session[:user_id])
        end

        def date_params
            params.permit(:date_of, :user_id)
        end

end
