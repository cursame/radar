class CreateEvidenceLinks < ActiveRecord::Migration
  def change
    create_table :evidence_links do |t|
      t.string :url, null: false
      t.references :user_survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
