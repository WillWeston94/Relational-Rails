class Faculties < ActiveRecord::Migration[7.0]
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :department
      t.string :email
      t.string :phone
      t.boolean :office_hours
      t.string :years_instructing

      t.timestamps
    end
  end
end