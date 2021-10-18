class Project < ApplicationRecord
	has_many :milestones, dependent: :destroy

	validates :title, presence: :true, length: { minimum: 3 }
	validates :created_by, presence: :true, length: { minimum: 3 }

	def as_json(options = nil)
		# include milestone except those attr listed
		hash = super(:include => {:milestones => {except: %i[updated_at project_id]}})
		
		# rename title to project title
		hash.store(:project_title, hash.delete("title"))
		#convert times to unix time stampt
		hash[:created_at] = self.created_at.to_time.to_i
		hash[:updated_at] = self.updated_at.to_time.to_i
		hash[:start_date] = self.updated__at.to_time.to_i
		hash[:end_date] = self.updated_at.to_time.to_i

		hash[:is_single_day_project] = single_day_project
		return hash
	end
	
	private

	def single_day_project
		Time.at(self.start_date).to_date === Time.at(self.end_date).to_date
	end
end