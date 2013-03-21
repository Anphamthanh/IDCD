class CreateProjectStatuses < ActiveRecord::Migration
  def change
    create_table :project_status_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
