class CommentsController < ApplicationController

  def create
  	@comment = Comment.new(comment_params)
  	@comment.assign_attributes(blog_entry_id: params[:id])

  	status = 200
  	if @comment.save
			status = 200
  	else
  		status = 400
  	end

		render json: @comment, status: status
  end

  def index
  	@comments = BlogEntry.find(params[:id]).comments.order(id: :desc)

		render json: @comments, status: 200
  end

  def show
  	@comment = Comment.find_by_id params[:id]

  	unless @comment.nil?
			render json: @comment, status: 200
	  else
			render json: {"errors": "no id"}, status: 400
	  end
  end

  def destroy
  	@comment = Comment.find_by_id params[:id]

  	unless @comment.nil?
  		if @comment.destroy
  			render json: @comment, status: 200
  		else
				render json: @comment.errors, stauts: 400
  		end
  	else
			render json:  "ID no válido", stauts: 400
  	end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :post)
  end
end
