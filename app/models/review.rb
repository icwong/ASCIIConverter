class Review < Post
	belongs_to :student

	def self.model_name
		Post.model_name
	end
end
