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
    flights_query = []
    is_searched = false
    if params[:departure_airport_id].present?
      if is_searched && flights_query.empty?
        return nil
      else
        if flights_query.any?
          flights_query = flights_query.where(departure_airport_id: params[:departure_airport_id])
        else
          flights_query = Flight.all.where(departure_airport_id: params[:departure_airport_id])
        end
        is_searched = true
      end
    end

    if params[:arrival_airport_id].present?
      if is_searched && flights_query.empty?
        return nil
      else
        if flights_query.any?
          flights_query = flights_query.where(arrival_airport_id: params[:arrival_airport_id])
        else
          flights_query = Flight.all.where(arrival_airport_id: params[:arrival_airport_id])
        end
        is_searched = true
      end
    end

    if params[:start_date].present?
      if is_searched && flights_query.empty?
        return nil
      else
        if flights_query.any?
          flights_query = flights_query.where(start_date: params[:start_date])
        else
          flights_query = Flight.all.where(start_date: params[:start_date])
        end
        is_searched = true
      end
    end
    flights_query
  end
end
