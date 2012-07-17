require_relative 'spec_helper'

describe 'Application' do
	include Rack::Test::Methods
	def app
		@app ||= Sinatra::Application
	end

    def mock_api
        @projects_mock = double("Backend::Projects")
        @agile_zen_api = double("Backend::Agilezen_api")
        Backend::Agilezen_api.should_receive(:new).with("key")
        Backend::Projects.stub(:new).with(any_args()).and_return(@projects_mock)        
    end

	it "should respond to a root request" do
		get '/'
	    last_response.should be_ok
	end

    it 'should get list of projects' do
        mock_api
        @projects_mock.should_receive(:get_projects).and_return(["project1"])
        get '/key/projects'
        last_response.should be_ok        
    end

    it 'should get stories for a project' do
        mock_api
        @projects_mock.should_receive(:get_stories_for).with(1).and_return(["story1"])
        get '/key/projects/1'
        last_response.should be_ok
        last_response.body.should include 'story1'
    end
    
    it 'should get stories that are started' do
        mock_api
        @projects_mock.should_receive(:get_stories_for).with(1).and_return([{"text" => "Story 1","status" => "started"},{"text" => "Story 2","status" => "finished"}])
        get '/key/projects/1/inprogress'
        last_response.body.should include 'Story 1'
        last_response.body.should_not include 'Story 2'
    end
end