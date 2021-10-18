module Api
	module V1
		class ProjectsController < ApplicationController
			# skip_before_action :verify_authenticity_token, only: :create

			def index 
				@projects = Project.all # again, remove this line when merge in JWT
				# @projects = current_user.projects #activate when merge in users on JWT branch
				respond_to do |format|
					format.html
					format.json { @projects }
			end

			def create
				project = Project.new(project_params)
				# @project = current_user.project.create!(project_params)
				json_response(@project, :created)

				# if project.save
				# 	render json: project, status: :created
				# else
				# 	render json: project.errors, status: :unprocessable_entity
				# end
			end

			# def destroy 
			# 	Project.find(params[:id]).destroy!

			# 	head :no_content
			# end

			private
			# remove created by from list of params, add start and end dates
			def project_params
				params.require(:project).permit(:title, :start_date, :end_date)
			end
		end
	end
end
