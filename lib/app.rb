require 'sinatra'
require_relative 'Backend/projects'
require_relative 'Backend/agilezen_api'

set :root, File.dirname(__FILE__)

get '/' do
	'Welcome to the merry project tracker'
end

get '/:key/projects' do |key|
	projects_api = Backend::Projects.new(Backend::Agilezen_api.new(key))
	projects_api.get_projects
end

get '/:key/projects/:id' do |key,project_id|
	projects_api = Backend::Projects.new(Backend::Agilezen_api.new(key))
	projects_api.get_stories_for(project_id.to_i)
end

get '/:key/projects/:id/inprogress' do |key,project_id|
	projects_api = Backend::Projects.new(Backend::Agilezen_api.new(key))
	data = projects_api.get_stories_for(project_id.to_i)
	puts data
	@stories = data.find_all{|item| item["status"] == "started"}
	erb :stories
end