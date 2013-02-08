class AddColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :status_id, :integer
  end
end
