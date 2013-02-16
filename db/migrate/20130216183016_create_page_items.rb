class CreatePageItems < ActiveRecord::Migration
  def change
    create_table :page_items do |t|
      t.integer :page_id
      t.integer :item_id

      t.timestamps
    end
  end
end
