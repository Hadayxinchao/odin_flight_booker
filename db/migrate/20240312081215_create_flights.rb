class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.date :start_date
      t.integer :duration

      t.timestamps
    end
  end
end
