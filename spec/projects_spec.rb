require_relative 'spec_helper'

module Backend
	describe Projects do 
		it "should get stories from agile zen" do
			agile_zen_projects = double('AgileZenprojects')
			projects = Projects.new(agile_zen_projects)
			agile_zen_projects.should_receive(:get_stories_for).with(1)
				.and_return("{
					\"page\": 1,
					\"pageSize\": 100,
					\"totalPages\": 2,
					\"items\":[
						{
							\"id\": 1,
							\"text\": \"Story 1\",
							\"size\": \"1\",
							\"color\": \"grey\",
							\"status\": \"started\"
						},
						{
							\"id\": 2,
							\"text\": \"Story 2\",
							\"size\": \"2\",
							\"color\": \"grey\",
							\"status\": \"finished\"
						}
					]
					}")
			puts projects.get_stories_for(1)
		end		
	end
end