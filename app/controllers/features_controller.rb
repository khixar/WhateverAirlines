class FeaturesController < ApplicationController

before_action :confirmed_logged_in, :only => [:new]


  def index
  	@features = Feature.all
  end

  def new
  	@feature = Feature.new
  end

  def create
  	# saving the feature's logic goes here.
  	@feature = Feature.new
  	description = params[:feature]
  	seat_type = params[:type]

    puts params[:feature]

  	econ = session[:economy_class_id]
  	busi = session[:business_class_id]
  	first = session[:first_class_id]

  	puts description,seat_type,econ,busi,first
    puts params.inspect


  	@feature.description = description


  	if seat_type == "economy"
  		@feature.seat_id = econ
  	elsif seat_type == "business"
  		@feature.seat_id = busi
  	else
  		@feature.seat_id = first
  	end

  	if @feature.save
  		puts "feature saved"
  		#flash[:notice] = "success"
  		redirect_to(features_new_path)
  	else
  		render('new')
  	end

  end

  def edit
    @feature = Feature.all
    @seats = Seat.all
  end

  def add
    @econ = params[:economy1]
    @id = params[:id]
    puts @econ

    if @econ.present?
      @new_feature = Feature.new
      @new_feature.description = @econ
      @new_feature.seat_id = @id
      if @new_feature.save
        puts "success"
        #flash[:notice] = "successfully!!"
        redirect_to features_edit_path
      else
        #flash.now[:notice] = "error"
        render 'edit'
      end

    end



=begin

    flag = false
    @addition = params[:economy]
    @addition1 = params[:business]
    @addition2 = params[:first]

    param_arr1 = []
    param_arr2 = []
    param_arr3 = []

    if params[:tab].present?
      param_arr1 = params[:tab]
    end
    if params[:tab].present?
      param_arr2 = params[:tab1]
    end
    if params[:tab].present?
      param_arr3 = params[:tab2]
    end


    puts params[:tab]
    puts params[:tab1]
    puts params[:tab2]


    puts "addition",@addition

    if @addition.present?
      my_feature = Feature.new
      my_feature.description = @addition
      my_feature.seat_id = 
      if my_feature.save
        flag = true
      end
    end
    if @addition1.present?      
      my_feature = Feature.new
      my_feature.description = @addition1
      if my_feature.save
        flag =  true
      end
    end
    if @addition2.present?      
      my_feature = Feature.new
      my_feature.description = @addition2
      if my_feature.save
        flag =  true
      end
    end  

    if flag == true
      flash[:notice] = "Features saved successfully!!"
      redirect_to features_edit_path
    else
      flash.now[:notice] = "Features not saved!!"
      render 'edit'
    end
=end    
  end

  def delete    
    @feature = Feature.find(params[:id])
    @feature.destroy
    redirect_to(features_edit_path)
  end


  private


  def features_params
    params.require(:feature).permit(:description, :seat_type)        
  end

  def strong_params
    
    params.fetch(:feature,Hash.new).permit(:description)
  end

end
