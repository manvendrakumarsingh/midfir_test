class SessionsController < ApplicationController


	def login
		begin
			@user = get_user_details(params[:email])
			if @user && (@user ? @user.valid_password?(params[:password]) : false)
				session[:user_id]= @user.id
				redirect_to dashboard_path
			else
				flash[:error]="Unauthorised Access !!"
				redirect_to root_path				
			end	
		rescue Exception => e
			flash[:error]="#{e}"
			redirect_to root_path
		end		 
	end

	def registration
		user_validate = get_user_details(params[:user][:email])
		if !user_validate
			@user = User.new(sign_up_params)
			if @user.save
				p @user
				session[:user_id]= @user.id
				redirect_to dashboard_path
			else
				flash[:error] = @user.errors.full_messages.join(', ')
	    	redirect_to root_path
	    end	
	  else
			flash[:error] = "The username or email already exists. Please use a different username or email!!"
	   	redirect_to root_path
	  end  
	end	

	def logout
		session[:user_id]=nil
		flash[:success]="You have successfully signout !"
		redirect_to root_path
	end

	private
    def sign_up_params
      params.require(:user).permit(:full_name,:email,:contact_number,:city,:country,:user_name,:password)
    end
end
