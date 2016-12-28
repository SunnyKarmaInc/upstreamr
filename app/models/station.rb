class Station < ActiveRecord::Base
  validates name, abbr, presence: true, uniqueness: true

  def fastest_travel_time_to(destination)
    #get info from table unless can get from BART API
  end

  def current_time
    Time.now.getlocal('-08:00')
  end

  def wait_time(destination)
    next_arrival_time(destination) - current_time
  end

  def total_travel_time_to(destination)
    wait_time(destination) + fastest_travel_time(destination)
  end

  def next_arrival_time(destination)
    #logic to determine which line user should get on
    #Bart API to determine when next train of that line will arrive
  end

  def travel_time_from(station)
    station.total_travel_time_to(self)
  end

end
