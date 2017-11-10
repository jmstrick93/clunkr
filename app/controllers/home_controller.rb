class HomeController < ApplicationController

  def root
    # binding.pry
    redirect_to cars_path
  end

end
