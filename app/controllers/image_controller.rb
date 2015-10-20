class ImageController < ApplicationController

  ACCEPTABLE_CONTENT_TYPES = ['image/jpeg', 'image/png']
  IMAGE_UPLOAD_SUCCESS_MESSAGE = "File uploaded"
  IMAGE_UPLOAD_FAILURE_MESSAGE = "File was not uploaded"
  IMAGE_UPLOAD_INVALID_MESSAGE = "Invalid file format"
  IMAGE_DELETE_SUCCESS_MESSAGE = "File deleted"
  IMAGE_RATE_SUCCESS_MESSAGE = "Rating sent"
  IMAGE_RATE_FAILURE_MESSAGE = "Rating not sent, rating needs to be selected before rating"
  IMAGE_RANDOMIZE_FAILURE_MESSAGE = "No images found"
  
  def random_image
  
    if((image = Image.random).nil?)
        flash[FLASH_ERROR] = IMAGE_RANDOMIZE_FAILURE_MESSAGE
        return
    end
    
        session[SESSION_IMAGE] = image.id
  end
  
  def new
  
    # POST action to upload file
  
	file = params[:file]
	user_id = session[SESSION_ACTIVE_USER]
    
    if(!(ACCEPTABLE_CONTENT_TYPES.include? file.content_type))
        flash[FLASH_ERROR] = IMAGE_UPLOAD_INVALID_MESSAGE
        redirect_to :back
        return
    end
    
	if(!Image.create(user_id, file)) # Create reference of the image model
        flash[FLASH_ERROR] = IMAGE_UPLOAD_FAILURE_MESSAGE
    else
        flash[FLASH_MESSAGE] = IMAGE_UPLOAD_SUCCESS_MESSAGE # Display notification
    end
	
	redirect_to :back
	
   end
   
  def delete
  
	# DELETE action that deletes an image of the parameter id from the database
  
	image = Image.find(params[:id])
	image.delete
    random_image()
    flash[FLASH_MESSAGE] = IMAGE_DELETE_SUCCESS_MESSAGE
	
	redirect_to :back

  end
  
  def rate
  
	# POST action to rate a file
  
	if(params[:rating].nil?)
		flash[FLASH_ERROR] = IMAGE_RATE_FAILURE_MESSAGE
	else
  
	img = Image.find(params[:id])
	img.rate(params[:rating])
    random_image()
		
    # Notify user
    
	flash[FLASH_MESSAGE] = IMAGE_RATE_SUCCESS_MESSAGE
	
	end
	
	redirect_to :back
  
  end

  def randomize
  
	# choose a random image index constrained within the size of the current image table
	# refresh page so the located image shows up
		
    random_image()
		
	redirect_to :back
  end
  
  def view
  
    # GET action to view a specific image, assumes an id as input data
  
	@img = Image.find(params[:id])
			
	send_data @img.data, :type => @img.content_type, :disposition => 'inline'
  
  end
end
