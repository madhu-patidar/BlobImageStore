# Sessions Controller
class TrainingSessionsController < MainController
  def index
  	if params.present? && params[:user_email].present?
      @sessions = Session.where(user_email: params[:user_email]).paginate(:page => params[:page], :per_page => 10)
  	else
      # @sessions = Session.all
    	@sessions = Session.paginate(:page => params[:page], :per_page => 10)
    end
    @users = Session.distinct.pluck('user_email')
    respond_to do |format|
      format.html
      format.js
    end
  end
end
