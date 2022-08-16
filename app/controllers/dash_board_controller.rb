class DashBoardController < ApplicationController
 
  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def admin
    redirect_to(root_url) unless current_user.admin?
  end

  def customer
  end
end
