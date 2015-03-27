class ProfilesController < ApplicationController
  def edit
  	unless user_signed_in?
  		flash[:error] = 'You must be signed in to view your profile.'
  		redirect_to root_path
  	end
  	@user = current_user
  	@profile = @user.profile || Profile.new({ user: @user })
  end

  def create
  	user = current_user
  	user.update_without_password(user_params)
  	
  	profile = current_user.profile || Profile.new(profile_params)
  	profile.new_record? ? success = profile.save : success = profile.update(profile_params)
  	 
  	if (success)
  		flash[:notice] = 'Profile updated successfully.'
  		redirect_to root_path
  	else
  		render action: :edit
  	end
  end

  private 
  	def user_params
  		params.require(:user).permit(:firstname, :lastname)
  	end

  	def profile_params
  		params.require(:profile).permit(:age, :address, :bio)
  	end
end
