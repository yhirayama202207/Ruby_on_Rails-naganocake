class ApplicationController < ActionController::Base
#before_action :configure_permitted_parameters , if: :devise_controller?




  # def configure_permitted_parameters
  # 	  devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  # end

# def after_sign_in_path_for(resource)
#       case resource
#         when Admin
#           admins_path
#         when Customer
#           homes_top_path
# end

# def after_sign_out_path_for(resource)
#       case resource
#         when Admin
#           new_admin_session_path
#         when Customer
#           homes_top_path
# end
# end

private
def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_path
    else
        homes_top_path
    end
end

def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        new_admin_session_path
    else
        homes_top_path
    end
    if resource_or_scope == :admin
        new_admin_session_path
    elsif resource_or_scope == :customer
        homes_top_path
    else
        homes_top_path
    end
end
end
