class CreateFacultyCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :faculty_courses do |t|
      t.references :faculty, foreign_key: true
      t.references :course, foreign_key: true
      
      t.timestamps
    end
  end
end
