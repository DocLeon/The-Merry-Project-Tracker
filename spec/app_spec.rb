require_relative 'spec_helper'

describe 'Application' do
	include Rack::Test::Methods
	def app
		@app ||= Sinatra::Application
	end

    def mock_api
        agilezen_mock = double("Backend::AgileZenApi")
        Backend::AgileZenApi.stub(:new).with().and_return(agilezen_mock)
        agilezen_mock.should_receive(:get_projects).and_return(["project1"])
    end

	it "should respond to a root request" do
		get '/'
	    last_response.should be_ok
	end

    it 'should get list of projects' do
        mock_api
        get '/projects'
        last_response.should be_ok
    end
end