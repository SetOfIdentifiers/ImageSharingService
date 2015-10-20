class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # Shared session data
  
  SESSION_ACTIVE_USER = :activeUser
  SESSION_FILE = :file
  SESSION_IMAGE = :img
  
  # Message output
  
  FLASH_MESSAGE = :message
  FLASH_ERROR = :error
  
end
