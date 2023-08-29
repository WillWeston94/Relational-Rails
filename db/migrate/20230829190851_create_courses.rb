class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :professor
      t.string :course_name
      t.boolean :gen_ed
      t.integer :credits
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
