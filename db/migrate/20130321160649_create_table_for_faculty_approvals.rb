class CreateTableForFacultyApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :faculty_id
      t.integer :project_id

      t.timestamps
    end
  end
end
