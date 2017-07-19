class StaticPagesController < ApplicationController
layout "employee", only: [:employee]



  def home
  end
end