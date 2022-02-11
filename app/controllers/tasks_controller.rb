class TasksController < ApplicationController
	before_action :set_task, only: %i[show update destroy]

	def create
		@task = Task.new(task_params)
		if @task.save
			render json: @task, status: :created, location: @task
    	else
      		render json: @task.errors, status: :unprocessable_entity
    	end	 
	end

	def show
		render json: @task
	end

	def index
		@tasks = Task.all
		render json: @tasks
	end

	def update
		if @task.update(task_params)
	      render json: @task
	    else
	      render json: @task.errors, status: :unprocessable_entity
	    end
	end

	def destroy
		@task.destroy
	end

	private

	def set_task
		@task = Task.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:task_name, :category, :post_id)
	end
end
