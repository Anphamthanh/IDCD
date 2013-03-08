class CreateTableFacultySections < ActiveRecord::Migration
  def up
    create_table :faculty_sections do |t|
      t.integer :faculty_id
      t.integer :section_id

      t.timestamps
    end
  end

  def down
    drop_table :faculty_sections
  end
end
