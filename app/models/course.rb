class Course < ApplicationRecord
  belongs_to :faculty, class_name: 'Faculty', foreign_key: 'faculty_id'
  
  def self.gen_ed_courses
    where(gen_ed: true)
  end
end