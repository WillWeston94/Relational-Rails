class FacultyCourse < ApplicationRecord
  belongs_to :faculty
  belongs_to :course
end