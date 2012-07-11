require_relative 'spec_helper'

describe 'Application' do
	include Rack::Test::Methods
	def app
		@app ||= Sinatra::Application
	end

    def mock_api
        @agilezen_mock = double("Backend::AgileZenApi")
        Backend::AgileZenApi.stub(:new).with().and_return(@agilezen_mock)        
    end

	it "should respond to a root request" do
		get '/'
	    last_response.should be_ok
	end

    it 'should get list of projects' do
        mock_api
        @agilezen_mock.should_receive(:get_projects).and_return(["project1"])
        get '/projects'
        last_response.should be_ok        
    end

    it 'should get stories for a project' do
        mock_api
        @agilezen_mock.should_receive(:get_stories_for).with(1).and_return(["story1"])
        get '/projects/1'
        last_response.should be_ok
        last_response.body.should include 'story1'
    end

    it 'should get last moved story for a project' do
        mock_api        
        @agilezen_mock.should_receive(:get_last_story_moved_for).with(1).and_return(["last story moved"])
        get '/projects/1/last_story_moved'
        last_response.body.should include 'last story moved'
    end
end