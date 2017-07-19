class CommunitiesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy



  def new
  	@community = Community.new
  end


  def show
    @community = Community.find(params[:id])
    @user = current_user
  end



  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to @community
    else
    render 'new'
     end
  end

  def edit
    @community = Community.find(params[:id])
  end

  def update
    @community = Community.find(params[:id])
    if @community.update_attributes(community_params)
      redirect_to @community
    else
      render 'edit'
    end
  end


  def index
    @communities = Community.all
  end





  def destroy
    Community.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to communities_url
  end


  

  private
  

    def community_params
      params.require(:community).permit(:community_name, :community_address, :community_city, :community_state, :community_zip)
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