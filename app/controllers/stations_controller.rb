class StationsController < ApplicationController
  def index
  end

  def directions
    @start_abbr = Station.name_to_abbr(params[:start])
    @dest_abbr = Station.name_to_abbr(params[:end])

    @start = params[:start]
    @dest = params[:end]
    # Should be something like
    # Station.find_fastest(start: @start, end: @end)
    # And it should return Hash
    @fastest = Station.find_fastest(@start_abbr, @dest_abbr)

    # Should be something like
    # Station.find_optimal(start: @start, end: @end)
    # And it should return Hash
    @optimal = {
      transfer: 'civic',
      currentDeparture: '17:26',
      upsteamColor: 'red',
      upsteamDestination: 'mlbr',
      transferArrival: '17:30',
      transferDeparture: '17:42',
      downstreamColor: 'yellow',
      downstreamDestination: 'ptsb',
      finalEta: '18:15',
      chanceOfStand: 'Most likely',
      chanceOfSeat: 'Likely'
    }

    # Should be soething like
    # If Optimal chanceOfSeat is bad then
    # Station.find_guaranteed_seat(start: @start, end: @end)
    # And it should return Hash
    @guaranteed_seat = {
      transfer: 'UN Plaza',
      currentDeparture: '17:30',
      upsteamColor: 'red',
      upsteamDestination: 'mlbr',
      transferArrival: '17:35',
      transferDeparture: '17:52',
      downstreamColor: 'yellow',
      downstreamDestination: 'ptsb',
      finalEta: '18:25',
      chanceOfStand: 'Most likely',
      chanceOfSeat: 'Likely'
    }

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
