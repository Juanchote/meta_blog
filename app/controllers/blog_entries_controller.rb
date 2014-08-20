class BlogEntriesController < ApplicationController

  def create
    @blog_entry = BlogEntry.new(blog_entry_params)
    binding.pry
    status = :created
    if @blog_entry.save
      render json: @blog_entry, status: :created
    else
      render json: @blog_entry.errors, status: :unprocessable_entity
    end
  end

  def index
    @blog_entries = BlogEntry.all

    render json: @blog_entries, status: 200 
  end

  def show
    @blog_entry = BlogEntry.find_by_id(params[:id]).to_json(:include => :comments)

    unless @blog_entry.nil?
      render json: @blog_entry, status: 200
    else
      render json: "FAIL", status: 400
    end
  end

  def destroy
    @blog_entry = BlogEntry.find_by_id params[:id]

    if @blog_entry.destroy
      render json: @blog_entry, status: 200
    end
  end

  def blog_entry_params
    params.require(:blog_entry).permit(:title, :post)
  end

  private :blog_entry_params
end