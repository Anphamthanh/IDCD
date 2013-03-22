class CreateProjectSchoolsTable < ActiveRecord::Migration
  def up
    create_table :project_schools do |t|
      t.integer :project_id
      t.integer :school_id

      t.timestamps
    end
  end

  def down
  end
end
