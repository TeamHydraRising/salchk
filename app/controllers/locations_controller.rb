class LocationsController < ApplicationController
	def index

		api_key = ENV['ZIP_API']
		request = HTTParty.get("https://www.zipcodeapi.com/rest/"+api_key+"/info.json/#{params[:zipcode]}/miles")
		agent = Mechanize.new
		agent.get("http://livingwage.mit.edu/")
		key = agent.page.forms[0]
		key["q"]="#{request["city"]}, #{request["state"]}"
		results = key.submit.parser


		living_wage = {  title: results.css('.wages_table td').to_a[0].children.text,
						 one_adult: results.css('.wages_table td').to_a[1].children.text,
						 one_adult_one_child: results.css('.wages_table td').to_a[2].children.text,
						 one_adult_two_children: results.css('.wages_table td').to_a[3].children.text,
						 one_adult_three_children: results.css('.wages_table td').to_a[4].children.text,
						 two_adults: results.css('.wages_table td').to_a[5].children.text,
						 two_adults_one_child: results.css('.wages_table td').to_a[6].children.text,
						 two_adults_two_children: results.css('.wages_table td').to_a[7].children.text,
						 two_adults_three_children: results.css('.wages_table td').to_a[8].children.text
					   }
				
				
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


		 #Expenses Table
		 food = {  		title: results.css('.expenses_table td').to_a[0].children.text,
						 one_adult: results.css('.expenses_table td').to_a[1].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[2].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[3].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[4].children.text,
						 two_adults: results.css('.expenses_table td').to_a[5].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[6].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[7].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[8].children.text
				}

		child_care= {  	 title: results.css('.expenses_table td').to_a[9].children.text,
						 one_adult: results.css('.expenses_table td').to_a[10].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[11].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[12].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[13].children.text,
						 two_adults: results.css('.expenses_table td').to_a[14].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[15].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[16].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[17].children.text
				}

		medical = {  	 title: results.css('.expenses_table td').to_a[18].children.text,
						 one_adult: results.css('.expenses_table td').to_a[19].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[20].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[21].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[22].children.text,
						 two_adults: results.css('.expenses_table td').to_a[23].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[24].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[25].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[26].children.text
				}

		housing = {  	 title: results.css('.expenses_table td').to_a[27].children.text,
						 one_adult: results.css('.expenses_table td').to_a[28].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[29].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[30].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[31].children.text,
						 two_adults: results.css('.expenses_table td').to_a[32].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[33].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[34].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[35].children.text
				}

		transportation = {  	 title: results.css('.expenses_table td').to_a[36].children.text,
						 one_adult: results.css('.expenses_table td').to_a[37].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[38].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[39].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[40].children.text,
						 two_adults: results.css('.expenses_table td').to_a[41].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[42].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[43].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[44].children.text
						}

		other = {  	 	 title: results.css('.expenses_table td').to_a[45].children.text,
						 one_adult: results.css('.expenses_table td').to_a[46].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[47].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[48].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[49].children.text,
						 two_adults: results.css('.expenses_table td').to_a[50].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[51].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[52].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[53].children.text
						}


		mo_inc_bftx= {  	 title: results.css('.expenses_table td').to_a[54].children.text,
						 one_adult: results.css('.expenses_table td').to_a[55].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[56].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[57].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[58].children.text,
						 two_adults: results.css('.expenses_table td').to_a[59].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[42].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[43].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[44].children.text
						}

		mo_inc_aftx = {  	 title: results.css('.expenses_table td').to_a[36].children.text,
						 one_adult: results.css('.expenses_table td').to_a[37].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[38].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[39].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[40].children.text,
						 two_adults: results.css('.expenses_table td').to_a[41].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[42].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[43].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[44].children.text
						}

		annual_tx = {  	 title: results.css('.expenses_table td').to_a[36].children.text,
						 one_adult: results.css('.expenses_table td').to_a[37].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[38].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[39].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[40].children.text,
						 two_adults: results.css('.expenses_table td').to_a[41].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[42].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[43].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[44].children.text
						}

		annual_inc_bftx = {  	 title: results.css('.expenses_table td').to_a[36].children.text,
						 one_adult: results.css('.expenses_table td').to_a[37].children.text,
						 one_adult_one_child: results.css('.expenses_table td').to_a[38].children.text,
						 one_adult_two_children: results.css('.expenses_table td').to_a[39].children.text,
						 one_adult_three_children: results.css('.expenses_table td').to_a[40].children.text,
						 two_adults: results.css('.expenses_table td').to_a[41].children.text,
						 two_adults_one_child: results.css('.expenses_table td').to_a[42].children.text,
						 two_adults_two_children: results.css('.expenses_table td').to_a[43].children.text,
						 two_adults_three_children: results.css('.expenses_table td').to_a[44].children.text
						}
				
		
		binding.pry

			    respond_to do |format|
					format.json {render json: final_hash}
				end
	end
end