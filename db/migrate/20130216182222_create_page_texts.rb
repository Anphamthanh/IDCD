class CreatePageTexts < ActiveRecord::Migration
  def change
    create_table :page_texts do |t|
      t.text :description

      t.timestamps
    end
  end
end
