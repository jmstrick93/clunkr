class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def prep_flash_errors(object)
    #could be used as helper method
    flash[:error] = []
    object.errors.full_messages.each do |error|
      flash[:error] << error
    end
  end


  def error_count(object)
    #also could be helper
    object.errors.count
  end

end
