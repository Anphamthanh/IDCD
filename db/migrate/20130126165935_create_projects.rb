class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :background
      t.text :concept
      t.text :design
      t.text :skills
      t.text :solutions
      t.boolean  "nda_required", :default => false
      t.boolean  "funding_commitment", :default => false
      t.integer  "company_id"
      t.string   "form"
      t.integer "semester_id"
      t.integer "submitter_id"
      t.integer "project_status_id", :default => 1

      t.timestamps
    end
  end
end
