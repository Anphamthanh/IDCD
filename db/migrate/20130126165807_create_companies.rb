class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :semester_id
      t.string :technical_name
      t.string :technical_designation
      t.string :technical_email
      t.string :technical_phone
      t.string :director_name
      t.string :director_designation
      t.string :director_email
      t.string :director_phone

      t.timestamps
    end
  end
end
