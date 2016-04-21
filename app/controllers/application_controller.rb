class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user.has_role? :superadmin
      manage_root_path
    elsif current_user.has_role? :admin
      manage_institution_path(current_institution)
    else
      root_path
    end
  end

  def current_institution
    current_user ? current_user.institution : subdomain_intitution
  end

  def subdomain_intitution
    Institution.find_by_subdomain(request.subdomain)
  end
end
