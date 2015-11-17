class SuperadminController < ApplicationController
  layout 'superadmin'
  def statistics
    @institutions = Institution.count
    @users = User.count
    @complaints = 0
    @low_danger_complaints = 0
    @middle_danger_complaints = 0
    @high_danger_complaints = 0
  end
end