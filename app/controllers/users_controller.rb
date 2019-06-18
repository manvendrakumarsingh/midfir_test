class UsersController < ApplicationController
before_action :require_user_logged_in,only: [:dashboard, :edit, :update]
before_action :user_profile, only: [:profile_details]
	def dashboard
		@pentings = @user.pentings
		render :layout => "website_application"    
	end	

	def edit
      @user
    end

    def update
    	if @user.update_attributes(update_profile_params)
            flash[:success] = 'User Details Updated'
    		redirect_to dashboard_path	
    	else
    		flash[:error] = @user.errors.full_messages.join(', ')
            render :edit
    	end	
    end	

    def profile_details
    	if @artist.present?
    		@artist
    		@pentings = @artist.pentings.where(:is_public=>true)
    		render :layout => "website_application"
    	else
    		flash[:error] = @user.errors.full_messages.join(', ')
            redirect_to root_path	
    	end    	
    end	

    private

    def user_profile
        @artist = User.find(decode_token(params[:id]))
	end

    def update_profile_params
    	params.require(:user).permit(:full_name,:email,:contact_number,:city,:country,:user_name,:password,:about)
    end	

end
