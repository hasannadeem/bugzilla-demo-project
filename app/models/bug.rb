class Bug < ApplicationRecord
	belongs_to :creator, :class_name => "User"
	belongs_to :project

	validates_uniqueness_of :title, scope: :project_id

	mount_uploader :screen_shot, ImageUploader
end
