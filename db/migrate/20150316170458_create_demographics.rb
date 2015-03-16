class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|

    	t.integer :zipcode
    	t.integer :salary
    	t.string 	:industry 
    	t.string 	:job_title
    	t.string	:gender
    	t.integer	:age
    	t.string	:ethnicity

      t.timestamps null: false
    end
  end
end
