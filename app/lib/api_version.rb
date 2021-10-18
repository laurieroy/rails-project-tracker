class ApiVersion
	attr_reader :version, :default

	def initialize(version, default = false)
		@version = version
		@default = default 
	end

	# check whether the version is specified or is the default
	def matches?(request)
		check_headers(request.headers) || default
	end

	private

	def check_headers(headers) 
		# check version from Accept headers; expect cusom media type 'project_tracker'
		accept = headers[:accept]
		accept && accept.include?("application/vnd.project_tracker.#{version}+json")
	end
end