class AddSampleDiagnosticCodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :diagnostic_code, :string
  end
end
