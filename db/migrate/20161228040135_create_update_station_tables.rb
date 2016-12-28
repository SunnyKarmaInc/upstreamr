class CreateUpdateStationTables < ActiveRecord::Migration
  def change
    create_table :update_station_tables do |t|
      add_column :stations, :name, :string
      add_column :stations, :abbr, :string

      t.timestamps null: false
    end
  end
end
