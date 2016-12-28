class BartTravelTime < ActiveRecord::Base
  validates :start, :end, :time_in_min, presence: true
end
