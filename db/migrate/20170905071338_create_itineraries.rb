class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
    	t.integer "flight_id"
    	t.string "stop_location"
    	t.integer "stop_num"
    	t.datetime "duration"

      	t.timestamps	
    end
    add_index("itineraries",'stop_location')
    add_index("itineraries", 'flight_id')
  end
end
