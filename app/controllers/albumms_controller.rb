class AlbummsController < ApplicationController

  # GET /albumms
  # GET /albumms.json
  def index
    @albumms = Albumm.all
  end

  # GET /albumms/1
  # GET /albumms/1.json
  def show
      arr = []      
      param = params[:id]
      @album = Albumm.where(artistid: param.to_s)
      @data = JSON.parse(@album.to_json(only: [:id, :name, :image, :spotify_url, :total_tracks, :spotify_id, :artistid]))
      arr.push(@data)       
      render json: "{data:#{arr}}"
    rescue ActiveRecord::RecordNotFound => e
      logger.info e
      return render json: { message: 'artist is not found' }, status: :not_found 
    rescue => e
      logger.info e
      return render json: { message: 'Is there an error. Try again' }, status: :not_found     
  end

  # POST /albumms
  # POST /albumms.json
  def create
    @albumm = Albumm.new(albumm_params)

    if @albumm.save
      render :show, status: :created, location: @albumm
    else
      render json: @albumm.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_albumm
      @albumm = Albumm.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def albumm_params
      params.require(:albumm).permit(:name, :image, :spotify_url, :total_tracks, :spotify_id, :artistid)
    end
end
