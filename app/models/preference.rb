class Preference < ActiveRecord::Base
	belongs_to :user
	self.primary_key = "user_id"
	validates :user_id, presence: true
	
end
