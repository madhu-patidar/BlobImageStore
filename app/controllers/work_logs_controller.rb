# Image Stores Controller
class WorkLogsController < MainController
  def index
    if params[:session_id].present?
      session = Session.find(params[:session_id])
      # @image_stores = session.image_stores
      @work_logs = session.work_logs.paginate(:page => params[:page], :per_page => 6)
    else
      # @work_logs = ImageStore.all
      @work_logs = WorkLog.paginate(:page => params[:page], :per_page => 6)
    end
  end

  def show
    @work_log = WorkLog.find(params[:id])
  end
end