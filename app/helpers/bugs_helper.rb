module BugsHelper
	def data_for_view(all_bugs)
		bugs = all_bugs.where(bug_type:'bug')
		features = all_bugs.where(bug_type:'feature')
		
		view_data = {:features => features, :bugs => bugs}
		
		view_data.merge! total_features:features.count
		view_data.merge! new_features:features.where(status:'new').count
		view_data.merge! started_features:features.where(status:'started').count
		view_data.merge! completed_features:features.where(status:'completed').count

		view_data.merge! total_bugs:bugs.count
		view_data.merge! new_bugs:bugs.where(status:'new').count
		view_data.merge! started_bugs:bugs.where(status:'started').count
		view_data.merge! resolved_bugs:bugs.where(status:'resolved').count

	end
end
