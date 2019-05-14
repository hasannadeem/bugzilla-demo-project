class HomeController < ApplicationController
	
	skip_before_action :authenticate_user!

	def index
	  	redirect_to projects_url if current_user
	end
end
