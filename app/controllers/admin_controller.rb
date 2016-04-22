class AdminController < ApplicationController

	def home
		if !logged_in?
			redirect_to '/login/new'
		end
	end
	def index
	end

	def new 
	end

	def create
	end

	def show
	end

	def update
	end

	def destroy
	end

	def edit
	end

end
