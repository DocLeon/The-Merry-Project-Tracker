require 'sinatra'
require_relative 'Backend/agilezen_api'


get '/' do
	'Welcome to the merry project tracker'
end

get '/projects' do
	agilezen_api = Backend::AgileZenApi.new()
	agilezen_api.get_projects
end