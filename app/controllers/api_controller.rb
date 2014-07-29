class ApiController < ApplicationController
  def documentation_methods
  end

  def register_by_api
  end

  def create_user_for_api(name, email, charge, password, terms_of_service)
  end

  def create_institution_and_user(name, url, user_id)
  end

  def acces_to_red_lights
  	@user = User.find_by_institution_email(params[:institution_code])
  	@institution = Institution.find_by_tokenspecialviews_and_user_id(params[:token], @user.id)
    @red_lights = @institution.red_lights
  end

end
