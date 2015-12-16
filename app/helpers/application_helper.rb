module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end

  def resource_class
    devise_mapping.to
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def format_date(date)
    return date.blank? ? "" : date.strftime("%B %d, %Y")
  end

  def today_date
    DateTime.now.to_date
  end
  
end
