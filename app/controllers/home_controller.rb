class HomeController < ApplicationController

  def index
    @users=Customer.all
  end

end
