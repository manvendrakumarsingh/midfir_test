module SessionsHelper

	def get_user_details email
		User.find_user_details(email)
	end	

	def get_all_users
		User.all
	end	
end
