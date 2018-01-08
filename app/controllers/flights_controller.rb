class FlightsController < ApplicationController
  
before_action :admin_logged_in, :only => [:new, :show]


  def show
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end


  def create
  	#creating a flight logic goes here

  	puts session[:id]

    @flight = Flight.new#(flight_params) 
    #user_id = params[:user_id]
    total_seats = params[:total_seats]
    time_of_travel = params[:time_of_travel]
    source = params[:source]
    destination = params[:destination]


    @flight.total_seats = total_seats
    @flight.time_of_travel = time_of_travel
    @flight.source = source
    @flight.destination = destination
    
    #puts @flight.time_of_travel
    #puts @flight.source
    #puts @flight.destination
    
    if @flight.save!
      #flash[:notice] = "Flight saved successfully!"
      session[:my_flight_id] = @flight.id
      session[:my_flight_source] = @flight.source
      session[:my_flight_destination] = @flight.destination
      session[:my_total_seats] = @flight.total_seats

      puts session[:my_flight_id]
      puts session[:my_flight_source]
      puts session[:my_flight_destination]
      puts session[:my_total_seats]

      redirect_to(seats_new_path)
    else
      #flash.now[:notice] = "errors"
      render 'create'
    end

  end



  def delete
    @flight = Flight.find(params[:id])
    @flight.destroy   
    respond_to do |format|
      format.html { redirect_to flights_show_path }
      format.json { head :no_content }
      format.js   { }
    end
  end

  private

  def flight_params
    params.fetch(:flight,Hash.new).permit(:total_seats, :time_of_travel, :source, :destination)        
  end

  def seats
  	params.require(:flight).permit(:total_seats)
  end


end
