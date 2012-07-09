require "net/http"
require "uri"
require "json"

uri = URI.parse("https://agilezen.com/api/v1/projects/")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(uri.request_uri)
request["X-Zen-ApiKey"] = "ADD-API-KEY-HERE"

response = http.request(request)

projects = []
JSON.parse(response.body)["items"].each {|item| projects << item}

projects.each{|project| 
	puts "#{project['owner']['name']} owns #{project['name']}"}
