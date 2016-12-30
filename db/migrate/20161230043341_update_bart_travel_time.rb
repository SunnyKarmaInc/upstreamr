class UpdateBartTravelTime < ActiveRecord::Migration
  def change
    add_column :bart_travel_times, :final_stop, :string
  end
end
