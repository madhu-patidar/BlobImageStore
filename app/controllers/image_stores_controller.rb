# Image Stores Controller
class ImageStoresController < MainController
  def index
    if params[:session_id].present?
      session = Session.find(params[:session_id])
      # @image_stores = session.image_stores
      @image_stores = session.image_stores.paginate(:page => params[:page], :per_page => 6)
    else
      # @image_stores = ImageStore.all
      @image_stores = ImageStore.paginate(:page => params[:page], :per_page => 6)
    end
  end
end