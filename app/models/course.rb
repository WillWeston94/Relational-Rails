class Course < ApplicationRecord
  belongs_to :faculty, class_name: 'Faculty', foreign_key: 'faculty_id'
end