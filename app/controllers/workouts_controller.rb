class WorkoutsController < ApplicationController
    
    before_action :set_workout, only: [:show, :edit, :update, :destroy]

    def index
        @workouts = Workout.all
    end

    def show
    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.create(workout_params)
        redirect_to @workout
    end

    def edit
    end

    def update
        @workout.update(workout_params)
        redirect_to @workout
    end

    def destroy
        @workout.destroy
        redirect_to workouts_path
    end

    private
        def set_workout
            @workout = Workout.find(params[:id]) 
        end

        def workout_params
            params.require(:workout).permit(  )
        end
end
