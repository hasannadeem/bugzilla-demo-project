class HomeController < ApplicationController
	def index
	  if current_user
		if current_user.user_type == 'manager'
			redirect_to manager_url
		elsif current_user.user_type == 'developer'
			redirect_to developer_url
		elsif current_user.user_type == 'qa'
		 	redirect_to qa_url 
		end
	  end		
	end
	def manager
		redirect_to projects_url
	end
	
	def developer
		
	end

	def qa
		
	end
end
