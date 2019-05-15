class BasePresenter
	def initialize(project, template)
		@project  = project
		@template = template
	end

	def h
		@template
	end
end