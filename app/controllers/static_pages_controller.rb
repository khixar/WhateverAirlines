class StaticPagesController < ApplicationController


  def home
  end

  def book
  end

  def search
  #getting users params here
    @depart = params[:departure]
    @arrival = params[:arrival]
    @seat_type = params[:seat_type]
    @date = params[:date]
    @pass = params[:passenger]
    puts @depart,@arrival,@seat_type,@date

    session[:depart] = @depart
    session[:arrival] = @arrival
    session[:seat_type] = @seat_type
    session[:date] = @date

    found_source = 0

    if params[:departure].present? && params[:arrival].present? && 
      params[:seat_type].present? && params[:date].present?
      found_source = Flight.where(:source => params[:departure], :destination => params[:arrival],
                                  :time_of_travel => params[:date]).all
    else
      render('book')
    end

    #puts found_source.id
    my_seat_id = 0
    my_flight_id = 0
    found = false
 
    found_source.each do |flight|
      puts "flight_id",flight.id
      flight.seats.each do |seat|
        puts "seat_type",seat.id
        if seat.seat_type == @seat_type
          my_seat_id = seat.id
          found = true
          break
        end
      end
      my_flight_id = flight.id
      
      break
    end

    if found == false
      flash[:notice] = "flight not found!"
      return redirect_to :action => 'book'
    end

    if my_flight_id == 0
      flash[:notice] = "flight not found!"
      return redirect_to :action => 'book'
    end


    @check_flight = Flight.find(my_flight_id)
    @check_seat = Seat.find(my_seat_id)
    puts "seat_capacity", @check_seat.seat_capacity
    temp = ""
    
    if @check_seat.seat_capacity.to_i > @pass.to_i
      puts "seat available for this seat_type"
      puts @check_seat.seat_capacity.class
      temp = @check_seat.seat_capacity
      temp = temp.to_i
      puts temp.class
      @pass = @pass.to_i
      puts @check_seat.seat_capacity.class
      puts @pass.class
      temp -= @pass
      puts temp
      temp = temp.to_s
      puts temp.class
      @check_seat.seat_capacity = temp
      puts @check_seat.seat_capacity      
      @check_seat.save
    else
      puts "not enough seats"
      flash[:notice] = "Not enough Seats for this seat Type"
      return redirect_to :action => 'book'
    end

    @total_fare = @check_seat.total_fare * @pass.to_i


    @found_flight

    if found_source
      puts "flight founded!"
      @found_flight = found_source
      render('search')
    else
      puts "flight not found!"
      render('book')
    end

  
  end

  def itinerary

    @itin = Flight.find(params[:id])
    @seat = Seat.find(params[:seat_id])
    @fare = params[:total_fare]
    puts '----------', @itin.id
    puts "---------",@seat.id
    puts "---------",@fare

    session[:my_itin] = @itin
    session[:my_seat_itin] = @seat
    session[:my_seat_fare] = @fare



  end

  def info
    @info_itin = session[:my_itin]
    @info_seat = session[:my_seat_itin]
    @info_fare = session[:my_seat_fare]

    puts '----------', @info_itin
    puts "---------",@info_seat
    puts "---------",@info_fare

  end

  def create
    
    @name = params[:name]
    @email = params[:email]

    #call action mailer here.



    UserMailer.welcome_email(@email).deliver_later

    redirect_to(static_pages_home_path)



    
  end





  def features
    @features = Feature.all    
  end


  private

  def search_params
    params.fetch(:seat,Hash.new).permit(:total_fare, :seat_type, :seat_capacity)        
  end

end
