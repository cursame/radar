class SuperadminController < ApplicationController
  layout 'superadmin'
  def statistics
    @users = User.count
    @institutions = Institution.count
    @red_lights = 50
    @moderadas = 10
    @medias = 20
  end
end