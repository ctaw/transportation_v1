class Admin::SettingModules::VehiclesController < AdminController

  before_action :set_vehicle_id, :only=> [:show, :edit, :update, :destroy]

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

  def vehicle_params
    params.require(:vehicle).permit(:name, :description, :fare_id, :type_of_vehicle_id)
  end

end
