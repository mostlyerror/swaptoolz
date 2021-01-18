class SandboxController < ApplicationController
  def index; end
  def hello_react; end
  def photo; end
  def websockets_react; end

  def motels
    @motels = Motel.all
  end
end
