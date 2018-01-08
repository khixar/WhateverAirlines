class AddColumnToSeats < ActiveRecord::Migration[5.1]
  
  def change
  	add_column :seats, :seat_capacity, :string
  end

end
