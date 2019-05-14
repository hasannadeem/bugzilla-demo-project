module BugsHelper
	def data_for_view(features, bugs)
		@view_data = {:features => features, :bugs => bugs}
		# @view_data < {:feature_count => features.count}
	end
end
