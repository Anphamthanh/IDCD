class CreatePageCarousels < ActiveRecord::Migration
  def change
    create_table :page_carousels do |t|
      t.string :name

      t.timestamps
    end
  end
end
