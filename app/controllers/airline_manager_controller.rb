class AirlineManagerController < ApplicationController

before_action :manager_logged_in, :except => [:index]
  
  def index

    puts "index"
    puts "params",params[:username],params[:password]

    if params[:username].present? && params[:password].present?
    	if params[:username] != "admin" && params[:password] != "admin"
	      found_user = User.where(:username => params[:username]).first
	      if found_user
	        auth_user = User.where(:password => params[:password]).first
	      end
	    end    
    end




    if auth_user
      puts "session",session[:id]
      puts "auth_user",auth_user.id
      session[:id] = auth_user.id
      #flash[:notice] = "Manager's Logged In!"
      #redirect_to(flights_create_path)
      redirect_to(airline_manager_price_path)
    else
      puts "Incorrect!!!"

      #flash.now[:error] = "Incorrect username/password"
      render 'index'
    end

  end


  def edit
  	@flight = params[:foo_params]
  	@req_flight = Flight.find(@flight)

  	#puts "-------------",@flight
  	#puts "params",params[:foo_params]
  	#puts "id",@flight.id
  
  end

  def update
  	#updation of prices and saving it into the db logic goes here.

  	@flight = params[:name]
  	puts "@flight",@flight
  	puts "params",params[:name]
  	@flight1 = Flight.find(@flight)

  	@econ = params[:total_fare1]
  	@first = params[:total_fare2]
  	@busi = params[:total_fare3]

  	puts "prices------------",@econ,@busi,@first

  	@econ_seat = @flight1.seats.first
  	@first_seat = @flight1.seats.second
  	@busi_seat = @flight1.seats.third

    flag = 0

  	if @econ.present?
  		@econ_seat.total_fare = @econ
  		if @econ_seat.save
        flag += 1
  			puts "economy"
  		end
  	end
	  if @first.present?
  		@first_seat.total_fare = @first
  		if @first_seat.save
        flag += 1
  			puts "first"
  		end
  	end
	  if @busi.present?
  		@busi_seat.total_fare = @busi
  		if @busi_seat.save
  			flag += 1
        puts "business"
  		end
  	end

    if flag == 3
      #flash[:notice] = "All Prices has been Updated"
    elsif flag == 2
      #flash[:notice] = "Two Prices has been Updated"
    elsif flag == 1
      #flash[:notice] = "Only one Price has been Updated"
    else
      #flash[:notice] = "No price has been updated"
    end
    
  	redirect_to(airline_manager_price_path)


  end

  def price
  	#showing prices and approval logic goes here.

  	@flights = Flight.all
  	@my_seat_id = 0

  end

  def approve
  end

  def destroy
    session[:id] = nil
    redirect_to(static_pages_home_path)
  end

  private

  def price_params
    params.fetch(:Seat,Hash.new).permit(:total_fare)        
  end




end
