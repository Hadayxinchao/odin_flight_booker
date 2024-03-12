class FlightsController < ApplicationController
  def index
    @available_dates = Flight.pluck(:start_date).map(&:to_date).uniq
    @num_passengers = params[:num_passengers]
    @flights = query_flights
    @airport_options = Airport.all.map{ |u| [ u.code, u.id ] }
  end

  private

  def flight_params
    params.require(:flight)
        .permit(:departure_airport_id, :arrival_airport_id, :num_passengers, :start_date)
  end

  def query_flights
    flight_query = []
    if params[:departure_airport_id].present?
      if flight_query.any?
        flight_query = flight_query.where(departure_airport_id: params[:departure_airport_id])
      else
        flight_query = Flight.all.where(departure_airport_id: params[:departure_airport_id])
      end
    end

    if params[:arrival_airport_id].present?
      if flight_query.any?
        flight_query = flight_query.where(arrival_airport_id: params[:arrival_airport_id])
      else
        flight_query = Flight.all.where(arrival_airport_id: params[:arrival_airport_id])
      end
    end

    if params[:start_date].present?
      if flight_query.any?
        flight_query = flight_query.where(start_date: params[:start_date])
      else
        flight_query = Flight.all.where(start_date: params[:start_date])
      end
    end
    flight_query
  end
end
