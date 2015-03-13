class LocationsController < ApplicationController
	def index
		api_key = 'giHyMhPCwiaGw3mZRzbky7tlYx7MySHPaonXGcAdvLT2Of2GOd0nkuJj2Q5AJMqU'
		request = HTTParty.get("https://www.zipcodeapi.com/rest/"+api_key+"/info.json/#{params[:zipcode]}/miles")
		puts "#{request["city"]}, #{request["state"]}"
		# send = HTTParty.get("https://127.0.0.1:8080", 
		# 				body: {city: request["city"], state: request["state"]}

	end
end