class PoliciesController < ApplicationController
  def index
    if logged_in?
      @policies = Policy.includes(:user, policytype: [:company]).all
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def new
    if logged_in?
      @usr = User.find_by(id: current_user.id)
      @policy= Policy.new
	    @c_id = params[:company_id]
	    @p_id = params[:policytype_id]
      @u_id = params[:user_id]
      @pol_id = params[:id]
      @user = current_user
	    if @c_id == nil
	  	  redirect_to policies_select_company_path
	    end
    else
      redirect_to login_path
    end  
  end

  def create
    @policy= Policy.new(policy_params)
    if @policy.save
      redirect_to policies_path 
      flash[:success] = "Policy created!" 
    else
      redirect_back fallback_location: { action: "create" } 
      flash[:danger] = "Fill all compulsory fields! (User and sum insured should not be empty)"
    end
  end

  def show
  end
  def display
    if logged_in?
      @policy = Policy.includes(:user, policytype: [:company]).find_by_id(params[:id])
    else
      redirect_to login_path
    end
  end

  def maturing
    if logged_in?
      @policy = Policy.includes(:user, policytype: [:company]).find_by_id(params[:id])
      @policies = Policy.all  
      @user = current_user
    else
      redirect_to login_path
    end
  end
  
  def policy_email
    PolicyMailer.policy_email().deliver_now
    redirect_back fallback_location: { action: "display" } 
    flash[:success] = "Mail sent successfully"
  end

  def select_company
    if logged_in?
      @allcompany = Company.all
    else
      redirect_to login_path
    end
  end
  def select_plan
    if logged_in?
      @c_id = params[:company_id]
    else
      redirect_to login_path
    end  
	end

  def edit
    if logged_in?
      @policy = Policy.includes(:user, policytype: [:company]).find(params[:id])
      @user = current_user
    else
      redirect_to login_path
    end
  end
  def update
    @policy = Policy.includes(:user, policytype: [:company]).find(params[:id])
    if @policy.update(policy_params)
      redirect_to policies_path    
      flash[:success] = "Policy updated!"
    else
      render 'edit'
    end
  end
  def destroy
    @policy = Policy.includes(:user, policytype: [:company]).find(params[:id])
    @policy.destroy
    redirect_to policies_path
    flash[:success] = "Policy deleted!"
  end

  

  private
  def policy_params
    params.require(:policy).permit(:policy_type,:description,:sum_insured,:premium_amt,:commission, :purchase_date, :mature_date, :user_id,:company_id,:policytype_id, documents: [])
  end
  
end
