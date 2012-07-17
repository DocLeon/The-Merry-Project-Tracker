require "net/http"
require "uri"

module Backend
	class Agilezen_api
		def initialize(api_key)
			@api_key = api_key
		end
		def get_stories_for(project_id)
			uri = URI.parse("https://agilezen.com/api/v1/projects/#{project_id}/stories?pageSize=1000")

			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE

			request = Net::HTTP::Get.new(uri.request_uri)
			request["X-Zen-ApiKey"] = @api_key
			http.request(request).body	
		end
	end
end