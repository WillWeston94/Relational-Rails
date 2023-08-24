class Faculty < ApplicationRecord
  has_many :courses, foreign_key: 'faculty_id'

  validates :office_hours, inclusion: [true, false] 
end
