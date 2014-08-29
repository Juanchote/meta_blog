include ApplicationHelper

class BlogEntriesController < ApplicationController

  def create
    @blog_entry = BlogEntry.new(blog_entry_params)

    set(@blog_entry)
  end

  def index
    @blog_entries = BlogEntry.all

    get(@blog_entries)
  end

  def show
    @blog_entry = BlogEntry.find_by(id: params[:id])


    get(@blog_entry, { :include => :comments })
  end

  def destroy
    @blog_entry = BlogEntry.find_by_id params[:id]

    delete(@blog_entry)
  end

  def blog_entry_params
    params.require(:blog_entry).permit(:title, :post)
  end

  private :blog_entry_params
end