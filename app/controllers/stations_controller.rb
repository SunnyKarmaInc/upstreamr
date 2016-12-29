class StationsController < ApplicationController
  def index
  end

  def show
    # @station = Station.find_by_start_and_end(params[:start],
    #                                         params[:end])
    render json: {
                  start: 'embr',
                  end: 'rock',
                  options: {
                    fastest: {
                      transfer: '',
                      currentDeparture: '17:48',
                      upsteamColor: '',
                      upsteamDestination: '',
                      downstreamColor: 'yellow',
                      downstreamDestination: 'ptsb',
                      transferArrival: '',
                      transferDeparture: '',
                      chanceOfStand: 'Most likely',
                      chanceOfSeat: 'Likely'
                    },

                    optimal: {
                      transfer: 'civic',
                      currentDeparture: '17:26',
                      upsteamColor: 'red',
                      upsteamDestination: 'mlbr',
                      transferArrival: '17:30',
                      transferDeparture: '17:42',
                      downstreamColor: 'yellow',
                      downstreamDestination: 'ptsb',
                      chanceOfStand: 'Most likely',
                      chanceOfSeat: 'Likely'
                    },

                    guaranteedSeat: {
                      transfer: 'UN Plaza',
                      currentDeparture: '17:30',
                      upsteamColor: 'red',
                      upsteamDestination: 'mlbr',
                      transferArrival: '17:35',
                      transferDeparture: '17:52',
                      downstreamColor: 'yellow',
                      downstreamDestination: 'ptsb',
                      chanceOfStand: 'Most likely',
                      chanceOfSeat: 'Likely'
                      }
                    }
                  }
  end

  def station_params
    params.require(:station).permit(:start, :end)
  end
end
