require 'sinatra'
require 'net/http'
require 'uri'
require 'json'

post '/:formKey' do
	formKey = params['formKey']
	res = Net::HTTP.post_form(URI.parse("https://docs.google.com/forms/d/" + formKey + "/formResponse"), params)
	headers \
		"Access-Control-Allow-Origin" => "*",
		"Content-Type"                => "application/json"
	{ code: res.code.to_i }.to_json
end
