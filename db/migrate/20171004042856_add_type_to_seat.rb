class AddTypeToSeat < ActiveRecord::Migration[5.1]
  def change
  	add_column :seats, :seat_type, :string
  end
end
