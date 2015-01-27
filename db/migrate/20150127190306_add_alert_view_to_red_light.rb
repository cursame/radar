class AddAlertViewToRedLight < ActiveRecord::Migration
  def change
    add_column :red_lights, :alert_view, :boolean, default: false
  end
end
