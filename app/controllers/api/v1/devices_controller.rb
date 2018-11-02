module Api
  module V1
    # Devices Controller
    class DevicesController < ApiController
      before_action :validate_device_params

      def create
        device = create_or_update_device(params[:device])
        session = create_or_update_session(device, params[:device])
        render json: { data: { mac_id: device.mac_id, session_id: session.id }, status: 200 }
      end

      private

        def create_or_update_session(device, params)
          if params[:session_id].present? && params[:training_status] == 'end'
            session = Session.find(params[:session_id])
            session.end_time = DateTime.now
            session.save
          else
            session = Session.create(device_id: device.id, start_time: DateTime.now)
          end
          session
        end

        def create_or_update_device(params)
          mac_id = params[:mac_id]
          device = Device.find_or_create_by(mac_id: mac_id)
          device.name = params[:name] if params[:name].present?
          device.ip = params[:ip] if params[:ip].present?
          device.save
          device
        end

        def validate_device_params
          if params_missing?(device_params, [:mac_id, :training_status])
            # missing parameter
            return render json: @error_hash, status: 400
          end

          if device_params[:session_id].nil? && device_params[:training_status] == 'end'
            return render json: { error: 'Session Id should be present', status: 400 }
          end

          unless ['start', 'end'].include?(device_params[:training_status])
            render json: { error: 'Training status should be start or end', status: 400 }
          end
        end

        def device_params
          params.require(:device).permit(:name, :mac_id, :ip, :training_status, :session_id)
        end
    end
  end
end
