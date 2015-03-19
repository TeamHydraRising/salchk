class LocationsController < ApplicationController
	def index

		api_key = ENV['ZIP_API'] 

		request = HTTParty.get("https://www.zipcodeapi.com/rest/"+api_key+"/info.json/#{params[:zipcode]}/miles")
		agent = Mechanize.new
		agent.get("http://livingwage.mit.edu/")
		key = agent.page.forms[0]
		key["q"]="#{request["city"]}, #{request["state"]}"
		key.submit
		results = agent.page.parser

		##Creates an array of hashes for all the information scraped from the page
		num=0
		sym_count = 0
		expenses = results.css('.expenses_table td').to_a
		wages = results.css('.wages_table td').to_a

		wages_array=[]
		expenses_array=[]
		final_array=[]


		while num < expenses.count

			if num <= wages.count-1
				hourly_wages =  {symbols[sym_count].to_sym => results.css(tables[0]+"_table td").to_a[num].children.text}
				wages_array.push(hourly_wages)

				monthly_expenses =  {symbols[sym_count].to_sym => results.css(tables[1]+"_table td").to_a[num].children.text}
				expenses_array.push(monthly_expenses)
			end
			
			if num > wages.count-1 && num <= expenses.count
				monthly_expenses =  {symbols[sym_count].to_sym => results.css(tables[1]+"_table td").to_a[num].children.text}
				expenses_array.push(monthly_expenses)
			end	

			sym_count+=1
			num+=1
			if sym_count >= 9
				sym_count = 0
			end		
		end

		final_array.push(wages_array)
		final_array.push(expenses_array)
		
			    respond_to do |format|
					format.json {render json: final_array}
				end
	end
end