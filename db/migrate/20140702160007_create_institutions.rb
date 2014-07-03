class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :url
      t.string :tokenspecialforms
      t.string :tokenspecialviews
      t.integer :user_id

      t.timestamps
    end
  end
end
