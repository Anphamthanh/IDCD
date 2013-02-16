class CreatePageSubheadings < ActiveRecord::Migration
  def change
    create_table :page_subheadings do |t|
      t.string :title

      t.timestamps
    end
  end
end
