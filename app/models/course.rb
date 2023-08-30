class Course < ApplicationRecord
  belongs_to :faculty, class_name: 'Faculty', foreign_key: 'faculty_id'
  has_many :faculty_courses

  # validates_presence_of :professor
  validates_presence_of :course_name
  # validates_presence_of :gen_ed
  validates_presence_of :credits
  validates_presence_of :start_date
  validates_presence_of :end_date

  def self.gen_ed_courses
    where(gen_ed: true)
  end
end