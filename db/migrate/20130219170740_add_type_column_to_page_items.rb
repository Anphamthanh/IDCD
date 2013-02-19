class AddTypeColumnToPageItems < ActiveRecord::Migration
  def change
    add_column :page_items, :type, :string
  end
end
