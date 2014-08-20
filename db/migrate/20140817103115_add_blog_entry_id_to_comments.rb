class AddBlogEntryIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :blog_entry_id, :integer
  end
end
