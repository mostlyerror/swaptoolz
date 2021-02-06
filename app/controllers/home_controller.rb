class HomeController < ApplicationController
  def index
    @swe = SevereWeatherEvent.last
  end
end
