class BlogEntry < ActiveRecord::Base
	validates :title, :post, presence: true

	has_many :comments

	#def as_json(options={})
	#	binding.pry
	#	self.comments.each do |comment|

	#	end
	#end
end
