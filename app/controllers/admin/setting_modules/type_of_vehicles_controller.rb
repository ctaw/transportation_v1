class Admin::SettingModules::TypeOfVehiclesController < AdminController

  before_action :set_type_of_vehicle_id, :only=> [:show, :edit, :update, :destroy]

  def index
  	@type_of_vehicles = TypeOfVehicle.all
  end

  def new
  	@type_of_vehicle = TypeOfVehicle.new
  end

  def create
  	@type_of_vehicle = TypeOfVehicle.new(type_of_vehicle_params)
  	if @type_of_vehicle.save
  		redirect_to "/admin/setting_modules/type_of_vehicles"
  	else
  		render :new
  	end
  end

  def show

  end

  def edit

  end

  def update
  	if @type_of_vehicle.update(type_of_vehicle_params)
      redirect_to "/admin/setting_modules/type_of_vehicles"
    else
      render :edit
    end
  end

  def destroy
  	@type_of_vehicle.destroy
  	redirect_to "/admin/setting_modules/type_of_vehicles"
  end

  private

  def set_type_of_vehicle_id
    @type_of_veihicle = TypeOfVehicle.find(params[:id])
  end

  def type_of_vehicle_params
    params.require(:type_of_vehicle).permit(:name, :description)
  end

end
