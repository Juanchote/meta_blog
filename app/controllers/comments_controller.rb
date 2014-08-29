include ApplicationHelper

class CommentsController < ApplicationController

  def create
  	@comment = Comment.new(comment_params)
  	@comment.assign_attributes(blog_entry_id: params[:id])

  	set(@comment)
  end

  def index
  	@comments = BlogEntry.find_by_id(params[:id]).comments.order(id: :desc)

		get(@comments)
  end

  def show
  	@comment = Comment.find_by_id params[:id]

  	get(@comment)
  end

  def destroy
  	@comment = Comment.find_by_id params[:id]

  	delete(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :post)
  end
end
