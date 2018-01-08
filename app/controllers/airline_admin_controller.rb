class AirlineAdminController < ApplicationController

#befor admin logged in . write in the flights controller


  
  def index
  	#login logic goes here.()
  	
    if params[:username].present? && params[:password].present?
      if params[:username] != "manager" && params[:password] != "manager"
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
      #flash[:notice] = "Admin Logged in!"
      #redirect_to(flights_create_path)
      redirect_to(flights_new_path)
    else
      #flash.now[:notice] = "invalid login/password"
      render 'index'
    end


  end

  def create
  end

  def update
  end

  def destroy
    session[:id] = nil
    redirect_to(static_pages_home_path)
  end


end
