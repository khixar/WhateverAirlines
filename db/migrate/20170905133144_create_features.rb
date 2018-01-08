class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
    	t.integer "seat_id"
    	t.string "description"

      	t.timestamps
    end
    add_index("features","seat_id")
  end
end
