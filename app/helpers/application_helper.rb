module ApplicationHelper
	require 'preventapi'
	include Preventapi
	include SessionsHelper
	
	def user_log_in?
  		@user = User.find(session[:user_id]) if session[:user_id].present?
	end

	def require_user_logged_in
		unless user_log_in?
			flash[:error]="You need to login first"
			redirect_to root_path
		end
	end

	def country_name country_code
    	country = ISO3166::Country[country_code]
    	country.translations[I18n.locale.to_s] || country.name
  end
end
