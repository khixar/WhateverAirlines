class ApplicationController < ActionController::Base 
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  
  #include ActionController::RequestForgeryProtection
  #include ActionController::HttpAuthentication::Token::ControllerMethods
  #include ActionController::HttpAuthentication::Basic::ControllerMethods
  #include ActionController::MimeResponds
  #include ActionController::Cookies
  #include ActionView::Layouts

  #protect_from_forgery unless: -> { request.format.json? }
  private

  def confirmed_logged_in
    unless session[:id] 
      flash[:notice] = "Please login!"
      redirect_to(airline_admin_index_path)
    end
  end

  def admin_logged_in
  	unless session[:id] == 1
  		redirect_to(errors_show_path)
  	end
  end

  def manager_logged_in	
  	unless session[:id] == 2
  		redirect_to(errors_show_path)
  	end
  end

end
