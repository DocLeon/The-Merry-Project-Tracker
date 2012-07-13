require 'sinatra'
require_relative 'Backend/projects'

set :root, File.dirname(__FILE__)

get '/' do
	'Welcome to the merry project tracker'
end

get '/projects' do
	projects_api = Backend::Projects.new()
	projects_api.get_projects
end

get '/projects/:id' do |project_id|
	projects_api = Backend::Projects.new()
	projects_api.get_stories_for(project_id.to_i)
end

get '/projects/:id/last_story_moved' do |project_id|
	projects_api = Backend::Projects.new()
	@storyname = projects_api.get_last_story_moved_for(project_id.to_i)
	erb :story
end