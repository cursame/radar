module UsersHelper
  def options_for_institutions_select
    current_institution = @user.institution.try(:id)
    options_for_select(institutions_options, current_institution)
  end

  def institutions_options
    Institution.all.collect { |inst| [inst.title, inst.id] }
  end
end
