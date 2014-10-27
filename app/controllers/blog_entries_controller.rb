include ApplicationHelper

class BlogEntriesController < ApplicationController

  def new
    @blog_entry = BlogEntry.new
  end

  def create
    @blog_entry = BlogEntry.create(blog_entry_params)

    save_for(@blog_entry)
  end

  def index
    @blog_entries = BlogEntry.all

    render_for(@blog_entries)
  end

  def show
    @blog_entry = BlogEntry.find_by(id: params[:id])

    render_for(@blog_entry, {:include => :comments})
  end

  def destroy
    @blog_entry = BlogEntry.find_by_id params[:id]

    destroy_for(@blog_entry)


  end

  private

  def blog_entry_params
    params.require(:blog_entry).permit(:title, :post)
  end
end