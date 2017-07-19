class RolodexesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy


  def show
    @rolodex = Rolodex.find(params[:id])
   # if @rolodex.referrals.last.try(:nickname)
    #  @recipe.referrals.build
  #  end
  end

  def index
    @rolodexes = Rolodex.all
    #@rolodex_id = rolodex.id
  end

  def new
    @rolodex = Rolodex.new
    1.times { @rolodex.referrals.build }
  end

  def create
    @user = current_user
    @rolodex = Rolodex.create(rolodex_params)
    if @rolodex.save
      redirect_to user_rolodex_path(@user.id, @rolodex.id)
    else
    render 'new'
     end
  end


  def update
    @user = current_user
    @rolodex = Rolodex.find(params[:id])
    @rolodex.update(rolodex_params)
    redirect_to user_rolodex_path(current_user.id, @rolodex.id)
  end

  private

  def rolodex_params
    params.require(:rolodex).permit(:nickname, referrals_attributes: [:ref_first_name, :ref_last_name, :ref_address_line_one, :ref_address_line_two, :rolodex_id])
  end
end


def logged_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

  def correct_user
    @user = current_user
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end