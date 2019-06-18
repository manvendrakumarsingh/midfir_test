class HomeController < ApplicationController
	 def welcome
      @users = get_all_users()
      
    end
end
