class Viewer < ApplicationRecord
	belongs_to :project

	# TODO tests
	validates_presence_of(:name)
end
