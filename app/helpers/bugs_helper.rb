module BugsHelper
	def data_for_view(all_bugs)
		bugs 		  = all_bugs.where(bug_type:'bug')
		features  = all_bugs.where(bug_type:'feature')
		
		view_data = {
		:features 					=> features,
		:total_features 		=> features.count,
		:new_features   		=> features.where(status:'new').count,
		:started_features 	=> features.where(status:'started').count,
		:completed_features	=> features.where(status:'completed').count,
		:bugs 							=> bugs,
		:total_bugs 				=> bugs.count,
		:new_bugs						=> bugs.where(status:'new').count,
		:started_bugs				=> bugs.where(status:'started').count,
		:resolved_bugs			=> bugs.where(status:'resolved').count
		}

	end
end
