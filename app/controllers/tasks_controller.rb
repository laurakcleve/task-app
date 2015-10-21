class TasksController < ApplicationController
	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
		# redirect_to tasks_path
		respond_to do |format|
			format.html { redirect_to tasks_path }
			format.js
		end
	end

	def show
		@task = Task.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])
	end

	def update
		@task = Task.find(params[:id])
		@task.update(task_params)
		redirect_to(tasks_path)
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to tasks_path
	end

	def complete
		@tasks = Task.all
		@task = Task.find(params[:id])
		@task.update_attribute(:completed, true)

		sleep 1

		# redirect_to tasks_path
		respond_to do |format|
			format.html { redirect_to tasks_path }
			format.js
		end
	end

	private

		def task_params
			params.require(:task).permit(:name)
		end
end
