class SiteController < ApplicationController
  #define the layout
  #inside views/layouts/site.html.slim
  layout 'site'

  autocomplete :place, :address, :full => true


  def index
  	@places = Place.all
     if params[:search]
      @places = Place.name_like("%#{params[:search]}%").order('name')
    else
    end
  end

end
