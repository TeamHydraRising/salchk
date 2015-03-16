class LocationsController < ApplicationController
	def index

		api_key = 'giHyMhPCwiaGw3mZRzbky7tlYx7MySHPaonXGcAdvLT2Of2GOd0nkuJj2Q5AJMqU'
		request = HTTParty.get("https://www.zipcodeapi.com/rest/"+api_key+"/info.json/#{params[:zipcode]}/miles")
		agent = Mechanize.new
		agent.get("http://livingwage.mit.edu/")
		key = agent.page.forms[0]
		key["q"]="#{request["city"]}, #{request["state"]}"
		results = key.submit.parser
		results.css('.wages_table td').to_a[1..9]

		# Living Wage
		living_wage = {title: results.css('.wages_table td').to_a[0].children.text,
						one_adult: results.css('.wages_table td').to_a[1].children.text,
						one_adult_one_child: results.css('.wages_table td').to_a[2].children.text,
						one_adult_two_children: results.css('.wages_table td').to_a[3].children.text,
						one_adult_three_children: results.css('.wages_table td').to_a[4].children.text,
						two_adults: results.css('.wages_table td').to_a[5].children.text,
						two_adults_one_child: results.css('.wages_table td').to_a[6].children.text,
						two_adults_two_children: results.css('.wages_table td').to_a[7].children.text,
						two_adults_three_children: results.css('.wages_table td').to_a[8].children.text
						}
				
		#Poverty Wage		
		poverty_wage = {title: results.css('.wages_table td').to_a[9].children.text,
						one_adult: results.css('.wages_table td').to_a[10].children.text,
						one_adult_one_child: results.css('.wages_table td').to_a[11].children.text,
						one_adult_two_children: results.css('.wages_table td').to_a[12].children.text,
						one_adult_three_children: results.css('.wages_table td').to_a[13].children.text,
						two_adults: results.css('.wages_table td').to_a[14].children.text,
						two_adults_one_child: results.css('.wages_table td').to_a[15].children.text,
						two_adults_two_children: results.css('.wages_table td').to_a[16].children.text,
						two_adults_three_children: results.css('.wages_table td').to_a[17].children.text
						}

		#Minimum Wage
		minimum_wage = {title: results.css('.wages_table td').to_a[18].children.text,
						one_adult: results.css('.wages_table td').to_a[19].children.text,
						one_adult_one_child: results.css('.wages_table td').to_a[20].children.text,
						one_adult_two_children: results.css('.wages_table td').to_a[21].children.text,
						one_adult_three_children: results.css('.wages_table td').to_a[22].children.text,
						two_adults: results.css('.wages_table td').to_a[23].children.text,
						two_adults_one_child: results.css('.wages_table td').to_a[24].children.text,
						two_adults_two_children: results.css('.wages_table td').to_a[25].children.text,
						two_adults_three_children: results.css('.wages_table td').to_a[26].children.text
						}
		
		binding.pry
	end
end