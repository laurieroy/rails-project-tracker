class Project < ApplicationRecord
	has_many :milestones, dependent: :destroy
	has_many :viewers

	validates :title, presence: :true, length: { minimum: 3 }
	validates :created_by, presence: :true, length: { minimum: 3 }

	def single_day_project
		Time.at(self.start_date).to_date === Time.at(self.end_date).to_date
	end
end
