class AddSectionToUser < ActiveRecord::Migration
  def change
    add_column :users, :section_id, :integer
  end
end
