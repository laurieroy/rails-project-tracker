module Api
	module V1
		class ProjectsController < ApplicationController
			# skip_before_action :verify_authenticity_token, only: :create
			# I'm following a tutorial that is incomplete, creating user JWT on separate branch so commenting out code
			def index 
				@projects = Project.all
				# @projects = current_user.projects #remove proj.all line when put back
				respond_to do |format|
					format.html
					format.json { render json: @projects} # removed  .to_json(include: :milestones) since model now handles this
				end
			end

			def create
				# project = Project.new(project_params) # remove line when merge in user
				@project = current_user.projects.create(project_params)
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
			# removed , :created_by from list of permitted params
			def project_params
				params.require(:project).permit(:title)
			end
		end
	end
end
