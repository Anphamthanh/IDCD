class CreatePageHeadings < ActiveRecord::Migration
  def change
    create_table :page_headings do |t|
      t.string :title

      t.timestamps
    end
  end
end
