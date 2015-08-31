class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include SessionsHelper
  before_action :authenticate_user!

  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_signed_in?

  layout :select_layout

  def select_layout
  	if current_user
  		"application"
  	else
  		"login_layout"
  	end
  end



  def authenticate_user!
  	if logged_in?
  		true
  	else
  		redirect_to log_in_url
  	end
  end

  def user_signed_in?
  	logged_in?
  end

  def welcome
  	render 'shared/welcome_page'
  end


end
