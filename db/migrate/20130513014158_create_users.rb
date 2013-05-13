class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :gtusername
      t.string :email
      t.string :firstname
      t.string :lastname
      t.boolean :admin

      t.timestamps
    end
  end
end
