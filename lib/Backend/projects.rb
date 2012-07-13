module Backend
	class Projects
		def get_last_story_moved_for(project_id)
			@api.get_stories_for(project_id)
		end

		def initialize(api)
			@api = api
		end
	end
end