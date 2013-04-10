class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :propsal_status_type_id
      t.integer :project_id

      t.timestamps
    end
  end
end
