class ChangeInFlight < ActiveRecord::Migration[5.1]
  def change
  	
  	add_column :flights, :source, :string
  	add_column :flights, :destination, :string

  	remove_column :seats, :source
  	remove_column :seats, :destination
  	
  end
end
