class StationsController < ApplicationController
  def index
  end

  def directions
    render json: {
                  start: 'embr',
                  destination: 'rock',
                  options: {
                    fastest: {
                      transfer: '',
                      currentDeparture: '17:48',
                      upsteamColor: '',
                      upsteamDestination: '',
                      downstreamColor: 'YELLOW',
                      downstreamDestination: 'ptsb',
                      transferArrival: '',
                      transferDeparture: '',
                      chanceOfStand: 'Most likely',
                      chanceOfSeat: 'Likely',
                      finalEta: '18:15'
                    },

                    optimal: {
                      transfer: 'civic',
                      currentDeparture: '17:26',
                      upsteamColor: 'RED',
                      upsteamDestination: 'mlbr',
                      transferArrival: '17:30',
                      transferDeparture: '17:42',
                      downstreamColor: 'YELLOW',
                      downstreamDestination: 'ptsb',
                      chanceOfStand: 'Most likely',
                      chanceOfSeat: 'Likely',
                      finalEta: '18:15'
                    },

                    guaranteedSeat: {
                      transfer: 'UN Plaza',
                      currentDeparture: '17:30',
                      upsteamColor: 'RED',
                      upsteamDestination: 'mlbr',
                      transferArrival: '17:35',
                      transferDeparture: '17:52',
                      downstreamColor: 'YELLOW',
                      downstreamDestination: 'ptsb',
                      chanceOfStand: 'Most likely',
                      chanceOfSeat: 'Likely',
                      finalEta: '18:25'
                      }
                    }
                  }
  end

  def show
    # @station = Station.find_by_start_and_end(params[:start],
    #                                         params[:end])

  end

  def station_params
    params.require(:station).permit(:start, :end)
  end
end
