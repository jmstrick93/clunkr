class HomeController < ApplicationController

  def root
    redirect_to cars_path
  end

end
