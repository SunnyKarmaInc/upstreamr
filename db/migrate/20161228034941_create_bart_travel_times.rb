class CreateBartTravelTimes < ActiveRecord::Migration
  def change
    create_table :bart_travel_times do |t|
      t.string :start, null: false
      t.string :end, null: false
      t.integer :time_in_min, null: false

      t.timestamps null: false
    end
  end
end
