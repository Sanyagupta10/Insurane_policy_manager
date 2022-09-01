class PoliciesController < ApplicationController
  def index
	  if logged_in?
      @policies = Policy.includes(:user, policytype: [:company]).all
      @user = current_user
    else
      redirect_to login_path
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
    if current_user.admin?
      redirect_to policies_path
    else
      redirect_to policies_path
    end
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
      if current_user.admin?
        redirect_to policies_path
      else
        redirect_to policies_path
      end
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

  def new
    if logged_in?
      @usr = User.find_by(id: current_user.id)
      @policy= Policy.new
      # user = User.new do |u|
      #   u.name = "David"
      #   u.occupation = "Code Artist"
      # end
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
      if current_user.admin?
        redirect_to policies_path
      else
        redirect_to policies_path
      end
      flash[:success] = "Policy created!" 
    else
      redirect_to new_policy_path
      flash[:danger] = "Policy could not be saved please enter all the details"
    end
  end

  private
  def policy_params
    params.require(:policy).permit(:policy_type,:description,:sum_insured,:premium_amt,:commission, :purchase_date, :mature_date, :user_id,:company_id,:policytype_id, documents: [])
  end
end
