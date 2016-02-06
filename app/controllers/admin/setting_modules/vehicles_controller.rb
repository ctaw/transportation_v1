class Admin::SettingModules::VehiclesController < AdminController

  before_action :set_vehicle_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
  	@vehicles = Vehicle.select("id, name, type_of_vehicle_id").order("name ASC")
  end

  def new
  	@vehicle = Vehicle.new
  end

  def create
  	@vehicle = Vehicle.new(vehicle_params)
  	if @vehicle.save
  		redirect_to "/admin/setting_modules/vehicles"
  	else
  		render :new
  	end
  end

  def show
    @fares = Fare.where(:type_of_vehicle_id => @vehicle.type_of_vehicle_id)
  end

  def edit
  end

  def update
  	if @vehicle.update(vehicle_params)
      redirect_to "/admin/setting_modules/vehicles"
    else
      render :edit
    end
  end

  def destroy
  	@vehicle.destroy
  	redirect_to "/admin/setting_modules/vehicles"
  end

  private

  def set_vehicle_id
    @vehicle = Vehicle.find(params[:id])
  end

  def look_ups
    @type_of_vehicles = TypeOfVehicle.select("id, name").order("name ASC")
    @agencies = Agency.select("id, name").order("name ASC")
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :description, :agency_id, :type_of_vehicle_id)
  end

end
