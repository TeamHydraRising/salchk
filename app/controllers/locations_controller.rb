class LocationsController < ApplicationController
	def index

		api_key = 'giHyMhPCwiaGw3mZRzbky7tlYx7MySHPaonXGcAdvLT2Of2GOd0nkuJj2Q5AJMqU'
		request = HTTParty.get("https://www.zipcodeapi.com/rest/"+api_key+"/info.json/#{params[:zipcode]}/miles")
		agent = Mechanize.new
		agent.get("http://livingwage.mit.edu/")
		key = agent.page.forms[0]
		key["q"]="#{request["city"]}, #{request["state"]}"
		key.submit
		binding.pry
	end
end