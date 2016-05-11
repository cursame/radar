module DenouncersHelper
  def options_for_groups_select
    grouped_options_for_select(groups_options)
  end

  def groups_options
    @grades = current_institution.grades.collect.reject { |g| g.groups.blank? }
    @groups = @grades.map do |grade|
      [grade.title, grade.groups.map do |group|
        [group.title, group.id]
      end
      ]
    end
  end
end
