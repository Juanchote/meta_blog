class BlogEntry < ActiveRecord::Base
	validates :title, :post, presence: true

	has_many :comments
end
