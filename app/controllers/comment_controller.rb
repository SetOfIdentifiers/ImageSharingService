class CommentController < ApplicationController

  COMMENT_NEW_SUCCESS_MESSAGE = "Reply sent"

  def new
	# Creates a new comment
	img = Image.find(params[:image_id])
	img.reply(params[:user_id], params[:contents])
	flash[FLASH_MESSAGE] = COMMENT_NEW_SUCCESS_MESSAGE
	
	redirect_to :back
  end

  def delete
  end

  def edit
  end

  def view
	# activerecord query that returns comments
	@comments = Comment.all
  end
  
end
