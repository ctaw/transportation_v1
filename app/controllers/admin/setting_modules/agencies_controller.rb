class Admin::SettingModules::AgenciesController < AdminController

  before_action :set_agency_id, :only=> [:show, :edit, :update, :destroy]

  def index
  	@agencies = Agency.select("id, name, description").order("id DESC")
  end

  def new
  	@agency = Agency.new
  end

  def create
  	@agency = Agency.new(agency_params)
  	if @agency.save
  		redirect_to "/admin/setting_modules/agencies"
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @agency.update(agency_params)
      redirect_to "/admin/setting_modules/agencies"
    else
      render :edit
    end
  end

  def destroy
  	@agency.destroy
  	redirect_to "/admin/setting_modules/agencies"
  end

  private

  def set_agency_id
    @agency = Agency.find(params[:id])
  end

  def agency_params
    params.require(:agency).permit(:name, :description)
  end

end
