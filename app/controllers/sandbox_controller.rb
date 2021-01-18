class SandboxController < ApplicationController
  def index; end
  def hello_react; end
  def photo; end
  def websockets_react; end

  def motels
    @motels = Motel.all
  end

  def severe_weather_events
    @severe_weather_events = SevereWeatherEvent.all
  end

  def voucher_applications
    @voucher_applications = VoucherApplication.all
  end

end
