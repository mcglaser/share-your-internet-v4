class ReferralsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]





 def new
    @referral = Referral.new
  end





  def show
    @referral = Referral.find(params[:id])
    @user = current_user
  end



  def create
    @referral = Referral.new(referral_params)
    if @referral.save
      redirect_to root_url
    else
    render 'new'
     end
  end

  def edit
    @referral = Referral.find(params[:id])
  end

  def update
    @referral = Referral.find(params[:id])
    if @creferral.update_attributes(referral_params)
      redirect_to @referral
    else
      render 'edit'
    end
  end


  def index
    @user = current_user
    @referrals = Referral.all
  end





  def destroy
    Referral.find(params[:id]).destroy
    flash[:success] = "referral deleted"
    redirect_to referrals_url
  end


  

  private
  

    def referral_params
      params.require(:referral).permit(:ref_first_name, :ref_last_name, :ref_address_line_one, :ref_address_line_two)
    end


  def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end



end