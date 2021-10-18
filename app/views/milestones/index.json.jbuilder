json.array! @milestones do |milestone|
	json.partial! 'milestones/milestone', milestones: milestone
end