class UserMailer < ApplicationMailer
	default from: 'khizarislam98@gmail.com'	

	def welcome_email(customer)
		@customer = customer
		mail to: @customer, subject: "Itinerary Information"
		
		#get the itinerary information here somehow.

	end

end
