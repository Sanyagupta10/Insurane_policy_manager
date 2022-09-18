class PolicytypesController < ApplicationController
  def index
    if logged_in?
      @policytypes = Policytype.includes(:company).all.reorder('Company_id')
      @allcompany = Company.all
    else
      redirect_to login_path
    end
  end

  def show; end

  def new
    if logged_in?
      @policytype = Policytype.new
      @allcompany = Company.all
    else
      redirect_to login_path
    end
  end

  def create
    @policytype = Policytype.new(policytype_params)
    if @policytype.save
      redirect_to policytypes_path
      flash[:success] = 'Plan created!'
    else
      render 'new'
    end
  end

  def edit
    if logged_in?
      @policytype = Policytype.includes(:company).find(params[:id])
      @user = current_user
      @allcompany = Company.all
    else
      redirect_to login_path
    end
  end

  def update
    @policytype = Policytype.includes(:company).find(params[:id])
    if @policytype.update(policytype_params)
      redirect_to policytypes_path
      flash[:success] = 'Edit Successful!'
    else
      render 'edit'
    end
  end

  def destroy
    @policytype = Policytype.includes(:company).find(params[:id])
    @policytype.destroy
    redirect_to policytypes_path
    flash[:success] = 'Plan deleted!'
  end

  private

  def policytype_params
    params.require(:policytype).permit(:name, :description, :company_id, :duration, :sum_insured, :premium_amt)
  end
end
