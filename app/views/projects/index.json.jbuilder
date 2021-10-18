json.array! @projects do |project|
	json.id project.id 
	json.project_title project.title 

	# copy over the timestamps form model

	json.milestones project.milestones do |milestone|
		json.title milestone.title
		json.done milestone.done
		json.created_at milestone.reated_at.to_time.to_i
	end

	owner = User.find(project.created_by)
	json.owner do
		json.name owner.name
		json.id owner.id
	end

	json.viewers json.viewers, :name, :id

	json.set! :is_single_day_project, project.single_day_project()
end