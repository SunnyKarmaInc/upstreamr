class BartTravelTime < ActiveRecord::Base
  validates :start, :end, :time_in_min, final_stop, presence: true
end
