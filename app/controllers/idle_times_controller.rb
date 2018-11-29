class IdleTimesController < ApplicationController
	def index
		@idleTimes = IdleTime.paginate(:page => params[:page], :per_page => 10)
	end
end

