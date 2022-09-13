class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  before_action :authorized_user, only: [:create, :new]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end    
  
  def index
    @users = User.all
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
     
     
      if logged_in?
        UserMailer.welcome_email(@user).deliver_now
        flash[:success] = "User created and welcome mail sent!"
        redirect_to users_path
        # @user.send_password_reset_email
        # UserMailer.password_reset(@user).deliver_now
      else
        log_in @user 
        # flash[:success] = "Sign Up Successful!"
        redirect_to dash_board_customer_path
      end
    
    else
     render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end    

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.save
      flash[:success] = "Profile updated"
      redirect_to @user      
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :contact_number, :address, :password,
                                   :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end
  
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def authorized_user
      unless logged_in? == false || current_user.admin?
        redirect_to(root_url)
        flash[:danger] = "Not Authorized!!"
      end
    end
        
  
end
