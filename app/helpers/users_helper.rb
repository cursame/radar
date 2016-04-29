module UsersHelper
  def options_for_institutions_select
    current_institution = @user.institution.try(:id)
    options_for_select(institutions_options, current_institution)
  end

  def institutions_options
    Institution.all.collect { |inst| [inst.title, inst.id] }
  end

  def options_for_denouncer_gender_select
    options_for_select(denouncer_genders_options)
  end

  def denouncer_genders_options
    Denouncer.genders.map { |key, _| [I18n.t("user_genders.#{key}"), key] }
  end
end
