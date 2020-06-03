class SessionsController < ApplicationController
	# protect_from_forgery with: :exception
	# include SessionsHelper
	# end
	def new
		flash[:success] = "welcome sign_out!!!!!!!!!!!!!!!!!!!"

	end
		def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
		end
	def destroy
		flash[:success]="ujhgdsfjld"
		sign_out
		redirect_to users_path
	end
end
