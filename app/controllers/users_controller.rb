class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy



  def new
  	@user = User.new
  end


  def show
    @user = User.find(params[:id])
    @community = @user.community_id
  end



  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user	
      redirect_to communities_path
    else
    render 'new'
     end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end



  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end




  def in_it
    @user = User.find(current_user.id)
    @community_id = params[:community_id] 
    @user.update_attribute(:community_id, @community_id)
    @user.save
    redirect_to :back
  end

  def average_internet
    @users = User.all
  end


  def auth
    @user = User.new
  end


  private
  

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :address_line_one, :address_line_two, :city, :state, :zip_code, :internet_type, :internet_speed, :monthly_cost, :community_name, :community_id)
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