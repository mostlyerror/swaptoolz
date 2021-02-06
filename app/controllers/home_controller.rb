class HomeController < ApplicationController
  def index
    @swe = SevereWeatherEvent.current
  end
end
