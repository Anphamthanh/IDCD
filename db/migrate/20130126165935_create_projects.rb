class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :background
      t.text :concept
      t.text :design
      t.text :skills
      t.text :solutions
      t.boolean  "nda_required"
      t.boolean  "funding_commitment"
      t.integer  "company_id"
      t.string   "form"
      t.integer :status_id

      t.timestamps
    end
  end
end
