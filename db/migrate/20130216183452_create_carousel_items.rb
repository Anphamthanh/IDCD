class CreateCarouselItems < ActiveRecord::Migration
  def change
    create_table :carousel_items do |t|
      t.integer :page_carousel_id
      t.integer :page_picture_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
