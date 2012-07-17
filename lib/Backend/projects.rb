require "json"
module Backend
	class Projects
		def get_stories_for(project_id)
			data = @api.get_stories_for(project_id)
			JSON.parse(data)["items"]
		end

		def initialize(api)
			@api = api
		end
	end
end