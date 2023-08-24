class Faculty < ApplicationRecord
  has_many :courses, foreign_key: 'faculty_id'
end
