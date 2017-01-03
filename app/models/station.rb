class Station < ActiveRecord::Base
  validates :name, :abbr, presence: true, uniqueness: true


  def self.name_to_abbr(name)
    Bart::Station::LIST.select { |s| s[:name].include?(name) }.first[:id]
  end

  def self.abbr_to_name(abbr)
    Bart::Station::LIST.select { |s| s[:abbr] == abbr }.first[:id]
  end

  def self.transfer_abbr_to_name(abbr)
    case abbr
    when 'mont' then 'Montgomery St.'
    when 'powl' then 'Powel St.'
    when 'civc' then 'Civic Center'
    end
  end


  def self.next_barts(start, dest)
    bart_station = Bart::Station.new(abbr: start)
    bart_travel_time = BartTravelTime.where(start: start, end: dest)

    final_stops = bart_travel_time.map(&:final_stop)

    bart_station.departures.select do |d|
      final_stops.include?(d.destination.abbr) &&
        d.estimates.first.color != 'WHITE'
    end
  end

  # currentDeparture: '17:48',
  # downstreamColor: 'yellow',
  # downstreamDestination: 'ptsb',
  # downstreamArrival: '18:15',
  # chanceOfStand: 'Most likely',
  # chanceOfSeat: 'Likely'
  def self.find_fastest(start, dest)
    bart_travel_time = BartTravelTime.where(start: start, end: dest)
    return "Incorrect route" if bart_travel_time.empty?
    travel_time = bart_travel_time.first.time_in_min

    next_barts = Station.next_barts(start, dest)

    return "No direct Barts" if next_barts.empty?

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
    fastest[:waitTime] = next_bart.minutes
    fastest[:downstreamColor] = next_bart.color
    fastest[:travelTime] = travel_time
    # fastest[:downstreamDestination] = dest
    fastest[:finalEta] = (Station.current_time + next_bart.minutes.minutes + travel_time.minutes).strftime("%H:%M")
    fastest[:chanceOfStand] = Station.chance_of_stand(start)
    fastest[:chanceOfSeat] = Station.chance_of_seat(start)
    fastest[:status] = 'fastest downstream'

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


  def self.find_optimal(start, dest, fastest_downstream)
    best_route = nil
    fastest_arrival_time = fastest_downstream[:finalEta].to_time

    downtown_stations = ['embr', 'mont', 'powl', 'civc']
    upstream_stations =
      downtown_stations.select.with_index do |_, idx|
        idx > downtown_stations.find_index(start)
      end

    upstream_stations.each do |upstream_station|
      p upstream_station

      fastest_upstream = Station.find_fastest(start, upstream_station)
      transfer_arrival_time = fastest_upstream[:finalEta].to_time

      fastest_from_upstream = Station.find_fastest(upstream_station, dest)
      transfer_departure = fastest_from_upstream[:currentDeparture].to_time
      final_arrival_time = fastest_from_upstream[:finalEta].to_time

      p fastest_arrival_time
      p final_arrival_time
      p transfer_departure
      p transfer_arrival_time

      if final_arrival_time <= fastest_arrival_time + 2.minutes &&
          transfer_departure > transfer_arrival_time
        # TODO add wait times to hash
        best_route = {
          transfer: Station.transfer_abbr_to_name(upstream_station),
          currentDeparture: fastest_upstream[:currentDeparture],
          upstreamColor: fastest_upstream[:downstreamColor],
          currentWaitTime: fastest_upstream[:waitTime],
          # upstreamDestination: fastest_upstream[downstreamDestination],
          transferArrival: transfer_arrival_time.strftime("%H:%M"),
          transferDeparture: transfer_departure.strftime("%H:%M"),
          transferWaitTime: fastest_from_upstream[:waitTime] - fastest_upstream[:waitTime] - fastest_upstream[:travelTime],
          downstreamColor: fastest_from_upstream[:downstreamColor],
          # downstreamDestination: fastest_from_upstream[downstreamDestination],
          finalEta: final_arrival_time.strftime("%H:%M"),
          chanceOfStand: fastest_from_upstream[:chanceOfStand],
          chanceOfSeat: fastest_from_upstream[:chanceOfSeat],
          status: 'Catch same bart'
        }
      else
        break
      end
    end
    p best_route
    best_route || "Can not catch the same train upstream"
  end

  def self.find_guaranteed_seat(start, dest)
    p 'Searching for a seat'
    downtown_stations = ['embr', 'mont', 'powl', 'civc']
    upstream_stations =
      downtown_stations.select.with_index do |_, idx|
        idx > downtown_stations.find_index(start)
      end

    upstream_stations.each do |upstream_station|
      p upstream_station

      chance_of_seat = Station.chance_of_seat(upstream_station)
      chance_of_stand = Station.chance_of_stand(upstream_station)

      next if chance_of_seat == 'Most unlikely' ||
              chance_of_seat == 'Unlikely'

      fastest_upstream = Station.find_fastest(start, upstream_station)
      transfer_arrival_time = fastest_upstream[:finalEta].to_time
      transfer_arrival_time_in_minutes =
        ((transfer_arrival_time - Station.current_time) / 60).ceil

      next_barts_now = Station.next_barts(upstream_station, dest)
      next_barts_now.map!(&:estimates).flatten!
      p next_barts_now
      final_bart =
        next_barts_now.sort_by(&:minutes).detect do |bart|
          bart.minutes > transfer_arrival_time_in_minutes
        end

      p final_bart

      return "Can not find seat" if final_bart.nil?

      travel_time =
        BartTravelTime.find_by(start: upstream_station, end: dest).time_in_min

      return {
        transfer: Station.transfer_abbr_to_name(upstream_station),
        currentDeparture: fastest_upstream[:currentDeparture],
        currentWaitTime: fastest_upstream[:waitTime],
        upstreamColor: fastest_upstream[:downstreamColor],
        # upstreamDestination: fastest_upstream[downstreamDestination],
        transferArrival: transfer_arrival_time.strftime("%H:%M"),
        transferDeparture: (Station.current_time + final_bart.minutes.minutes).strftime("%H:%M"),
        transferWaitTime: final_bart.minutes - fastest_upstream[:waitTime] - fastest_upstream[:travelTime],
        downstreamColor: final_bart.color,
        # downstreamDestination: fastest_from_upstream[downstreamDestination],
        finalEta: (Station.current_time + final_bart.minutes.minutes + travel_time.minutes).strftime("%H:%M"),
        chanceOfStand: chance_of_stand,
        chanceOfSeat: chance_of_seat,
        status: 'Guaranteed a seat'
      }
    end

    # Should not be hittable
    "Can not find seat"
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
