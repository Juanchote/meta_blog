class Comment < ActiveRecord::Base
  #attr_accessible :post, :title, :response_id

  #validates :post, :blog_entry_id, presence: true

  #has_many :posts
  belongs_to :blog_entry
end
