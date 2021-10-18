json.array! @projects do |project|
	json.id project.id 
	json.project_title project.title 

	#convert times to unix time stampt
	json.created_at = project.created_at.to_time.to_i
	json.updated_at = project.updated_at.to_time.to_i
	json.start_date = project.start_date.to_time.to_i
	json.end_date = project.end_date.to_time.to_i

	json.milestones project.milestones do |milestone|
		json.partial! 'milestone/milestone', milestone: milestone
	end

	owner = User.find(project.created_by)
	json.owner do
		json.name owner.name
		json.id owner.id
	end

	json.viewers json.viewers, :name, :id

	json.set! :is_single_day_project, project.single_day_project()
end