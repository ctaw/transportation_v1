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
  		redirect_to "/admin/setting_modules/places"
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
      redirect_to "/admin/setting_modules/places"
    else
      render :edit
    end
  end

  def destroy
  	@place.destroy
  	redirect_to "/admin/setting_modules/places"
  end

  private

  def set_place_id
    @place = Place.find(params[:id])
  end

  def agency_params
    params.require(:place).permit(:country, :description, :address, :lon, :lat)
  end

end
