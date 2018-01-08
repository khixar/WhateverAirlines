module Api
	module V1
		class FlighterController < ActionController::Base
			
		  def show
		    @flight = Flight.find(params[:id])
		    render json: @flight
		  end

		  def index
		    @flights = Flight.all
		      render json: @flights 
		  end

		  def search
		  	@source = params[:source]
		  	@dest = params[:destination]

		  	@flight = Flight.where(:source => @source, :destination => @dest).first

		  	#if flight is null look for other params and then return render etc...
		  	if @flight.nil?
		  		@flight1 = Flight.where(:id => @source, :time_of_travel => @dest).first		  		
		  	else
		  		@price = []
		  		@flight.seats.each do |a|
		  			@price.push(a.total_fare)
		  		end
		  		return render json: "economy => #{@price.first}\nbusiness => #{@price.second}\nfirst => #{@price.third} "	
		  	end

		  	if @flight1.nil?
		  		return render json: "invalid query"
		  	else
		  		@seat_arr = []
		  		@flight1.seats.each do |s|
		  			@seat_arr.push(s.seat_capacity)
		  		end

		  		

		  		return render json: "economy => #{@seat_arr[0]}\nfirst => #{@seat_arr[1]}\nbusiness => #{@seat_arr[2]} "
		  		#@checker = JSON.pretty_response(@flight1.total_seats)
		  		#return render json: @checker #it should not return total_seats but 
		  		#different seats_class
		  	end

		  end

		  def seats
		  	
		  	id = params[:id]
		  	date = params[:date]

		  	@flight = Flight.where(:id => id, :time_of_travel => date).first

			render json: @flight.total_seats		  	
		  end

		end
	end
end