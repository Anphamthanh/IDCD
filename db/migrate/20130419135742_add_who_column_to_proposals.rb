class AddWhoColumnToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :who, :text
  end
end
