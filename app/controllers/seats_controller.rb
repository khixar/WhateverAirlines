class SeatsController < ApplicationController
  
  before_action :confirmed_logged_in, :only => [:new]


  def index
  	@seats = Seat.all
  end

  def new
  	@seat =  Seat.new

  	@seat.flight_id = session[:my_flight_id]
    @source = session[:my_flight_source]
    @dest = session[:my_flight_destination]
    @total_seats = session[:my_total_seats]

    
  end

  def create

  	@seat = Seat.new
  	total_fare = params[:total_fare]
    seat_type = params[:seat_type]
    seat_cap = params[:seat_capacity]

    @seat2 = Seat.new
    total_fare2 = params[:total_fare2]
    seat_type2 = params[:seat_type2]
    seat_cap2 = params[:seat_capacity2]

    @seat3 = Seat.new
    total_fare3 = params[:total_fare3]
    seat_type3 = params[:seat_type3]
    seat_cap3 = params[:seat_capacity3]
    

    puts total_fare,seat_type,seat_cap

    puts total_fare2,seat_type2,seat_cap2
    

    @seat.total_fare = total_fare
    @seat.seat_type = seat_type
    @seat.flight_id = session[:my_flight_id]
    @seat.seat_capacity = seat_cap


    @seat2.total_fare = total_fare2
    @seat2.seat_type = seat_type2
    @seat2.flight_id = session[:my_flight_id]
    @seat2.seat_capacity = seat_cap2


    @seat3.total_fare = total_fare3
    @seat3.seat_type = seat_type3
    @seat3.flight_id = session[:my_flight_id]
    @seat3.seat_capacity = seat_cap3


    total_seats = session[:my_total_seats]

    seat_cap = seat_cap.to_i
    total_seats = total_seats.to_i
    puts total_seats.class
    puts seat_cap.class

    if (seat_cap.to_i + seat_cap2.to_i + seat_cap3.to_i) < total_seats.to_i
      puts "here"
      if @seat.save
        session[:economy_class_id] = @seat.id
        puts "seat saved"
        if @seat2.save
          puts "seat2 saved"
          session[:first_class_id] = @seat2.id
          if @seat3.save
            session[:business_class_id] = @seat3.id
            puts "seat3 saved"
            #flash[:notice] = "successful"
            redirect_to (features_new_path)
          else
            puts "seat3 not saving"
            render ('new')
          end
        else
          puts "seat2 not saving"
          render ('new')
        end
      else
        puts "seats not saving"
        #flash.now[:notice] = "errors"
        render('new')
      end


    else
      puts "Total Seats are less than seats_type"
      #flash.now[:notice] = "Toal Seats are less than seats_type"
      render('new')    
    end

  end

  def edit
  end

  def delete
  end


  private

  def seats_params
    params.fetch(:seat,Hash.new).permit(:total_fare, :seat_type, :seat_capacity)        
  end


end
