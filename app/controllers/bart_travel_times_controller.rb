class BartTravelTimesController < ApplicationController
  def new
    @bart_travel_time = BartTravelTime.new
    render json: @bart_travel_time
  end

  def create
    bart_travel_time = BartTravelTime.new(bart_travel_time_params)
    render json: bart_travel_time
  end

  def show
    @bart_travel_time = BartTravelTime.find_by_start_and_end(params[:start],
                                                            params[:end])
    render json: @bart_travel_time
  end


  def bart_travel_time_params
    params.require(:bart_travel_time).permit(:start, :end)
  end
end
