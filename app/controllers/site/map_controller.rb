class Site::MapController < SiteController

  def index
    @start = params[:search_start]
    @end = params[:search_destination]
  end

end
