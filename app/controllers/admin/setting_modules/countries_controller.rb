class Admin::SettingModules::CountriesController < AdminController
  
  before_action :set_country_id, :only=> [:show, :edit, :update, :destroy]

  def index
  	@countries = Country.select("id, code, name").order("name ASC").paginate(:page => params[:students], :per_page => 10)
  end

  def new
  	@country = Country.new
  end

  def create
  	@country = Country.new(country_params)
  	if @country.save
  		redirect_to "/admin/setting_modules/countries"
  	else
  		render :new
  	end
  end

  def show
  	
  end

  def edit
  	
  end

  def update
  	if @country.update(country_params)
      redirect_to "/admin/setting_modules/countries"
    else
      render :edit
    end
  end

  def destroy
  	@country.destroy
  	redirect_to "/admin/setting_modules/countries"
  end

  private

  def set_country_id
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:code, :name)
  end
  
end
