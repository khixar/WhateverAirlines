class ChangeDatatypeOfFlight < ActiveRecord::Migration[5.1]
  def change
  	change_column :flights, :time_of_travel, :date
  end
end
