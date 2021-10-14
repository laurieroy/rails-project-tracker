class Milestone < ApplicationRecord
	belongs_to :project

	# TODO tests
	validates_presence_of(:title)
end
