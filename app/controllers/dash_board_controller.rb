class DashBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def admin
    if logged_in?
      unless current_user.admin?
        redirect_to dash_board_customer_path
        flash[:danger] = 'You are not an admin'
      end
    else
      redirect_to login_path
      flash[:danger] = 'Please log in!'
    end
  end

  def customer
    if logged_in?
      redirect_to dash_board_admin_path if current_user.admin?
    else
      redirect_to login_path
      flash[:danger] = 'Please log in!'
    end
  end
end
