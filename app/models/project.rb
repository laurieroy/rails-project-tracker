class Project < ApplicationRecord
	has_many :milestones, dependent: :destroy
	has_many :viewers

	validates :title, presence: :true, length: { minimum: 3 }
	validates :created_by, presence: :true, length: { minimum: 3 }
end
