class UserController < ApplicationController

  LOGIN_SUCCESS_MESSAGE = "Login success"
  LOGIN_FAILURE_MESSAGE = "Login failure"
  REGISTRATION_SUCCESS_MESSAGE = "User created"
  REGISTRATION_FAILURE_MESSAGE = "Error in registration"
  
  def login
  
	# POST action that attempts to map a username to a password, if succesful then a session cookie will be set
    
    name = params[:name]
    password = params[:password]
    @user = User.login(name,password)
	@msg = LOGIN_SUCCESS_MESSAGE
	
	if @user.blank?	# if activerecord query did not return any results
		@msg = LOGIN_FAILURE_MESSAGE
	else
		session[SESSION_ACTIVE_USER] = @user.id	# make site remember user is logged in
	end
	
	flash[FLASH_MESSAGE] = @msg

	redirect_to :back
  end

  def register
  
	# POST action that creates a new user and sends it to the database
	
    if(User.register(params[:name], params[:password]))
        flash[FLASH_MESSAGE] = REGISTRATION_SUCCESS_MESSAGE
    else
        flash[FLASH_ERROR] = REGISTRATION_FAILURE_MESSAGE
    end
	
	redirect_to :back
  
  end
  
  def view
  
	# GET action that views a certain amount of information about the user depending on if the logged in user is the specified user or not
  
	@user = User.find(params[:id])
	@uploader_name = nil
    logged_in_user = nil
	
	if(!session[SESSION_ACTIVE_USER].nil?)
        logged_in_user = User.find(session[SESSION_ACTIVE_USER])
 	end
    
	@is_owner = (logged_in_user == @user)
	@images = Image.where("uploader = ?", params[:id]).all	
  end
  
  def logout
  
  # Clear the session cookies for the active user, only do this if the session cookie is not nil since the user might have cleared history.
  
  if(!session[SESSION_ACTIVE_USER].nil?)
	session[SESSION_ACTIVE_USER] = nil
  end
  
  redirect_to :back
  end
  
end
