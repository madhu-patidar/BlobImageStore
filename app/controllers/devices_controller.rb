# Devices Controller
class DevicesController < MainController
  def index
    @devices = Device.all
  end
end
