include ApplicationHelper

class BlogEntriesController < ApplicationController

  def new
    @blog_entry = BlogEntry.new
  end

  def create
    @blog_entry = BlogEntry.new(blog_entry_params)

    respond_to do |format|
      if object.save
        format.html
        format.json { render json: object, status: :created }
      else
        format.html { render 'new' }
        format.json { render json: object, status: :unprocessable_entity }
      end
    end
  end

  def index
    @blog_entries = BlogEntry.all

    object = @blog_entries
    respond_to do |format|
      if object
        format.html
        format.json { render json: output, status: :ok }
      else
        format.html { not_found }
        format.json { render json: { errors: 'Entry not found' }, status: :not_found }
      end
    end
  end

  def show
    @blog_entry = BlogEntry.find_by(id: params[:id])

    object = @blog_entry
    respond_to do |format|
      if object
        output = object.to_json(:include => :comments)
        format.html
        format.json { render json: output, status: :ok}
      else
        format.html { not_found }
        format.json { render json: { errors: 'Entry not found' }, status: :not_found }
      end
    end
  end

  def destroy
    @blog_entry = BlogEntry.find_by_id params[:id]

    object = @blog_entry

    respond_to do |format|
      if object.destroy
        format.html
        format.json { render json: object, status: :ok }
      else
        format.html
        format.json { render json: object, status: :unprocessable_entity }
      end
    end
  end

  private

  def blog_entry_params
    params.require(:blog_entry).permit(:title, :post)
  end

end