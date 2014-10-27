include ApplicationHelper

class CommentsController < ApplicationController

  def create
    @blog_entry = BlogEntry.find(params[:blog_entry_id])
    @comment = @blog_entry.comments.create(comment_params)

    save_for(@comment)
  end

  def index
    @comments = BlogEntry.find_by_id(params[:blog_entry_id]).comments.order(id: :desc)

    render_for(@comments)
  end

  def show
    @comment = Comment.find_by_id params[:blog_entry_id]

    render_for(@comment)
  end

  def destroy
    @comment = Comment.find_by_id params[:blog_entry_id]

    destroy_for(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :post)
  end
end
