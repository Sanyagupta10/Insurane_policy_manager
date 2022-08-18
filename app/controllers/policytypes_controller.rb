class PolicytypesController < ApplicationController
  def index
    if logged_in?
      @policytypes= Policytype.all.reorder("Company_id")
      @allcompany= Company.all
    else
      redirect_to login_path
    end
  end

  def show
  end

  def new
    if logged_in?
      @policytype = Policytype.new
      @allcompany = Company.all
    else
      redirect_to login_path
    end
  end

  def create
    @policytype= Policytype.new(policytype_params)
    if @policytype.save
      redirect_to policytypes_path
    else
      render 'new'
  	end
  end

  def edit
    if logged_in?
      @policytype = Policytype.find(params[:id])
      @user = current_user
      @allcompany = Company.all
    else
      redirect_to login_path
    end
  end
  def update
    @policytype = Policytype.find(params[:id])
    if @policytype.update(policytype_params)
      redirect_to policytypes_path, :notice => "plan edited!!" 
    else
      render 'edit'
    end
  end

  def destroy
    @policytype = Policytype.find(params[:id])
    @policytype.destroy
    redirect_to policytypes_path, :notice => "plan deleted"
  end


 private

  def policytype_params
  	params.require(:policytype).permit(:name, :description, :company_id, :duration, :sum_insured, :premium_amt)
  end
end
