class ApplicationController < ActionController::Base
  #before_action login_before if devise_for?
  
  def after_sign_out_path_for(resource)
      new_admin_session_path
  end
  
  def after_sign_up_path_for(resource)
      customer_path
  end
  
end
