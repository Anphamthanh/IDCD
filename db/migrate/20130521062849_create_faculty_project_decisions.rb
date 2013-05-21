class CreateFacultyProjectDecisions < ActiveRecord::Migration
  def change
    create_table :faculty_project_decisions do |t|
      t.integer :faculty_id
      t.integer :project_id

      t.timestamps
    end
  end
end
