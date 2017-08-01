class StaticPagesController < ApplicationController
layout "employee", only: [:employee]



  def home
  end

  def faq
  end

  
end