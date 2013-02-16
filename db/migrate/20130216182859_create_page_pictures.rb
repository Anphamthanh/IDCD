class CreatePagePictures < ActiveRecord::Migration
  def change
    create_table :page_pictures do |t|
      t.string :name
      t.string :picture

      t.timestamps
    end
  end
end
