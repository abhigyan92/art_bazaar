class LoginController < ApplicationController
	def new 
		if logged_in?
			redirect_to '/admin/home'
		end
	
	end

	def create
		admin = Admin.find_by(name: params[:session][:username].downcase)
		if admin && admin.password==params[:session][:password]
			log_in admin
			redirect_to '/admin/home'
		else
			flash[:danger]="Invalid username or password"
			redirect_to '/login/new'
		end
	end

	def destroy
		log_out if logged_in?
        redirect_to '/login/new'
	end

end
