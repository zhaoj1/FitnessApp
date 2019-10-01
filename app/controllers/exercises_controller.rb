class ExercisesController < ApplicationController

    def index
        @exercises = Exercise.all
    end

    def new
        @exercise = Exercise.new
    end

    def show
        @exercise = Exercise.find(params[:id])
    end

    def create
        @exercise = Exercise.create(exercise_params)
    end

    private

    def exercise_params
        params.require(:exercise).permit(:exercise_name, :image_url, :page_url, :exercise_difficulty, :exercise_impact_level, :target_body_parts, :exercise_video)
    end

end
