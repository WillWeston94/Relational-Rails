require 'rails_helper'

RSpec.describe "Faculty_Courses New", type: :feature do
  before(:each) do
    @faculty_1 = Faculty.create!(name: "Mr. Fernando Cantillo", department: "Computer Science Information", email: "FCantillo@edu.com", phone: "(918)548-4000", office_hours: true, years_instructing: 18)
  end

  describe "User Story 13" do
    describe "When I visit faculty_courses new page" do
      it " has a link to add a new course for that faculty called 'Add Course'" do

        visit "/faculties/#{@faculty_1.id}/courses/new"

        expect(page).to have_field("professor")
        expect(page).to have_field("course_name")
        expect(page).to have_field("gen_ed")
        expect(page).to have_field("credits")
        expect(page).to have_field("start_date")
        expect(page).to have_field("end_date")

      end
    end
  end
end