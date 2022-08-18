class DashBoardController < ApplicationController
 
  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def admin
    if !current_user.admin?
      redirect_to dash_board_customer_path 
      flash[:danger] = "You are not an admin"
    end
  end

  def customer
  end
end
