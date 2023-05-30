class UsersController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:verfiy_user]

  def index
    @users = User.all
  end  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender)
  end
 	
end
