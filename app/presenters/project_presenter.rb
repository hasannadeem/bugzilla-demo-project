class ProjectPresenter < BasePresenter

	def project_devs
		@project_devs = @project.users.where(user_type:'developer')
	end
	
	def un_assigned_devs 
		@un_assigned_devs = User.where(user_type:'developer') - project_devs
	end

	def project_qas 
		@project_qas = @project.users.where(user_type:'qa')
	end

  def un_assigned_qas
		@un_assigned_qas = User.where(user_type:'qa') - project_qas
	end
	
	def link_to_add_user_to_project user_id
		h.link_to("Add", h.add_user_project_path(user_id:user_id), :class =>"btn btn-outline-primary", method: :patch)
	end

	def link_to_delete_user_from_project user_id
		h.link_to("Delete", h.remove_user_project_path(user_id:user_id), :class =>"btn btn-light text-danger", data: { confirm: 'Are you sure?' }, method: :patch)
	end

	def link_to_delete_project
		h.link_to "Delete", @project, :class =>"btn btn-outline-danger",data: { confirm: 'Are you sure?' }, method: :delete
	end

	def project_devs_count
		 	project_devs.count
	end

	def project_qas_count
		 	project_qas.count
	end
end