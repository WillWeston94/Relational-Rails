class Faculty < ApplicationRecord
  has_many :courses, foreign_key: 'faculty_id'
  has_many :faculty_courses

  validates_presence_of :name
  validates_presence_of :department
  validates_presence_of :email
  validates_presence_of :phone
  validates_presence_of :office_hours
  validates_presence_of :years_instructing

  def self.faculties_by_created_at
    Faculty.order(created_at: :desc)
  end

  def course_count 
    self.courses.count
  end

  def self.order_by_count
    Faculty.joins(:courses).group(:id).order('count(courses.id) desc')
  end

  def courses_alphabetical
    self.courses.order(:name)
  end
end
