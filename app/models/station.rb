class Station < ActiveRecord::Base
  validates name, abbr, presence: true, uniqueness: true

  def fastest_travel_time(destination)
    #amount of time it takes from door shut to door open
  end

  def current_time
    Time.now.getlocal('-08:00')
  end

  def wait_time(destination)
    next_arrival_time(destination) - current_time
  end

  def total_travel_time(destination)
    wait_time(destination) + fastest_travel_time(destination)
  end

  def next_arrival_time(destination)
    #logic to determine which line user should get on
    #Bart API to determine when next train of that line will arrive
  end


end
