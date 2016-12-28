class CreateUpdateStationTables < ActiveRecord::Migration
  def change
    create_table :update_station_tables do |t|

      t.timestamps null: false
    end
  end
end
