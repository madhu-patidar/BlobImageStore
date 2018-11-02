module Api
  module V1
    # Sessions Controller
    class TrainingSessionsController < ApiController
      before_action :validate_session_params, except: [:login, :create, :upload_image]

    def create
      session = create_or_update_session(params)
      render json: { data: {session_id: session.id }, status: 200 }
    end

    def upload_image
      session = Session.find params[:session][:session_id]
      image_store = ImageStore.create(session_id: session.id, image: params[:session][:image], url: params[:session][:url])
      render json: { message: 'Successfully uploded imagge', status: 200 }
    end

    def login
      userName = 'neosoft';
      password = '1234567';
      if(params[:userName] == userName && params[:password] == password )
        render json: { message: 'Successfully Loged in', logedIn: true, status: 200 }
      else
         render json: { message: 'Invalid credential', logedIn: false, status: 401 }
      end
      
    end

    private

      def create_or_update_session(params)
        # TO DO ME
        params[:user_id] = '3'
        params[:user_email] = 'mm@gmail.com'
        if params[:session_id].present? && params[:training_status] == 'end'
          session = Session.find(params[:session_id])
          session.end_time = DateTime.now
          session.save
        else
          session = Session.create(start_time: DateTime.now, user_id: params[:user_id], user_email:params[:user_email] )
        end
        session
         # render json: { message: 'Successfully session start' status: 200 }
      end

      def validate_session_params
        if params_missing?(params[:session], [:session_id, :image, :url])
          # missing parameter
          render json: @error_hash, status: 400
        end
      end

      def session_params
        params.require(:session).permit(:session_id, :image, :time, :url)
      end
    end
  end
end
