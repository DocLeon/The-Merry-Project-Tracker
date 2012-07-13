require_relative 'spec_helper'

module Backend
	describe Projects do 
		it "should get last story moved from agile zen" do
			agile_zen_projects = double('AgileZenprojects')
			projects = Projects.new(agile_zen_projects)
			agile_zen_projects.should_receive(:get_stories_for).with(1)
			projects.get_last_story_moved_for(1)
		end		
	end
end