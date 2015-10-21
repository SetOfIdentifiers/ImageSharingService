class HomeController < ApplicationController

  def index
    # Get user reference if session cookie exists
	
	@user = nil
	@img = nil
	@uploaderName = nil
    
	   if(!session[SESSION_ACTIVE_USER].nil?)
           begin
               @user = User.find(session[SESSION_ACTIVE_USER]) # Find the user reference from the id from the session cookie
           rescue
               session[SESSION_ACTIVE_USER] = nil
           end
 	   end
	   
	   # Set image and associated references to be dependent on session cookies
	   
	   if(!session[SESSION_IMAGE].nil?)
           if(Image.exists?(session[SESSION_IMAGE]))
	 	      @img = session[SESSION_IMAGE] # get the image from the session cookies
		      @image = Image.find(session[SESSION_IMAGE]) # get the image reference for the id
		      @uploader = User.find(@image.uploader) # get the uploader of the image
		      @rating = @image.rating # get the image's rating
		      @comments = @image.getAllComments # the comments to be shown should have a foreign key equal to the image that is shown
           end
 	   end
	   
   end
   
end
