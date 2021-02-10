class HomeController < ApplicationController
  def index
    @swe = SevereWeatherEvent.current
    if current_user.roles_name.include? 'admin'
      render plain: 'admin'
    elsif current_user.roles_name.include? 'front_desk'
      render plain: 'motel'
    end
  end
end
