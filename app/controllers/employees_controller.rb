class EmployeesController < ApplicationController
 layout "employee"


  def index
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
     log_in @employee
     redirect_to @employee
  end
 
  def auth
    request.env['omniauth.auth']
  end





end