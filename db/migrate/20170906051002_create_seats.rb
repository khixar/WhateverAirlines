class CreateSeats < ActiveRecord::Migration[5.1]
  def change
    create_table :seats do |t|
    	t.integer "flight_id"
    	t.string "source"
    	t.string "destination"
    	t.integer "total_fare"


      t.timestamps
    end
    add_index("seats", "flight_id")
  end
end
