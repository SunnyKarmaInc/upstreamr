class StationsController < ApplicationController
  def index
  end
#### happy new year -Dan 1/1/2017
  def directions
    @start_abbr = Station.name_to_abbr(params[:start])
    @dest_abbr = Station.name_to_abbr(params[:end])

    @start = params[:start]
    @dest = params[:end]
    # Should be something like
    # Station.find_fastest(start: @start, end: @end)
    # And it should return Hash
    @fastest = Station.find_fastest(@start_abbr, @dest_abbr)

    if @fastest.is_a?(String)
      render :directions
      return
    end

    # Should be something like
    # Station.find_optimal(start: @start, end: @end)
    # And it should return Hash
    # @optimal = {
    #   transfer: 'civic',
    #   currentDeparture: '17:26',
    #   upsteamColor: 'RED',
    #   upsteamDestination: 'mlbr',
    #   transferArrival: '17:30',
    #   transferDeparture: '17:42',
    #   downstreamColor: 'YELLOW',
    #   downstreamDestination: 'ptsb',
    #   finalEta: '18:15',
    #   chanceOfStand: 'Very likely',
    #   chanceOfSeat: 'Likely'
    # }
    @optimal =
      if @fastest[:waitTime] < 5
        "Cannot catch the same train upstream"
      else
        Station.find_optimal(@start_abbr, @dest_abbr, @fastest)
      end

    # Should be soething like
    # If Optimal chanceOfSeat is bad then
    # Station.find_guaranteed_seat(start: @start, end: @end)
    # And it should return Hash
    # @guaranteed_seat = {
    #   transfer: 'UN Plaza',
    #   currentDeparture: '17:30',
    #   upstreamColor: 'RED',
    #   upstreamDestination: 'mlbr',
    #   transferArrival: '17:35',
    #   transferDeparture: '17:52',
    #   downstreamColor: 'YELLOW',
    #   downstreamDestination: 'ptsb',
    #   finalEta: '18:25',
    #   chanceOfStand: 'Very likely',
    #   chanceOfSeat: 'Likely'
    # }
    @guaranteed_seat =
      if @optimal.is_a?(String) ||
           @optimal[:chanceOfSeat] != 'Very likely' 

        Station.find_guaranteed_seat(@start_abbr, @dest_abbr)
      else
        "Optimal is guaranteed seat"
      end

    render :directions
  end

  def show
    # @station = Station.find_by_start_and_end(params[:start],
    #                                         params[:end])

  end

  def station_params
    params.require(:station).permit(:start, :end)
  end
end
