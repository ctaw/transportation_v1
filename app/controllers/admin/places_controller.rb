class Admin::PlacesController < AdminController

  before_action :set_place_id, :only=> [:show, :edit, :update, :destroy]

  def index
  	@places = Place.select("id, country, address").order("id DESC")
  end

  def new
  	@place = Place.new
  end

  def create
  	@place = Place.new(place_params)
  	if @place.save
  		redirect_to "/admin/places"
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @place.update(place_params)
      redirect_to "/admin/places"
    else
      render :edit
    end
  end

  def destroy
  	@place.destroy
  	redirect_to "/admin/places"
  end

  private

  def set_place_id
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:country, :address, :description, :address, :latitude, :longitude)
  end

end
