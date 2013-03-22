class CreateProjectStatuses < ActiveRecord::Migration
  def change
    create_table :project_statuses do |t|
      t.integer :project_id
      t.integer :project_status_type_id
      t.integer :semester_id

      t.timestamps
    end
  end
end
