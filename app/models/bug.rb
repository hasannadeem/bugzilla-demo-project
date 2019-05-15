class Bug < ApplicationRecord
	belongs_to :creator, class_name: "User"
	belongs_to :project

	validates :title, :bug_type, :status, presence: true
	validates_uniqueness_of :title, scope: :project_id
	
	validate :screen_shot_type

	mount_uploader :screen_shot, ImageUploader


	def assign_to_name
		User.find(assign_to).name
	end

	private

	def screen_shot_type
   	  if !screen_shot.content_type.to_s.in?(%('image/png image/gif')) 
   	    errors.add(:screen_shot, "only support .png or .gif")  
   	  end
	end
end
