class ApplicationController < ActionController::Base
  #before_action login_before if devise_for?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
      customer_path(resource)
  end

  def after_sign_out_path_for(resource)
    if resource == :customer
      root_path
    else
      new_admin_session_path
    end
  end

def after_sign_in_path_for(resource)
 stored_location_for(resource) ||
  if resource.is_a?(Customer)
    customer_path(resource)
  elsif resource.is_a?(Admin)
    admin_root_path
  else
    super
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end

end
