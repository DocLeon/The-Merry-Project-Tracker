require 'sinatra'
require_relative 'Backend/agilezen_api'


get '/' do
	'Welcome to the merry project tracker'
end

get '/projects' do
	agilezen_api = Backend::AgileZenApi.new()
	agilezen_api.get_projects
end

get '/projects/:id' do |project_id|
	agilezen_api = Backend::AgileZenApi.new()
	agilezen_api.get_stories_for(project_id.to_i)
end

get '/projects/:id/last_story_moved' do |project_id|
	agilezen_api = Backend::AgileZenApi.new()
	agilezen_api.get_last_story_moved_for(project_id.to_i)
end