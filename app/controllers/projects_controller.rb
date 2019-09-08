class ProjectsController < ApplicationController

	def index
		@projects = Project.all

	end

	def new

	 @project = Project.new
	end

	def create

	  @project = Project.new(project_params)

	  if @project.save
	  	flash[:Success] = "Project has been created sucessfully" # flash is a way to pass mes to next REQ.
	  	redirect_to @project

	  else
	   flash.now[:alert]  = "Project has not been created."
	   render "new"
	  end
	end

	def show
 		@project = Project.find(params.require(:id))
 	end

 	private

 	def project_params
 		params[:project].permit('name', 'description')

 	end



end
