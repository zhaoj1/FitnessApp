class DietsController < ApplicationController

    before_action :set_diet, only: [:show, :edit, :update, :destroy]

    def index
        @diets = Diet.all
    end

    def show
    end

    def new
        @diet = Diet.new
    end

    def create
        @diet = Diet.create(diet_params)
        redirect_to @diet
    end

    def edit
    end

    def update
        @diet.update(diet_params)
        redirect_to @diet
    end

    def destroy
        @diet.destroy
        redirect_to diets_path
    end

    private
        def set_diet
            @diet = Diet.find(params[:id]) 
        end

        def diet_params
            params.require(:diet).permit(:meal, :calories, :user_id)
        end

end
