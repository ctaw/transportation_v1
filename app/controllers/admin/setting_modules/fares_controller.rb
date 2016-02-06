class Admin::SettingModules::FaresController < AdminController

  before_action :set_fare_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
  	@fares = Fare.select("id, amount, type_of_vehicle_id, distance").order("id DESC")
  end

  def new
  	@fare = Fare.new
  end

  def create
  	@fare = Fare.new(fare_params)
  	if @fare.save
  		redirect_to "/admin/setting_modules/fares"
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @fare.update(fare_params)
      redirect_to "/admin/setting_modules/fare"
    else
      render :edit
    end
  end

  def destroy
  	@fare.destroy
  	redirect_to "/admin/setting_modules/fare"
  end

  private

  def look_ups
    @type_of_vehicles = TypeOfVehicle.select("id, name").order("name ASC")
  end

  def set_fare_id
    @fare = Fare.find(params[:id])
  end

  def fare_params
    params.require(:fare).permit(:amount, :description, :distance, :type_of_vehicle_id)
  end

end
