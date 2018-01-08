class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|

      t.integer "user_id"    	
    	t.integer "total_seats"
    	t.datetime "time_of_travel"

      t.timestamps
    end
    add_index("flights", "user_id")
    
  end
end
