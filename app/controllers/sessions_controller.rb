class SessionsController < ApplicationController

	skip_before_filter :authenticate_user!


	def new
	end


	def create

		@user = User.find_by(username: params[:user][:username])
		if @user
			session[:user_id] = @user.id

			respond_to do |format|
				format.html {redirect_to root_path, :notice => "Logged In"}
			end
		else
			
			flash.now[:error] = "User Name is incorrect"
			render "new"

		end

	end

	def destroy

		session[:user_id]=nil
		cookies.delete :secure_session
		redirect_to root_path, :notice => "Logged Out"
	end

end

