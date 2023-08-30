class ConnectCoursesToFaculty < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :faculty, foreign_key: true
  end
end
