require 'rails_helper'

RSpec.describe "FacultyCourse Index", type: :feature do
  describe "As a visitor" do
    describe "When I visit /faculty/:faculty_id/courses" do
      it "displays each faculty course record in the system" do

        faculty_1 = Faculty.create(name: "Mr. Fernando Cantillo")
        course_1 = Course.create(course_name: "Data Structures")
        course_2 = Course.create(course_name: "Big Data")
        faculty_course_1 = FacultyCourse.create(faculty_id: faculty_1.id, course_id: course_1.id)
        faculty_course_2 = FacultyCourse.create(faculty_id: faculty_1.id, course_id: course_2.id)

        visit "/faculties/#{faculty_1.id}/courses"

        expect(page).to have_content(course_1.course_name)
        expect(page).to have_content(course_2.course_name)
      end
    end
  end
end