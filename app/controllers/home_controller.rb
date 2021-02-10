class HomeController < ApplicationController
  def index
    @swe = SevereWeatherEvent.current
    
    if current_user.is_admin?
      render plain: 'admin'
    elsif current_user.is_motel?
      render plain: 'motel'
    end
  end
end
