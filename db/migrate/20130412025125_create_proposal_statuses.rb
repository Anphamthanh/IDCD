class CreateProposalStatuses < ActiveRecord::Migration
  def change
    create_table :proposal_statuses do |t|
      t.integer :group_id
      t.integer :proposal_status_type_id
      t.integer :proposal_id

      t.timestamps
    end
  end
end
