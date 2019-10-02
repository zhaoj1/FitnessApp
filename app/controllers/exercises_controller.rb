class ExercisesController < ApplicationController

    def index
        @exercises = Exercise.all
    end

    # def new
    #     @exercise = Exercise.new
    # end

    def show
        @exercise = Exercise.find(params[:id])
    end

    # def create
    #     @exercise = Exercise.create(exercise_params)
    # end

    def add_to_workout
        # @workout = Workout.find_by(id: workout.id)
        @exercise = Exercise.find(params[:id])
        @exercise.add_to_workout(@workout)
        redirect_to @workout
    end

    private

    def exercise_params
        params.require(:exercise).permit(:exercise_name, :image_url, :page_url, :exercise_difficulty, :exercise_impact_level, :target_body_parts, :exercise_video, :category)
    end

end
