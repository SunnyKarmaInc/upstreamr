class Station < ActiveRecord::Base
  validates :name, :abbr, presence: true, uniqueness: true


  def self.name_to_abbr(name)
    Bart::Station::LIST.select { |s| s[:name].include?(name) }.first[:id]
  end

  def self.abbr_to_name(abbr)
    Bart::Station::LIST.select { |s| s[:abbr] == abbr }.first[:id]
  end

  # currentDeparture: '17:48',
  # downstreamColor: 'yellow',
  # downstreamDestination: 'ptsb',
  # downstreamArrival: '18:15',
  # chanceOfStand: 'Most likely',
  # chanceOfSeat: 'Likely'
  def self.find_fastest(start, dest)
    bart_station = Bart::Station.new(abbr: start)
    bart_travel_time = BartTravelTime.where(start: start, end: dest)
    return "Incorrect route" if bart_travel_time.nil?
    travel_time = bart_travel_time.first.time_in_min

    final_stops = bart_travel_time.map(&:final_stop)

    next_barts = bart_station.departures.select do |d|
      final_stops.include?(d.destination.abbr)
    end

    next_bart = ''
    next_barts.each_with_index do |line, idx|
      if idx.zero?
        next_bart = line.estimates.first
      elsif next_bart.minutes > line.estimates.first.minutes
        next_bart = line.estimates.first
      end
    end

    fastest = {}

    fastest[:currentDeparture] = (Station.current_time + next_bart.minutes.minutes).strftime("%H:%M")
    fastest[:downstreamColor] = next_bart.color
    fastest[:downstreamDestination] = dest
    fastest[:finalEta] = (Station.current_time + next_bart.minutes.minutes + travel_time.minutes).strftime("%H:%M")
    fastest[:chanceOfStand] = Station.chance_of_stand(start)
    fastest[:chanceOfSeat] = Station.chance_of_seat(start)

    # p fastest
    fastest
  end

  def self.current_time
    Time.now.getlocal('-08:00')
  end

  def self.chance_of_stand(station)
    if Station.current_time.hour > 15 && Station.current_time.hour < 19
      case station
      when 'embr' then 'Unlikely'
      when 'mont' then 'Unlikely'
      when 'powl' then 'Likely'
      when 'civc' then 'Most likely'
      end
    elsif Station.current_time.hour == 15 || Station.current_time.hour == 19
      case station
      when 'embr' then 'Likely'
      when 'mont' then 'Likely'
      when 'powl' then 'Most likely'
      when 'civc' then 'Most likely'
      end
    else
      'Most likely'
    end

  end

  def self.chance_of_seat(station)
    if Station.current_time.hour > 15 && Station.current_time.hour < 19
      case station
      when 'embr' then 'Most unlikely'
      when 'mont' then 'Unlikely'
      when 'powl' then 'Likely'
      when 'civc' then 'Most Likely'
      end
    elsif Station.current_time.hour == 15 || Station.current_time.hour == 19
      case station
      when 'embr' then 'Unlikely'
      when 'mont' then 'Likely'
      when 'powl' then 'Likely'
      when 'civc' then 'Most likely'
      end
    else
      'Most likely'
    end
  end


  # transfer: 'civic',
  # currentDeparture: '17:26',
  # upsteamColor: 'RED',
  # upsteamDestination: 'mlbr',
  # transferArrival: '17:30',
  # transferDeparture: '17:42',
  # downstreamColor: 'YELLOW',
  # downstreamDestination: 'ptsb',
  # finalEta: '18:15',
  # chanceOfStand: 'Most likely',
  # chanceOfSeat: 'Likely'
  def self.find_optimal(start, dest)
    bart_station = Bart::Station.new(abbr: start)

    # find next bart downstream
    # if arrival time < 5min - there is no optimal route

    # find next bart upstream
    # calculate arrival time on each station upstream

    # find same train on ustream strations
    # and calculate departure time on each station upstream

    # select only options that matches arrival <-> departure
    # select last one ( more chances to get a seat)

  end

  def self.find_guaranteed_seat(start, dest)

  end

  # def fastest_travel_time_to(destination)
  #   #get info from table unless can get from BART API
  # end
  #
  # def wait_time(destination)
  #   next_arrival_time(destination) - current_time
  # end
  #
  # def total_travel_time_to(destination)
  #   wait_time(destination) + fastest_travel_time(destination)
  # end
  #
  # def next_arrival(destination)
  #   #logic to determine which line user should get on
  #   #Bart API to determine when next train of that line will arrive
  #   #
  #   #return Hash with
  #   # departure_time ""
  #   #
  # end
  #
  # def travel_time_from(station)
  #   station.total_travel_time_to(self)
  # end

end
