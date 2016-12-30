class Station < ActiveRecord::Base
  validates :name, :abbr, presence: true, uniqueness: true

  # transfer: '',
  # currentDeparture: '17:48',
  # upsteamColor: '',
  # upsteamDestination: '',
  # downstreamColor: 'yellow',
  # downstreamDestination: 'ptsb',
  # downstreamArrival: '18:15',
  # transferArrival: '',
  # transferDeparture: '',
  # chanceOfStand: 'Most likely',
  # chanceOfSeat: 'Likely'
  def self.find_fastest(start, dest)
    bart_station = Bart::Station.new(abbr: start)
    bart_travel_time = BartTravelTime.find_by(start: start, end: dest)
    return "Incorrect route" if bart_travel_time.nil?
    travel_time = bart_travel_time.time_in_min

    # TODO uncomment when BartTravelTime model will have destination info
    final_destination = bart_travel_time.final_destination
    # final_destination = 'rich'

    next_bart = bart_station.departures.select do |d|
      d.destination.abbr == final_destination
    end.first.estimates.first

    p next_bart

    fastest = {}

    fastest[:currentDeparture] = Station.current_time + next_bart.minutes.minutes
    fastest[:downstreamColor] = next_bart.color
    fastest[:downstreamDestination] = dest
    fastest[:finalEta] = fastest[:currentDeparture] + travel_time.minutes
    fastest[:chanceOfStand] = Station.chance_of_stand(start)
    fastest[:chanceOfSeat] = Station.chance_of_seat(start)

    # p fastest
    fastest
  end

  def self.current_time
    Time.now.getlocal('-08:00')
  end

  def self.chance_of_stand(station)
    case Station.current_time.hour
    when 7, 10, 15, 19 then 'Likely'
    when 8..9, 16..18 then 'Unlikely'
    else 'Most likely'
    end
  end

  def self.chance_of_seat(station)
    case Station.current_time.hour
    when 7, 10, 15, 19 then 'Unlikely'
    when 8..9, 16..18 then 'Most unlikely'
    else 'Likely'
    end
  end

  def fastest_travel_time_to(destination)
    #get info from table unless can get from BART API
  end

  def wait_time(destination)
    next_arrival_time(destination) - current_time
  end

  def total_travel_time_to(destination)
    wait_time(destination) + fastest_travel_time(destination)
  end

  def next_arrival(destination)
    #logic to determine which line user should get on
    #Bart API to determine when next train of that line will arrive
    #
    #return Hash with
    # departure_time ""
    #
  end

  def travel_time_from(station)
    station.total_travel_time_to(self)
  end

end
