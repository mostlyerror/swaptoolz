class HomeController < ApplicationController
  def index
    @swe = SevereWeatherEvent.current
    @participation = current_user.motel.participating?(@swe)
  end
end
