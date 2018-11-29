module Api
  module V1
    # Sessions Controller
		class IdleTimesController < ApiController
			def create
	      idle_time = create_or_update(params)
	      render json: { data: {idle_time_id: idle_time.id }, status: 200 }
	    end

	    private

	      def create_or_update(params)
	        # TO DO ME
	        if params[:idle_time_id].present? && params[:idle_status] == 'end'
	          idle_time = IdleTime.find(params[:idle_time_id])
	          idle_time.end_time = DateTime.now
	          idle_time.save
	        else
	          idle_time = IdleTime.create(start_time: DateTime.now, session_id: params[:session_id])
	        end
	        idle_time
	      end

	      def idle_time_params
	        params.require(:idle_time).permit(:session_id, :end_time, :start_time)
	      end

		end
	end
end	