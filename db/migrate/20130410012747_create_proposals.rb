class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :proposal_status_type_id
      t.integer :project_id
      t.integer :group_id

      t.timestamps
    end
  end
end
